#!/bin/bash

# Path to the passwd file
passwd_file="/etc/passwd"

# Path to the users file
users_file="$(dirname "$0")/authorized_users"

# Get a list of users with user id 1000 or more from /etc/passwd
users_with_uid_1000=$(awk -F: '$3 >= 1000 {print $1}' "$passwd_file")

# Check if each user in users_with_uid_1000 is in the users file
for user in $users_with_uid_1000; do
    if ! grep -q "^$user$" "$users_file"; then
        echo "$user"
    fi
done

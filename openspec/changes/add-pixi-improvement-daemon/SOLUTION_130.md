# Solution for Task: Add keyboard shortcut for toggle

[Context]
Change ID: add-pixi-improvement-daemon
Task: Add keyboard shortcut for toggle

Planning Scope:
1. Create a file path in the "system/config" directory
2. Modify the "geometry_os_config.json" file by adding a new key (e.g. "toggle_key") and setting its value to "/usr/local/bin/pixtool"
3. Run a shell script that monitors the keyboard events and sends a signal to the pixtool daemon when a key is pressed
4. Update the "geometry_os_config.json" file with the modified key path (e.g. "/usr/local/bin/pixtool")
5. Add a 'Next Step' command for the user (e.g. Run `sudo systemctl restart geometry-os`)

Step 1: Create File Paths

Create a new file in the "system/config" directory with the following content:

```
{
    "toggle_key": "/usr/local/bin/pixtool",
    "geometry_os_config.json": ""
}
```

Replace `/usr/local/bin/pixtool` with your desired path for pixtool (e.g. "/home/pi/pixtool").

Step 2: Modify "geometry_os_config.json" File

Edit the "geometry_os_config.json" file to include the new key and value:

```
{
    ...
    "toggle_key": "/usr/local/bin/pixtool",
    ...
}
```

Replace `/usr/local/bin/pixtool` with your desired path for pixtool (e.g. "/home/pi/pixtool").

Step 3: Run Shell Script Monitoring Keyboard Events

Execute a shell script that monitors keyboard events and sends a signal to the pixtool daemon when a key is pressed:

```
#!/bin/bash

# Set the key path to monitor
KEY_PATH="/usr/local/bin/pixtool"

# Define the signal we want to send
SIGNAL="KeyPress"

# Define the time between polling the keyboard
POLL_TIME=0.5

# Loop until a key is pressed or timeout occurs
while [ true ]
do
    # Monitor keyboard events
    read -t $POLL_TIME key <<< "$KEY_PATH"

    # Check if we received a key press
    if [[ -n "$key" ]]
    then
        # Send signal to pixtool daemon
        /usr/local/bin/sudo systemctl restart geometry-os > /dev/null 2>&1
        break
    fi
done
```

Replace `/usr/local/bin/pixtool` with your desired path for pixtool (e.g. "/home/pi/pixtool").

Step 4: Run Shell Script Sending Signal to Pixtool Daemon

Execute the shell script and update the "geometry_os_config.json" file with the modified key path:

```
#!/bin/bash

# Set the key path to monitor
KEY_PATH="/usr/local/bin/pixtool"

# Define the signal we want to send
SIGNAL="KeyPress"

# Define the time between polling the keyboard
POLL_TIME=0.5

# Loop until a key is pressed or timeout occurs
while [ true ]
do
    # Monitor keyboard events
    read -t $POLL_TIME key <<< "$KEY_PATH"

    # Check if we received a key press
    if [[ -n "$key" ]]
    then
        # Send signal to pixtool daemon
        sudo systemctl restart geometry-os > /dev/null 2>&1
        break
    fi
done
```

Replace `/usr/local/bin/pixtool` with your desired path for pixtool (e.g. "/home/pi/pixtool").

Step 5: Add 'Next Step' Command to the 'geometry_os_config.json' File

Finally, update the "geometry_os_config.json" file with the modified key path and add a 'Next Step' command for the user:

```
{
    ...
    "toggle_key": "/usr/local/bin/pixtool",
    ...
}
```

Replace `/usr/local/bin/pixtool` with your desired path for pixtool (e.g. "/home/pi/pixtool").

Note: You may need to update the "geometry_os_config.json" file after adding a 'Next Step' command.
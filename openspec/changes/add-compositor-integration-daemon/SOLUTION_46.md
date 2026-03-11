# Solution for Task: Implement message parsing and routing

[Your Name]
[Your Organization]

[Context: Change ID: add-compositor-integration-daemon]

Task: Implement message parsing and routing

Introduction:
The [OpenSpec Task] aims to provide a concretely implemented message parsing and routing solution for Geometry OS. This task requires the implementation of a daemon that handles incoming messages from external sources such as mobile apps, wearables, and IoT devices. The daemon should be able to parse the data received through the message format provided by the OpenSpec Task.

Furthermore, the daemon needs to be able to route the messages to appropriate destinations based on their type and context. For example, if a message is from an external app, it will need to be passed to the appropriate module or process that handles that particular application's behavior. Similarly, if a message is sent from the wearable device, it will need to be routed to the appropriate sensor/camera that can handle its data.

File Paths:
1. A python file containing the necessary modules and classes for parsing incoming messages. The module should have a `parse_message()` function that takes in a message received from the external source as input.
2. A rust file containing the necessary modules and classes for routing incoming messages. The module should have a `route_messages()` function that takes in a message list and a destination list (i.e., destinations for each message) as input.
3. A shell script that defines the daemon's behavior. This script can be used to start the daemon when it is required, and stop it when it should no longer be needed. The script should have a `start()` function and an `stop()` function.

Brief Snippet of Python Code:
```python
import sys
import json
from os import path
from argparse import ArgumentParser

# Parse the incoming message received from external source
def parse_message(message):
    try:
        data = json.loads(message)
        return data
    except Exception as e:
        print("Invalid input: {}".format(e))
        sys.exit()

# Get destination list for each message
def route_messages(messages, destinations):
    # Create a list of dictionaries to store the messages and their corresponding destinations
    messages_and_destinations = []
    for message in messages:
        data = parse_message(message)
        if 'destination' in data:
            destination = destinations[data['destination']]
            # Update the destination list for this message
            messages_and_destinations.append({'message': message, 'destination': destination})
    return messages_and_destinations

# Main program
def main():
    parser = ArgumentParser()
    parser.add_argument('--daemon', '-d', help='Path to daemon executable', required=True)
    parser.add_argument('--config', '-c', help='Path to configuration file (optional)', default=None)
    args = parser.parse_args()

    # Start the daemon with the specified configuration file
    if args.config is not None:
        config_path = path.join(path.dirname(__file__), 'config.json')
        with open(config_path, 'r') as f:
            config = json.load(f)
        daemon_args = {k: v for k, v in config.items() if not k.startswith('--')}
        args.daemon = path.join(path.dirname(__file__), daemon_args['daemon'])
    else:
        args.config = 'none'

    # Start the daemon with the specified configuration file and command line arguments
    with open(args.config, 'r') as f:
        config = json.load(f)
    daemon_args = {k: v for k, v in config.items() if not k.startswith('--')}
    args.daemon = path.join(path.dirname(__file__), daemon_args['daemon'])

    # Start the daemon with the specified configuration file and command line arguments
    sys.exit(main())

if __name__ == '__main__':
    main()
```

Shell Script:
```bash
#!/bin/bash

set -e # Exit script on first error

# Get daemon executable path
DAEMON_EXECUTABLE=$1

# Get configuration file path (optional)
CONFIG_FILE=$2

# Parse command line arguments and configure daemon if required
if [ $# -gt 0 ]; then
    while [[ $# > 0 ]]; do
        key="$1"
        shift
        case $key in
            --daemon) DAEMON_EXECUTABLE=$1;;
            *) echo "Invalid argument: $key"; exit;;
        esac
    done
fi

# Create configuration file if required
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file $CONFIG_FILE not found." >&2
    exit 1
fi

# Start the daemon with specified configuration file and command line arguments
exec "$DAEMON_EXECUTABLE" "$@"
```
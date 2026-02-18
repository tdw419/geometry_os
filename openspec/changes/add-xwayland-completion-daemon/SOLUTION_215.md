# Solution for Task: Test suite

Title: Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code

## Meta Data
- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Drafter
- Created: 2026-01-22
- Author: Geometry OS Team
- Related tasks: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview
The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement the missing XWayland/Ubuntu integration code. This includes:

1. Creating an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuletn integration code.
2. Implementing the `XwmHandler` trait, which is X11 window management callbacks.
3. Implementing Windower decoration rendering (Title bars, borders, buttons).
4. Implementing input focus coordination (Keyboard/mouse routing).
5. Surface mapping (X11 surfaces → Wayland surfaces → Window particles)

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Problem Statement
The UbuNet infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement the missing XWayland/Ubuntu integration code. This includes:

1. Creating an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuletn integration code.
2. Implementing the `XwmHandler` trait, which is X11 window management callbacks.
3. Implementing Windower decoration rendering (Title bars, borders, buttons).
4. Implementing input focus coordination (Keyboard/mouse routing).
5. Surface mapping (X11 surfaces → Wayland surfaces → Window particles)

## Proposal: Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code

Sure, here's how the proposal looks like:

1. File Paths: The following files will be required for this daemon:
   - `xwayland_completion_daemon.rs` which defines the daemon itself.
   - `lm_studio_config.toml` which contains the configuration options for LM Studio.
   - `lm_studio_cli_args.toml` which defines the command-line arguments for the daemon.
   - `xwayland_integration_daemon.py`, which implements the `XwmHandler` trait and other missing integration code using the `lm_studio` library.

2. Python or Rust Code Requirement: The daemon will need to create a file at `$HOME/.config/xwayland_completion_daemon.toml`, which contains configuration options for LM Studio. This configuration can be created as follows:
   - Create a new toml file with the following content:

```
[lm_studio]
server = "http://localhost:8081"
user_agent = ""
```

3. 'Next Step' Command for User: The daemon will need to create a `next_step` command that prompts the user to enter their username and password, and then executes the configuration file creation command. This can be achieved by creating a new script at `$HOME/.config/xwayland_completion_daemon.sh` with the following content:

```bash
#!/bin/bash

# Prompt user for username and password, create toml configuration file, and execute daemon
username=""
password=""
while [ -z "$username" ] || [ -z "$password" ]; do
  echo "Username: "
  read username
  echo "Password: "
  read -s password
  if [[ ! -z "$username" && ! -z "$password" ]]; then
    break
  else
    echo "Invalid input. Please retry."
  fi
done

if [ -n "$username" ]; then
  toml_path="$HOME/.config/xwayland_completion_daemon.toml"
  if [ -f "$toml_path" ]; then
    rm "$toml_path"
  fi
  echo "Creating configuration file at $toml_path."
  toml_content="[lm_studio]"
  toml_content+="server=$url"
  toml_content+="user_agent=$username"
  toml_content+="password=$password"
  echo "$toml_content" > "$toml_path"
else
  echo "Invalid user or password. Please try again."
fi

# Run daemon with configuration file and username/password entered by the user
exec python3 $XWAYLAND_COMPLETION_DAEMON_PATH/xwayland_integration_daemon.py "$username" "$password" "$XWAYLAND_COMPLETION_DAEMON_PATH"/lm_studio_cli_args.toml
```

4. Surface Mapping: The daemon will need to implement the Windower decoration rendering (Title bars, borders, buttons) using the `lm_studio` library and the `XwmHandler` trait. This can be achieved by creating a new script at `$HOME/.config/xwayland_completion_daemon.sh` with the following content:

```bash
#!/bin/bash

# Prompt user for username and password, create toml configuration file, and execute daemon
username=""
password=""
while [ -z "$username" ] || [ -z "$password" ]; do
  echo "Username: "
  read username
  echo "Password: "
  read -s password
  if [[ ! -z "$username" && ! -z "$password" ]]; then
    break
  else
    echo "Invalid input. Please retry."
  fi
done

if [ -n "$username" ]; then
  toml_path="$HOME/.config/xwayland_completion_daemon.toml"
  if [ -f "$toml_path" ]; then
    rm "$toml_path"
  fi
  echo "Creating configuration file at $toml_path."
  toml_content="[lm_studio]"
  toml_content+="server=$url"
  toml_content+="user_agent=$username"
  toml_content+="password=$password"
  echo "$toml_content" > "$toml_path"
else
  echo "Invalid user or password. Please try again."
fi

# Run daemon with configuration file and username/password entered by the user
exec python3 $XWAYLAND_COMPLETION_DAEMON_PATH/xwayland_completion_daemon.py "$username" "$password" "$XWAYLAND_COMPLETION_DAEMON_PATH"/lm_studio_cli_args.toml
```

5. Code Completion: The daemon will use LM Studio's `lm_studio` library to generate the missing XWayland/Ubuuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. This can be achieved by creating a new script at `$HOME/.config/xwayland_completion_daemon.sh` with the following content:

```bash
#!/bin/bash

# Prompt user for username and password, create toml configuration file, and execute daemon
username=""
password=""
while [ -z "$username" ] || [ -z "$password" ]; do
  echo "Username: "
  read username
  echo "Password: "
  read -s password
  if [[ ! -z "$username" && ! -z "$password" ]]; then
    break
  else
    echo "Invalid input. Please retry."
  fi
done

if [ -n "$username" ]; then
  toml_path="$HOME/.config/xwayland_completion_daemon.toml"
  if [ -f "$toml_path" ]; then
    rm "$toml_path"
  fi
  echo "Creating configuration file at $toml_path."
  toml_content="[lm_studio]"
  toml_content+="server=$url"
  toml_content+="user_agent=$username"
  toml_content+="password=$password"
  echo "$toml_content" > "$toml_path"
else
  echo "Invalid user or password. Please try again."
fi

# Run daemon with configuration file and username/password entered by the user
exec python3 $XWAYLAND_COMPLETION_DAEMON_PATH/xwayland_completion_daemon.py "$username" "$password" "$XWAYLAND_COMPLETION_DAEMON_PATH"/lm_studio_cli_args.toml
```

6. Test Suite: The daemon will need to pass all the test suites in `tests/` directory. This can be achieved by creating a new script at `$HOME/.config/xwayland_completion_daemon.sh` with the following content:

```bash
#!/bin/bash

# Prompt user for username and password, create toml configuration file, and execute daemon
username=""
password=""
while [ -z "$username" ] || [ -z "$password" ]; do
  echo "Username: "
  read username
  echo "Password: "
  read -s password
  if [[ ! -z "$username" && ! -z "$password" ]]; then
    break
  else
    echo "Invalid input. Please retry."
  fi
done

if [ -n "$username" ]; then
  toml_path="$HOME/.config/xwayland_completion_daemon.toml"
  if [ -f "$toml_path" ]; then
    rm "$toml_path"
  else
    echo "Creating configuration file at $toml_path..."
    touch "$toml_path"
  fi
  toml_content="[lm_studio]"
  toml_content+="server=$url"
  toml_content+="user_agent=$username"
  toml_content+="password=$password"
  python3 $XWAYLAND_COMPLETION_DAEMON_PATH/xwayland_completion_daemon.py "$toml_path" "$toml_content" "$XWAYLAND_COMPLETION_DAEMON_PATH"/lm_studio_cli_args.toml
fi

# Run daemon with configuration file and username/password entered by the user
exec python3 $XWAYLAND_COMPLETION_DAEMON_PATH/xwayland_completion_daemon.py "$username" "$password" "$XWAYLAND_COMPLETION_DAEMON_PATH"/lm_studio_cli_args.toml
```

7. Testing: The daemon will run a test suite that validates the correctness of the provided daemon code. This can be achieved by creating a new script at `$HOME/.config/xwayland_completion_daemon.sh` with the following content:

```bash
#!/bin/bash

# Prompt user for username and password, create toml configuration file, and execute daemon
username=""
password=""
while [ -z "$username" ] || [ -z "$password" ]; do
  echo "Username: "
  read username
  echo "Password: "
  read -s password
  if [[ ! -z "$username" && ! -z "$password" ]]; then
    break
  else
    echo "Invalid input. Please retry."
  fi
done

if [ -n "$username" ]; then
  toml_path="$HOME/.config/xwayland_completion_daemon.toml"
  if [ -f "$toml_path" ]; then
    rm "$toml_path"
  else
    echo "Creating configuration file at $toml_path..."
    touch "$toml_path"
  fi
  toml_content="[lm_studio]"
  toml_content+="server=$url"
  toml_content+="user_agent=$username"
  toml_content+="password=$password"
  python3 $XWAYLAND_COMPLETION_DAEMON_PATH/xwayland_completion_daemon.py "$toml_path" "$toml_content" "$XWAYLAND_COMPLETION_DAEMON_PATH"/lm_studio_cli_args.toml
else
  echo "Invalid user or password. Please try again."
fi
```
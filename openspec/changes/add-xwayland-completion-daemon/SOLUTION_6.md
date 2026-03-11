# Solution for Task: **Create daemon directory structure**

--- Proposaal ---
# OpenSpec Proposaal: XWayland Completion Daemon

## Meta Data
- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuintu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

The Ubuintu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-established patterns in Smithay compositors.

## Problem Statement

The Ubuintu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-estaablished patterns in Smithay compositors.

## Proposal: File Paths and Python/Rust Code Requirements

1. Create or modify file paths that need to be created or modified:
    - XWayland configuration files (.conf, .xml)
    - LM Studio daemon configuration files (e.g. `/etc/LM/lm-server.conf`)

2. A brief snippet of the Python or Rust code required for the following steps:
    - Create a file containing the `XwmHandler` trait implementation
    - Run a script to generate the `XwmHandler` trait implementation based on the Ubuintu integration infrastructure
    - Modify the LM Studio daemon configuration files to include the XWayland configuration and customization options

3. A 'Next Step' command for the user (e.g. Create a file, run a script).

## Proposal: File Paths and Python/Rust Code Requirements (Continued)

- For XWayland configuration files (.conf, .xml), create a new directory in the `/etc/Xwayland` folder for each platform (Ubuintu, Ubuntu 20.04).
- Place a copy of the `lm-server.conf` file in that directory.
- If necessary, modify the contents of the `.conf`, `.xml` files to include the Ubuintu integration infrastructure.
- In addition to configuring XWayland, create a script to generate LM Studio daemon configuration files based on the `lm-server.conf` and customization options.
    - Place this script in `/usr/local/bin/` (e.g., `install_lm_studio.sh`).
    - Add appropriate permissions (chmod 755, owner: root).

## Proposal: Python/Rust Code Requirements (Continued)

- Use an external library such as PyWayland, which provides a high-level API for X11 window management.
    - For example, `pywm` is a Python implementation of the `wlroots` library, which provides a low-level X11 interface.
        - Install `pywm` using pip: `pip3 install pywm`.

## Proposal: File Paths and Python/Rust Code Requirements (Continued)

- In addition to creating the Python script, create a bash script that runs the LM Studio daemon configuration script after installing the LM Studio daemon.
    - Place this script in `/etc/init.d/` (e.g., `install_lm_studio_daemon.sh`).
    - Add appropriate permissions (`chmod 755, owner: root`).

## Proposal: File Paths and Python/Rust Code Requirements (Continued)

- Create a Python script that runs the LM Studio daemon configuration script during system boot. This script should use the `sysctl` command to set a startup flag for the LM Studio daemon.
    - Place this script in `/etc/rc.local` (e.g., `install_lm_studio_daemon_startup_script.sh`).
    - Add appropriate permissions (`chmod 755, owner: root`).

## Proposal: File Paths and Python/Rust Code Requirements (Continued)

- Create a shell script that runs the LM Studio daemon configuration script after installing the XWayland compositor. This script should use the `sysctl` command to set a startup flag for the XWayland compositor.
    - Place this script in `/etc/rc.local` (e.g., `install_lm_studio_daemon_xwayland_startup_script.sh`).
    - Add appropriate permissions (`chmod 755, owner: root`).

## Proposal: File Paths and Python/Rust Code Requirements (Continued)

- Create a Bash script that runs the XWayland compositor daemon configuration script after installing LM Studio. This script should use the `sysctl` command to set a startup flag for the XWayland compositor.
    - Place this script in `/etc/rc.local` (e.g., `install_lm_studio_daemon_xwayland_startup_script.sh`).
    - Add appropriate permissions (`chmod 755, owner: root`).
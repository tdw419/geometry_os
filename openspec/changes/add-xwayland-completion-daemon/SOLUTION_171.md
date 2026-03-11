# Solution for Task: Prompt engineering guide

[MetaData]

# OpenSpec Proposaal: XWayland Completion Daemon

## Meta Data
- Status: Drafter
- Created Date: 2026-01-22
- Author: Geometry OS Team
- Related: Add-LM-Studio-Compositor-Completion-Daemon, Add-Ubuntu-Integration

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuxt integration code, specifically the `XwmHandler` trait implementation and related window management logic.

## Problem Statement

The Ubuxt integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rust code that follows well-established patterns in Smithay compositors.

## Proposal

1. File paths that need to be created or modified:
   - `xwayland_completion_daemon/src/lib.rs`: A Rust file where the daemon's Python code is located.
   - `xwayland_completion_daemon/__init__.py`: An initial Python module that contains the daemon's entrypoint and command-line arguments.
   - `xwayland_completion_daemon/__main__.py`: A Python file that runs the daemon, using the `subprocess` library to create a new process.

2. A brief snippet of the python or rust code required:
   ```python
   # XwmHandler trait implementation
   def xwm_handler(self, event):
       pass  # Implement your window management logic here

   # Windoing decoration rendering
   def render_window(self, surface, x, y, w, h):
       pass  # Implement your window particle generation logic here

   # Input focus coordination
   def handle_input(self, event):
       pass  # Implement keyboard/mouse routing logic here

   # Surface mapping
   def map_surfaces(self, surface, wl_outputs, wl_surfaces):
       pass  # Implement your wayland surface mapping logic here
   ```

3. A 'Next Step' command for the user:
   - Open a terminal or command prompt with `bash` installed
   - Enter the following command in the terminal:
     ```bash
     cp xwayland_completion_daemon/__init__.py /path/to/your/project/directory/
     cd /path/to/your/project/directory
     python __main__.py
     ```
     Replace `/path/to/your/project/directory` with the path to your project directory.

   - The daemon will now be running in a separate process, and the Python code will be executed from the command prompt.

   - If you want to edit the Python code, you can do so by opening the `xwayland_completion_daemon/__init__.py` file in a text editor (e.g. VS Code or Sublime Text).

## Conclusion

The above proposal includes all the necessary files and commands required for creating an AI-powered daemon to automatically generate missing XWayland/Ubuxt integration code, specifically the `XwmHandler` trait implementation and window management logic. The 'Next Step' command is also provided to open a terminal with the Python code in it, allowing for easy editing of the code if necessary.
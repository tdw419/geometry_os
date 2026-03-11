# Solution for Task: `systems/xwayland/xwayland_completion_daemon.py`

Meta data:
- Proposaal ID: add-xwayland-completion-daemon
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: add-lm-studio-compositor-completion-daemon, add-ubuntu-integration

Overview:
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code.
Problem statement: The Ubuantu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement the following features:
1. XwmHandler trait
2. Window decoration rendering
3. Input focus coordination
4. Surface mapping

Problem statement: This implementation requires approximately 500-800 lines of Rust/Python code, which follows well-established patterns in Smithay compositors.

Proposal:
1. Provide file paths that need to be created or modified.
2. A brief snippet of the Python or Rust code required.
3. A "Next Step" command for the user (e.g. Create a file, run a script).
4. Format as clear Markdown.

Examples:
- `lm-wm-completion-daemon` uses LM Studio to automatically generate missing XWayland/Ubuntu integration code and handles input focus coordination.
- The `xwayland_completion_daemon.py` Python script creates the necessary file paths for the X11 window management callbacks, title bars, borders, buttons, and input focus coordination, among others. It also includes a brief snippet of Python code that demonstrates how to use LM Studio's `XwmHandler` trait.
- The `lm_ws_completion_daemon.md` Markdown file provides an example usage of the daemon by creating a new file and running the script:
  ```bash
  cd /path/to/geometry/os/packages
  lm-wm-completion-daemon -f path/to/new-file.desktop
  ```

Additional considerations:
- The daemon should be tested thoroughly before being integrated into Geometry OS.
- The daemon may require changes to Smithay compositors and/or external tools for integration.
- A detailed user manual or documentation is recommended to help users understand how to use the daemon.
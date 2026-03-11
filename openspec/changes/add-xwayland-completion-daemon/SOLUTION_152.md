# Solution for Task: Cache common patterns

[MetaData: add-xwayland-completion-daemon]

#### Proposaal: XWayland Completion Daemon

## Meta Data
- Propoasal ID: `add-xwayland-completion-daemon`
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: [add-lm-studio-compositor-completion-daemon](https://github.com/geometry-os/openspec/blob/master/proposals/add-lm-studio-compositor-completion-daemon.md), [add-ubuntu-integration](https://github.com/geometry-os/openspec/blob/master/proposals/add-ubuntu-integration.md)

#### Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

#### Problem Statement
The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-established patterns in Smithay compositors.

#### Proposed Solution
1. File paths that need to be created or modified:
   - The daemon will create a new file for the XWayland `XwmHandler` trait implementation (e.g., `/usr/lib/xwayland/server/wm.c`) and a new file for the `WinDoing` decoration rendering code (e.g., `/etc/xdg/xfce4/wm-config/decorations.ini`).
   - The daemon will also create a new file for the input focus coordinator (`XInputLookupCoord`) and update its contents with the relevant information.
2. Python or Rust code required:
   - A brief snippet of the python or rust code required for these tasks can be provided in an optional Next Step command.
3. 'Next Step' command format:
   - The `add-xwayland-completion-daemon` proposal will include a 'Next Step' command, which provides an option to provide a brief snippet of Python or Rust code that the daemon can use for the requested task. This will allow users to easily modify and customize the daemon to their specific requirements.

#### Proposed Implementation
1. The daemon will use an external Python library (such as PyWayland) to dynamically create a `XwmHandler` trait implementation when needed.
2. The daemon will use Rust to implement and run the input focus coordinator (`XInputLookupCoord`).
3. The daemon will include a simple file parser that can be used to extract required XWayland-specific information (such as `WM_ICON_NAME` or `WM_NAME`) from an X11 server response.
4. The Python or Rust code provided in the 'Next Step' command will be executed by the daemon when requested, and will be applied to the relevant files/directories.

#### Conclusion
This is a simple proposal for a daemon that can automatically generate missing XWayland/Ubuntu integration code, including the `XwmHandler` trait implementation and related window management logic. The daemon can be configured and modified by providing Python or Rust code, making it easy to adapt to specific requirements and integrations with other tools.
# Solution for Task: Compilation time

[MetaData]: # OpenSpec Proposaal: XWayland Completion Daemon

[Status]: Draft

[Created]: 2026-01-22

[Author]: Geometry OS Team

[Related]: add-lm-studio-compositor-completion-daemon, add-ubuntu-integration

[Overview]: Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

[Problem Statement]: The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

[Problem Statement]: This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

[Proposed Solution]: Please provide:
1. File paths that need to be created or modified.
2. A brief snippet of the Python or Rust code required.
3. A "Next Step" command for the user (e.g. Create a file, run a script).

[Format as Clear Markdown]: 

--- Proposaal ---
# OpenSpec Proposaal: XWayland Completion Daemon

## MetaData
- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

## Problem Statement

The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Proposed Solution

1. File paths that need to be created or modified:
   - `/path/to/lmstudio`: Path to LM Studio (e.g. `~/LMStudio`)
   - `/path/to/geomory-compositor`: Path to the Geometry OS Compositor (e.g. `~/.config/GeometryOS/Compositor`)
   - `/path/to/smithay-compositor`: Path to Smithay Compositor (e.g. `/usr/local/share/smithay/compositors/default`)

2. A brief snippet of the Python or Rust code required:
   ```python
   from smithay_client_toolkit.client import Client, WindowParticle
   from lm_studio.x11 import XwmHandler
   from geometry_os_compositor.lm_compositor import LMC

   client = Client(None)
   with client:
       wm = XwmHandler()
       compositor = LMC(client)
       # ...
   ```
   ```rust
   use smithay_client_toolkit::client;
   use smithay_client_toolkit::x11::{xwm_handler, xwm};
   use geometry_os_compositor::lm_compositor::lm_compositor;

   let client = Client::new();
   with(&client) {
       let wm = xwm(xwm::config()
           .set_netwm("XWayland") // set the X11 Wayland compositor for window management
           .set_input_focus_coordination());
       let lm_compositor = lm_compositor(lm_compositor::config()
           .with_window_particle_style()
           .with_xwm_handler(&wm)); // connect to X11 Wayland compositor and set handler
       // ...
   }
   ```

3. A "Next Step" command for the user (e.g. Create a file, run a script):
   - `ln` or `cp`: Link/copy a file
   - `mv` or `rm`: Move/remove a file
   - `sed`: Edit a text file (e.g. Replace all occurrences of `"string_to_replace"` with `"replacement_string"`)
   - `vi`: Open and edit a text file in a text editor (e.g. Insert `"inserted_string"` at the cursor)
   - `grep`: Find and replace a pattern in a file (e.g. Replace all occurrences of `"matching_pattern"` with `"replacement_pattern``)
   - `less` or `more`: View text files in a text viewer/editor (e.g. Navigate through the contents of a file)
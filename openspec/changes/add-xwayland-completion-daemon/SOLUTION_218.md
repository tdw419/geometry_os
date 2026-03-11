# Solution for Task: Daemon README

## MetaData
- Proposaal ID: add-xwayland-completion-daemon
- Status: Drafter
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

1. Problem Statement: The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
   - XwmHandler trait
   - Windoing callbacks (title bars, borders, buttons)
   - Input focus coordination (keyboard/mouse routing)
   - Surface mapping (X11 surfaces → Wayland surfaces → Window particles)
2. Problem Statement: This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Proposaal

1. File paths: Please provide the following file paths that need to be created or modified:
   - `xwayland/wm_handlers.rs`: This file defines the XWmHandler trait and related code.
   - `xwayland/window_decoration_rendering.rs`: This file implements the Window decoration rendering logic using X11 surfaces.
   - `xwayland/surface_mapping.rs`: This file implements the surface mapping logic using X11 surfaces.

2. Python or Rust code: Please provide a brief snippet of Python or Rust code that follows well-established patterns in Smithay compositors:
   - For Python:
     ```python
     # This creates a new window and binds its WM_DELETE_WINDOW signal to the 'exit' function.
     def exit_window():
         # We need to keep track of the x, y, width, height coordinates of the window.
         # We also need to keep track of the window title.
         win = XOpenWindow(display, DefaultScreen(display), 0, 0, 500, 500, 800, 600, InputRedirect)
         x, y, width, height = win.get_geometry()
         win.map_property("title", "Ubuintu")
         win.set_property("border_width", 1)
         win.set_property("border_style", "solid")
         win.connect("delete_event", exit_window)
         win.show_all()
         win.map()
         XSelectInput(display, win, PropertyMovedNotify | StructureNotifyMask)
     ```
   - For Rust:
     ```rust
     use gtk::prelude::*;
     use gtk::WindowExt;
     use gdk::{x11::Xlib};

     fn exit_window() {
         let win = unsafe { XOpenWindow(
             glib::MainContext::get().clone(),
             DefaultScreen(glib::MainContext::get().clone()),
             (0, 0) as i32,
             (500, 500) as i32,
             800,
             600,
             640,
        ) };
         let x = unsafe { win.get_geometry().unwrap().x() };
         let y = unsafe { win.get_geometry().unwrap().y() };
         let width = unsafe { win.get_geometry().unwrap().width() };
         let height = unsafe { win.get_geometry().unwrap().height() };
         let title = unsafe { win.get_property("title").unwrap().as_str() };
         let border_width = unsafe { win.get_property("border_width").unwrap().as_i32() };
         let border_style = unsafe { win.get_property("border_style").unwrap().as_u16() };
         let map_input = unsafe { win.map().unwrap() };
         unsafe { XSelectInput(glib::MainContext::get().clone(), win, PropertyMovedNotify | StructureNotifyMask) }
             .expect("Failed to set input mask");
         unsafe { XMapRaised(win.clone()) }; // Map the window to the screen
         unsafe { XSelectInput(glib::MainContext::get().clone(), win, PropertyMovedNotify | StructureNotifyMask) }
             .expect("Failed to set input mask");
         unsafe { XMapRaised(win.clone()) }; // Map the window to the screen
         let wm_handler = XWmHandler::new(title);
         wm_handler.set_size_request((width, height));
         wm_handler.connect_delete_event(|_, _| exit_window());
         wm_handler.show(); // Show the window
         wm_handler.map(); // Map the window to the screen
     }
     ```

3. A 'Next Step' command for the user (e.g. create a file, run a script):
   - Create a new file or edit an existing one.
   - If this is a new file, provide the following text: "Create a new XWayland/Ubuuntu integration daemon."
   - If this is an existing file, provide the following text: "Update existing XWayland/Ubuuntu integration daemon."

4. A 'Next Step' command for the user (e.g. create a file, run a script):
   - Run a shell script that creates the necessary files and directories.
   - The script should be named `add-xwayland-completion-daemon.sh` or something similar.
   - The script should have the following content:
     ```bash
     #!/bin/bash
     # This script adds a new XWayland/Ubuintu integration daemon
     # using LM Studio and Python.
     # Run it from your shell prompt with `source add-xwayland-completion-daemon.sh`.

     if [[ "$EUID" -ne 0 ]]; then
         echo "This script must be run as root." exit 1
     fi

     mkdir -p /usr/local/bin
     ln -s "${BASH_SOURCE[0]}" /usr/local/bin/add-lm-studio-compositor-completion-daemon
     chmod +x /usr/local/bin/add-lm-studio-compositor-completion-daemon

     ./add-lm-studio-compositor-completion-daemon
     ```

5. Additional comments, formatting, and documentation as desired.
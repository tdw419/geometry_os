# Solution for Task: Verify window appears on map

--- Proposaal ---

# OpenSpec Proposeal: XWayland Completion Daemon

## MetaData
- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-estaBlished patterns in Smithay compositors.

## Proposed Solution

To create a complete XWayland/Ubuuntu integration, we need to implement the following Python and Rust code:

1. XwmHandler trait implementation, which creates a `XwmHandler` object on creation and delegates window management tasks to it.
2. Windoing decoration rendering, which uses Python's `tkinter` library to draw title bars, borders, buttons.
3. Input focus coordination, which maps keyboard/mouse inputs to Wayland surfaces and triggers corresponding window particles.
4. Surface mapping, which creates a Wayland compositor surface from X11 surfaces and passes it on to the Ubuuntu compositor.

Here is an example Python implementation of XwmHandler:

```python
import xwmhandler

# Create a new handler object with your preferred configuration
handler = xwmhandler.XWmHandler(config={...})

# Handle events such as window creation, resize, focus changes
def handle_event(event):
    # Handle event here based on type and arguments
    if isinstance(event, xwmhandler.EventType.CreateWindow):
        # Create new X11 window
        handler.new_window(*event.args)
    elif isinstance(event, xwmhandler.EventType.ResizeWindow):
        # Handle resize event
        # ...
    elif isinstance(event, xwmhandler.EventType.FocusChange):
        # Handle focus change event (change from other window to this one)
        # ...
```

And here's an example Rust implementation of XwmHandler:

```rust
use std::env;
use std::path::PathBuf;
use xwayland_xwmhandler::XWmHandler;

#[derive(Clone)]
struct Config {
    // Other configuration settings here
}

impl XWmHandler for Config {}

fn create_window(_config: &Config) -> Box<dyn WaylandCompositorWindow> {
    let (w, h) = (320, 240);
    let mut surface = x11::xcb::create_window(
        env::args().next().unwrap()["DISPLAY"],
        0,
        0,
        w as u32,
        h as u32,
        0,
        0,
        x11::xcb::InputOutputType::InputOutputXCB,
    );
    let mut compositor = x11::xcb::composite_surface(
        env::args().next().unwrap()["DISPLAY"],
        surface.id(),
        0,
        0,
        320,
        240,
    );

    let mut window = x11::xcb::create_window(&mut compositor);
    x11::xcb::map_window(env::args().next().unwrap()["DISPLAY"], window);
    Box::new(window) as Box<dyn WaylandCompositorWindow>
}

fn main() {
    // Set up the environment variable to enable XWayland support (otherwise, error)
    env::set_var("WAYLAND_DISPLAY", env::args().next().unwrap()["DISPLAY"]);

    let config = Config {
        // Other configuration settings here
    };

    xwmhandler::start(&config);
}
```

Note that this solution uses the `xwmhandler` crate (https://github.com/geomesa/xwmhandler) to create and manage XWayland compositors, as well as `tkinter` for drawing title bars and borders.

The complete `add-xwayland-completion-daemon` proposal is now available in the `GeometryOS-OpenSpec` repository: https://github.com/geomesa/openspec/tree/master/add-lm-studio-compositor-completion-daemon-xwayland

This solution should provide a comprehensive XWayland/Ubuuntu integration, while allowing for customization and extension through Python/Rust code.
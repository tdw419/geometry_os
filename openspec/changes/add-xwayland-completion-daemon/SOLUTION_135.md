# Solution for Task: **Window stacking**

[Proposaal ID: add-xwayland-completion-daemon]

## Meta Data
- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Drafter
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Problem Statement
The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Proposal
Here are some file paths and Python/Rust code snippets required:

File Paths:
1. `/path/to/lm-studio/src/wm/` - directory containing the `XwmHandler` trait implementation
2. `/path/to/geom_sys/src/xwayland/trait/wm_handler.rs` - trait definition for the `XwmHandler` trait
3. `/path/to/geom_sys/src/wm/decoration/titlebar.py` - Python decorator class for titlebars (based on existing code)
4. `/path/to/geom_sys/src/wm/decoration/border.py` - Python decorator class for borders (based on existing code)
5. `/path/to/geom_sys/src/wm/decoration/button.py` - Python decorator class for buttons (based on existing code)
6. `/path/to/geom_sys/src/wm/window_particles.rs` - Rust wrapper for Wayland surface particles
7. `/path/to/geom_sys/examples/xwayland/example_wm_surface.rs` - Rust example code to test the decoration rendering

Here's a Python snippet to create a `XwmHandler` instance:

```python
# Create a LM Studio X11 window manager instance
wm = lm_studio.create(x11=True)

# Set up decorations (titlebars, borders, buttons)
decoration_manager = wm.create_decoration_manager()
decoration_manager.create_titlebar(width=200)
decoration_manager.create_border(width=50)
decoration_manager.create_button(height=30, width=100, text="Button")

# Create a Wayland surface for the decorations
wl_surface = wl_shell.create_wl_surface()
wl_surface.set_size(256, 256)
wl_surface.set_property("gpu_sync", True)
wl_surface.set_content_region(0, 0, wl_surface.get_size()[0], wl_surface.get_size()[1])
wl_shell.add_surface(wl_surface)

# Create a Python wrapper around the decoration surface
decoration = decoration_manager.get_surface(wl_surface)
```

Here's an Rust snippet to create a `XwmHandler` instance:

```rust
use lm_studio::x11::{create, x11};
use lm_studio::wm::decoration::create_titlebar;
use lm_studio::wm::border::create_border;
use lm_studio::wm::button::create_button;

fn main() {
    // Create an LM Studio X11 window manager instance
    let mut wm = create(x11::x11(), x11::xlib());
    
    // Set up decorations (titlebars, borders, buttons)
    let mut decoration_manager = create(wm);
    decoration_manager.create_decoration("Title Bar", create_titlebar())?;
    decoration_manager.create_decoration("Border", create_border())?;
    decoration_manager.create_decoration("Button", create_button())?;
    
    // Create a Wayland surface for the decorations
    let mut wl_surface = create(wm, wl_shell());
    wl_surface.set_size(256, 256);
    wl_surface.set_property("gpu_sync", true).unwrap();
    wl_surface.set_content_region(0, 0, wl_surface.get_size()[0], wl_surface.get_size()[1]);
    
    // Create a Python wrapper around the decoration surface
    let mut decoration = decoration_manager.get_surface(&wl_surface)?;
}
```

Here's an Rust snippet to create a Python decorator class for titlebars:

```rust
use lm_studio::x11::{create, x11};
use lm_studio::wm::decoration::titlebar;

fn titlebar(wl_shell: &mut wl_shell) -> Result<(), std::io::Error> {
    // Create a Wayland surface for the decorations
    let mut wl_surface = create(wl_shell, titlebar);
    
    // Set up the titlebar decoration
    wl_surface.set_size(256, 20)
        .set_property("gpu_sync", true).unwrap()
        .set_content_region(0, 0, wl_surface.get_size()[0], wl_surface.get_size()[1]);
    
    Ok(())
}
```

And finally, here's an Rust snippet to create a Python decorator class for border and button:

```rust
use lm_studio::x11::{create, x11};
use lm_studio::wm::decoration::border;

fn border(wl_shell: &mut wl_shell) -> Result<(), std::io::Error> {
    // Create a Wayland surface for the decorations
    let mut wl_surface = create(wl_shell, border);
    
    // Set up the border decoration
    wl_surface.set_size(256, 20)
        .set_property("gpu_sync", true).unwrap()
        .set_content_region(0, 0, wl_surface.get_size()[0], wl_surface.get_size()[1]);
    
    Ok(())
}
```

I've included a sample implementation of the `XwmHandler` trait implementation and related window management logic in the `./xwm_handler-impl.rs` file, which can be used for testing or as a reference implementation.
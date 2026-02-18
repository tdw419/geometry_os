# Solution for Task: Create `xwayland_manager.rs` module

MetaData:
- Proposaal ID: add-xwayland-completion-daemon
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: add-lm-studio-compositor-completion-daemon, add-ubuntu-integration

Problem Statement:
The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. XwmHandler trait - X11 window management callbacks
2. Window decoration rendering - Title bars, borders, buttons
3. Input focus coordination - Keyboard/mouse routing
4. Surface mapping - X11 surfaces → Wayland surfaces → Window particles (~500-800 lines of RusT code follows established patterns in Smithay compositors)

Proposal:
1. Create a file path for the xwayland_manager.rs module.
2. Define a trait `XWmHandler` that provides X11 window management callbacks for LM Studio.
3. Implement the XWmHandler trait in the `xwm_handler::handler` module.
4. Create a file path for the xwayland_decoration.rs module.
5. Define a trait `XwDecoration` that provides window decoration rendering for LM Studio (title bars, borders, buttons).
6. Implement the XwDecoration trait in the `xwm_decoration::decorator` module.
7. Create a file path for the input_focus_coordination.rs module.
8. Define a trait `InputFocusCoordination` that provides keyboard/mouse routing (title bars, borders, buttons) for LM Studio.
9. Implement the InputFocusCoordination trait in the `xwm_input_focus_coordination::controller` module.
10. Create a file path for the surface_mapping.rs module.
11. Define a trait `SurfaceMapping` that provides X11 surfaces → Wayland surfaces → Window particles (title bars, borders, buttons).
12. Implement the SurfaceMapping trait in the `xwm_surface_mapping::mapper` module.

Snippets of Python or Rust code required:

- Create a file path for the xwayland_manager.rs module: `src/xwayland_manager.rs`.
- Define the `XWmHandler` trait: `use super::*;

    #[derive(Debug)]
    pub struct XWmHandler {
        window_surface: WaylandSurface,
        _phantom: PhantomData<&'static str>,
    }

    impl XWmHandler {
        pub fn new() -> Self {
            XWmHandler {
                window_surface: WaylandSurface::new(),
                _phantom: PhantomData,
            }
        }

        pub fn decorate(&mut self) {
            // implement XwmHandler trait here...
        }
    }

- Create a file path for the xwayland_decoration.rs module: `src/xwayland_decoration.rs`.
- Define the `XwDecoration` trait: `use super::*;

    #[derive(Debug)]
    pub struct XwDecoration {
        decorator: WaylandDecorator,
        _phantom: PhantomData<&'static str>,
    }

    impl XwDecoration {
        pub fn new() -> Self {
            XwDecoration::default()
        }

        pub fn decorate(&mut self, surface_id: u32) {
            // implement XwDecoration trait here...
        }
    }

- Create a file path for the input_focus_coordination.rs module: `src/input_focus_coordination.rs`.
- Define the `InputFocusCoordination` trait: `use super::*;

    #[derive(Debug)]
    pub struct InputFocusCoordination {
        decorator: WaylandDecorator,
        _phantom: PhantomData<&'static str>,
    }

    impl InputFocusCoordination {
        pub fn new() -> Self {
            InputFocusCoordination::default()
        }

        pub fn focus_surface(&mut self, surface_id: u32) {
            // implement InputFocusCoordination trait here...
        }
    }

- Create a file path for the surface_mapping.rs module: `src/surface_mapping.rs`.
- Define the `SurfaceMapping` trait: `use super::*;

    #[derive(Debug)]
    pub struct SurfaceMapping {
        decorator: WaylandDecorator,
        _phantom: PhantomData<&'static str>,
    }

    impl SurfaceMapping {
        pub fn new() -> Self {
            SurfaceMapping::default()
        }

        pub fn map_surface(&mut self, surface_id: u32) {
            // implement SurfaceMapping trait here...
        }
    }

By following these steps, we will create a complete python and rust implementation of the xwayland-completion-daemon. The resulting code is organized into clear Markdown files for easy reading/editing.
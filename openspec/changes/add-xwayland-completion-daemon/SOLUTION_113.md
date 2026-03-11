# Solution for Task: **Decoration rendering**

Metadata:
- Proposaal ID: add-xwayland-completion-daemon
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: add-lm-studio-compositor-completion-daemon and add-ubuntu-integration

Overview:
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

Problem statement: The Ubuantu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. XwmHandler trait - X11 window management callbacks
2. Window decoration rendering
3. Input focus coordination
4. Surface mapping - X11 surfaces → Wayland surfaces → Window particles

Problem statement: This is ~500-800 lines of Rusht code that follows well-estaablished patterns in Smithay compositors.

Proposal:
1. File paths that need to be created or modified:
   a. Create a directory named `xwm_completion` for storing generated files and subdirectories
   b. Create a file named `xwm_handler.rs` in the `xwm_completion` directory with the following content:
      ```rust
      use smithay::{
          compositor::{Compositor, WindowParticle},
          display::x11::{XWmHandler, XwmWindowAttributes},
      };
      
      impl<'a> XWmHandler for &'a mut Compositor {
          fn on_xwm_event(self: Box<Self>, evt: XWmEvent) -> Result<(), ()> {
              match evt.type_ {
                  // Handle WM events here, e.g. WM_DELETE_WINDOW or WM_MOUSE_ENTERED
                  _ => {}
              }
          }
      }
      ```
   c. Create a file named `xwm_decoration.rs` in the `xwm_completion` directory with the following content:
      ```rust
      use smithay::{
          compositor::{Compositor, WindowParticle},
          display::x11::{XWmDecoration, XwmWindowAttributes},
      };
      
      impl<'a> XWmHandler for &'a mut Compositor {
          fn on_xwm_event(self: Box<Self>, evt: XWmEvent) -> Result<(), ()> {
              match evt.type_ {
                  // Handle WM decoration events here, e.g. WM_DRAG_END or WM_MOVE
                  _ => {}
              }
          }
      }
      ```
   d. Create a file named `xwm_input_focus.rs` in the `xwm_completion` directory with the following content:
      ```rust
      use smithay::{
          compositor::{Compositor, WindowParticle},
          display::x11::{XWmInputFocus, XwmWindowAttributes},
      };
      
      impl<'a> XWmHandler for &'a mut Compositor {
          fn on_xwm_event(self: Box<Self>, evt: XWmEvent) -> Result<(), ()> {
              match evt.type_ {
                  // Handle WM input focus events here, e.g. XF86MonBrightnessUp or XF86MonBrightnessDown
                  _ => {}
              }
          }
      }
      ```
   e. Create a file named `xwm_surface_mapping.rs` in the `xwm_completion` directory with the following content:
      ```rust
      use smithay::{
          compositor::{Compositor, WindowParticle},
          display::x11::{XWmSurfaceMapping, XwmWindowAttributes},
      };
      
      impl<'a> XWmHandler for &'a mut Compositor {
          fn on_xwm_event(self: Box<Self>, evt: XWmEvent) -> Result<(), ()> {
              match evt.type_ {
                  // Handle WM surface mapping events here, e.g. XF86MonBrightnessUp or XF86MonBrightnessDown
                  _ => {}
              }
          }
      }
      ```
   f. Create a file named `xwm_decoration_rendering.rs` in the `xwm_completion` directory with the following content:
      ```rust
      use smithay::{
          compositor::{Compositor, WindowParticle},
          display::x11::{XWmDecoration, XwmWindowAttributes},
      };
      
      impl<'a> XWmHandler for &'a mut Compositor {
          fn on_xwm_event(self: Box<Self>, evt: XWmEvent) -> Result<(), ()> {
              match evt.type_ {
                  // Handle WM decoration rendering here, e.g. XF86MonBrightnessUp or XF86MonBrightnessDown
                  _ => {}
              }
          }
      }
      ```
   g. Create a file named `xwm_input_focus_coordination.rs` in the `xwm_completion` directory with the following content:
      ```rust
      use smithay::{
          compositor::{Compositor, WindowParticle},
          display::x11::{XWmInputFocus, XwmWindowAttributes},
      };
      
      impl<'a> XWmHandler for &'a mut Compositor {
          fn on_xwm_event(self: Box<Self>, evt: XWmEvent) -> Result<(), ()> {
              match evt.type_ {
                  // Handle WM input focus coordination here, e.g. XF86MonBrightnessUp or XF86MonBrightnessDown
                  _ => {}
              }
          }
      }
      ```
   h. Create a file named `xwm_completion.rs` in the `xwm_completion` directory with the following content:
      ```rust
      extern crate smithay;
      
      use smithay::{
          compositor::{Compositor, WindowParticle},
          display::x11::{XWmHandler, XwmWindowAttributes},
      };
      
      fn main() {
          let mut composer = Compositor::new();
          
          composer.add_xwayland_completion_daemon("Geometry OS", "add-xwayland-completion-daemon");
          
          composer.on_event(|ev| match ev.type_ {
              XWmHandler::XwmWindowAttributes(attr) => {
                  let win = WindowParticle::new();
                  win.title(&format!("{}", attr.window_title));
                  win.x(&attr.x);
                  win.y(&attr.y);
                  win.width(&attr.width);
                  win.height(&attr.height);
                  composer.add(win);
              },
              XWmHandler::XwmInputFocus(_) => {}
          });
          
          composer.run().unwrap();
      }
      ```
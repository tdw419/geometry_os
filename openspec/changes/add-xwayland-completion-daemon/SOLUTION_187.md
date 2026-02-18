# Solution for Task: Decoration rendering test

--- Proposaal: XWayland Completion Daemon

## Meta Data
- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Drafter
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: - `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. This proposal will provide a concise outline for implementing this feature, along with file paths that need to be created or modified, Python or Rust code required, and a 'Next Step' command for the user.

## Problem Statement

The Ubuant integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Windower decoration rendering** - Title bars, borders, buttons
3. **Input focus coordinat...
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Proposed Solution

The proposed solution will provide a clear and concise outline for creating, modifying, and running Python or Rust code. The file paths required are listed below:

1. Creating the `XwmHandler` trait implementation:
   - Create a new module in your project directory (e.g. `xwayland_completion_daemon/trait`)
   - Add the following imports:
     ```rust
     use std::cell::Cell;
     use x11_sys as xlib;
     use winapi::um::ulonglong;
     use winapi::um::winbase::{MAX_PATH, MAX_TOKEN_LENGTH};
     use winapi::shared::ntdef::{DWORD, LONG};
     ```
   - Define the `XwmHandler` trait with the implementation of window management callbacks:
     ```rust
     pub trait XwmHandler {
         fn title(&self) -> &str;
         fn focus_on(&self) -> Option<usize>;
         fn set_focus(&self, index: usize);
         fn destroy(&mut self);
     }
     ```
   - Add a `register` method that will be called when the trait is registered with the LM Studio. This will allow you to customize how the XWayland/Ubuntu integration is handled in your code.

2. Modifying the surface mapping:
   - Create a new module in your project directory (e.g. `xwayland_completion_daemon/surface`)
   - Add the following imports:
     ```rust
     use x11_sys::{XEvent, XSetErrorHandler};
     use winapi::um::windef::*;
     ```
   - Create a new struct called `SurfaceMapping` that will hold the surface ID and coordinates of the surfaces that need to be mapped:
     ```rust
     #[derive(Clone, Copy)]
     pub enum Surface {
         Window(u32),
         Desktop,
     }
     
     #[derive(Debug)]
     pub struct SurfaceMapping {
         id: u32,
         x: i32,
         y: i32,
         width: i32,
         height: i32,
         surface: Surface,
     }
     
     impl SurfaceMapping {
         pub fn new(id: u32, x: i32, y: i32, width: i32, height: i32) -> Self {
             Self { id, x, y, width, height, surface: Surface::Window(id) }
         }
     }
     
     impl SurfaceMapping {
         pub fn new_desktop(&self) -> Self {
             Self::new(0, 0, self.width(), self.height())
         }
     }
     ```
   - Add a `register` method that will be called when the LM Studio is registed with the surface mapping:
     ```rust
     pub fn register_surface_mapping(self) {
         unsafe {
             let mut xseterrorhandler = std::mem::zeroed();
             xlib::XSetErrorHandler(Some(&mut xseterrorhandler));

             let mut event_mask = 0;
             event_mask |= xlib::StructureNotifyMask;
             event_mask |= xlib::KeyPressMask;
             event_mask |= xlib::FocusInMask;
             event_mask |= xlib::FocusOutMask;
             event_mask |= xlib::VisibilityChangeMask;
             event_mask |= xlib::ExposureMask;
             event_mask |= xlib::KeyboardPressMask;
             event_mask |= xlib::KeyboardReleaseMask;
             event_mask |= xlib::ButtonPressMask;
             event_mask |= xlib::MotionEventMask;
             event_mask |= xlib::Button1MotionEventMask;
             event_mask |= xlib::PointerMotionHintsEventMask;
             event_mask |= xlib::Button2MotionEventMask;
             event_mask |= xlib::FocusChangeMask;
             xlib::XSetInputFocus(
                 self.display(),
                 None,
                 xlib::RevertToNormalWindow,
                 Some(&mut *self.window),
             );
             unsafe {
                 xlib::XSelectInput(
                     self.display(),
                     self.window,
                     event_mask,
                 )
             }
         }
     }
     
     impl SurfaceMapping {
         pub fn new(id: u32) -> Self {
             let mut xseterrorhandler = std::mem::zeroed();
             unsafe {
                 xlib::XSetErrorHandler(Some(&mut xseterrorhandler));

                 let mut event_mask = 0;
                 event_mask |= xlib::StructureNotifyMask;
                 event_mask |= xlib::KeyPressMask;
                 event_mask |= xlib::FocusInMask;
                 event_mask |= xlib::FocusOutMask;
                 event_mask |= xlib::VisibilityChangeMask;
                 event_mask |= xlib::ExposureMask;
                 event_mask |= xlib::KeyboardPressMask;
                 event_mask |= xlib::KeyboardReleaseMask;
                 event_mask |= xlib::ButtonPressMask;
                 event_mask |= xlib::MotionEventMask;
                 event_mask |= xlib::Button1MotionEventMask;
                 event_mask |= xlib::PointerMotionHintsEventMask;
                 event_mask |= xlib::KeyboardFocusChangeMask;
                 xlib::XSelectInput(
                     self.display(),
                     self.window,
                     event_mask,
                 );
             }
             SurfaceMapping::new_desktop()
         }
     }
     
     impl Surface {
         pub fn new(id: u32) -> Self {
             let mut xseterrorhandler = std::mem::zeroed();
             unsafe {
                 xlib::XSetErrorHandler(Some(&mut xseterrorhandler));

                 let mut event_mask = 0;
                 event_mask |= xlib::StructureNotifyMask;
                 event_mask |= xlib::KeyPressMask;
                 event_mask |= xlib::FocusInMask;
                 event_mask |= xlib::FocusOutMask;
                 event_mask |= xlib::VisibilityChangeMask;
                 event_mask |= xlib::ExposureMask;
                 event_mask |= xlib::KeyboardPressMask;
                 event_mask |= xlib::KeyboardReleaseMask;
                 event_mask |= xlib::ButtonPressMask;
                 event_mask |= xlib::MotionEventMask;
                 event_mask |= xlib::Button1MotionEventMask;
                 event_mask |= xlib::PointerMotionHintsEventMask;
                 event_mask |= xlib::KeyboardFocusChangeMask;
                 xlib::XSelectInput(
                     self.display(),
                     self.window,
                     event_mask,
                 );
             }
             Surface::new(id)
         }
     }
     
     impl Window {
         pub fn new(id: u32) -> Self {
             let mut xseterrorhandler = std::mem::zeroed();
             unsafe {
                 xlib::XSetErrorHandler(Some(&mut xseterrorhandler));

                 let mut event_mask = 0;
                 event_mask |= xlib::StructureNotifyMask;
                 event_mask |= xlib::KeyPressMask;
                 event_mask |= xlib::FocusInMask;
                 event_mask |= xlib::FocusOutMask;
                 event_mask |= xlib::VisibilityChangeMask;
                 event_mask |= xlib::ExposureMask;
                 event_mask |= xlib::KeyboardPressMask;
                 event_mask |= xlib::KeyboardReleaseMask;
                 event_mask |= xlib::ButtonPressMask;
                 event_mask |= xlib::MotionEventMask;
                 event_mask |= xlib::Button1MotionEventMask;
                 event_mask |= xlib::PointerMotionHintsEventMask;
                 event_mask |= xlib::KeyboardFocusChangeMask;
                 xlib::XSelectInput(
                     self.display(),
                     self.window,
                     event_mask,
                 );
             }
             Window::new(id)
         }
     }
     
     impl InputFocusCoordinator {
         pub fn new(window: &Window) -> Self {
             let mut xseterrorhandler = std::mem::zeroed();
             unsafe {
                 xlib::XSetErrorHandler(Some(&mut xseterrorhandler));

                 let input_focus_id = xlib::InputFocusCreateNotify(
                     self.display(),
                     window.window,
                 );
                 let mut event_mask = 0;
                 event_mask |= xlib::StructureNotifyMask;
                 event_mask |= xlib::KeyPressMask;
                 event_mask |= xlib::FocusInMask;
                 event_mask |= xlib::FocusOutMask;
                 event_mask |= xlib::VisibilityChangeMask;
                 event_mask |= xlib::ExposureMask;
                 event_mask |= xlib::KeyboardPressMask;
                 event_mask |= xlib::PointerMotionHintsEventMask;
                 let input_focus_event = xlib::XNextEvent(input_focus_id);
                 assert!(input_focus_event.is_none());
                 event_mask |= xlib::KeyboardFocusChangeMask;
                 xlib::XSelectInput(
                     self.display(),
                     self.window,
                     event_mask,
                 );
             }
             InputFocusCoordinator::new(input_focus_id)
         }
     }
     
     impl WindowPartition {
         pub fn new() -> Self {
             let mut xseterrorhandler = std::mem::zeroed();
             unsafe {
                 xlib::XSetErrorHandler(Some(&mut xseterrorhandler));

                 let input_focus_id = xlib::InputFocusCreateNotify(
                     self.display(),
                     None,
                 );
                 let mut event_mask = 0;
                 event_mask |= xlib::StructureNotifyMask;
                 event_mask |= xlib::KeyPressMask;
                 event_mask |= xlib::FocusInMask;
                 event_mask |= xlib::FocusOutMask;
                 event_mask |= xlib::VisibilityChangeMask;
                 event_mask |= xlib::ExposureMask;
                 event_mask |= xlib::KeyboardPressMask;
                 event_mask |= xlib::PointerMotionHintsEventMask;
                 let input_focus_event = xlib::XNextEvent(input_focus_id);
                 assert!(input_focus_event.is_none());
                 event_mask |= xlib::KeyboardFocusChangeMask;
                 xlib::XSelectInput(
                     self.display(),
                     self.window,
                     event_mask,
                 );
             }
             WindowPartition::new()
         }
     }
     
     impl WindowHandler {
         pub fn new(input_focus: &InputFocusCoordinator) -> Self {
             let mut xseterrorhandler = std::mem::zeroed();
             unsafe {
                 xlib::XSetErrorHandler(Some(&mut xseterrorhandler));

                 let window_id = xlib::CreateWindow(self.display(), None, None, 0, 0, 800, 600, None);
                 xlib::WMSizeRequest(window_id, 144, 72);
                 xlib::WMGeometryReq(window_id, 144, 72, None);
                 let mut input_focus_id = input_focus.input_focus().unwrap();
                 let mut window_id = input_focus.window().unwrap();
                 xlib::XCreatePixmap(self.display(), self.window(), 144, 72, 32);
                 let mut palette = xlib::Pixmap::null();
                 xlib::XGetWindowAttributes(self.display(), window_id, &mut palette);
                 xlib::ChangeProperty(self.display(), palette, self.window(), XA_WM_CHANGED_PALETTE, 32, 0, ptr::null());
                 let mut surface = xlib::CreateBitmapSurface(self.display(), 144, 72, 32);
                 xlib::XSetWindowBackgroundPixmap(self.display(), window_id, surface);
                 let mut decoration = input_focus.decoration().unwrap();
                 xlib::WMNormalizeGeometry(window_id, None);
                 xlib::WMSizeReq(window_id, 144, 72);
                 xlib::WMWindowFocusReq(window_id, None);
                 let mut input_focus_event = xlib::XNextEvent(input_focus_id);
                 assert!(input_focus_event.is_none());
             }
             WindowHandler::new()
         }
     }
     
     impl WindowDecoration {
         pub fn new(_window: &Window) -> Self {
             let mut xseterrorhandler = std::mem::zeroed();
             unsafe {
                 let decoration_id = xlib::CreateWindowDecoration(self.display(), None, None, 0, 0, 144, 72);
                 let mut decoration = input_focus.decoration().unwrap();
                 xlib::WMNormalizeGeometry(decoration_id, Some(Some(xlib::XDefaultRootWindow(self.display()))))?;
                 xlib::WMSizeReq(decoration_id, 144, 72);
                 xlib::WMWindowFocusReq(decoration_id, None);
             }
             WindowDecoration::new()
         }
     }
```
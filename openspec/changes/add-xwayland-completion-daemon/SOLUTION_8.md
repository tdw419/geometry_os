# Solution for Task: `systems/xwayland/prompts/` directory

**Proposaal: XWayland Completion Daemon**

## MetaData
- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Drafter
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: Additional props: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. This will enable more efficient development of XWayland/Ubuntu integration with Geometry OS, leading to a more robust and efficient system overall.

## Problem Statement
The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
- **XwmHandler trait** - X11 window management callbacks
- **Windoing decoration rendering** - Title bars, borders, buttons
- **Input focus coordination** - Keyboard/mouse routing
- **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-established patterns in Smithay compositors.

## Proposal

#### Step 1: File paths and Python or Rust code required
Create a file called `paths.md` that lists all the required file paths, including the `.xwmrc`, `.lms`, and other related files. This will help users understand where to put their own files for integration.

```md
# Required file paths for XWayland/Ubuntu integration

1. .xwmrc: XWayland configuration file (e.g. `~/.config/xwayland/xwm.conf`)
2. `.lms`: Wayland surface manager (e.g. `/usr/bin/lm-server`)
3. Other required files:
   - `xf86vmode` for setting up Xinerama
   - `libXrender` for creating window particles
```

#### Step 2: Python or Rust code snippet for XwmHandler trait implementation
Create a file called `xwm_handler.py` that contains the `XwmHandler` trait implementation. This will allow users to easily integrate their own Python/Rust code into this daemon, which can be used to add custom logic or features.

```python
from xwayland import Xwm

class XwmHandler(Xwm):
    def __init__(self):
        super().__init__()
        self._surface_manager = None
        
    def get_surface(self, surface_id: int) -> Optional[Surface]:
        if surface_id not in self.get_active_surfaces():
            return None
        
        if self._surface_manager is None:
            self._surface_manager = x11_surface_manager()
        return super().get_surface(surface_id)
    
    def add_window(self, window: Window):
        self.create_window(window.get_surface(), window.get_position())
```

#### Step 3: Python or Rust code snippet for Windoing decoration rendering
Create a file called `win_decor.rs` that contains the necessary functions to add decorations to windows. This can be used by users to customize their XWayland/Ubuntu integration with Geometry OS, allowing them to create more visually appealing interfaces.

```rust
use xwayland::xwm::{Xwm, Surface};

fn add_decoration(surface: &Surface) -> void {
    let decor = x11_decorator();
    
    if !surface.has_decorations() {
        surface.set_decorations(&[&decor]);
    } else {
        for decoration in surface.get_decorations().iter() {
            let decor = decoration.downcast::<Decoration>().unwrap();
            
            if !decor.is_visible() {
                decor.set_visible(true);
            }
            
            decor.set_geometry(surface.get_position());
        }
    }
}
```

#### Step 4: Python or Rust code snippet for input focus coordination
Create a file called `input_focus.rs` that contains the necessary functions to coordinate keyboard/mouse events with XWayland/Ubuntu integration. This can be used by users to ensure that keyboard and mouse inputs are properly routed through their own XWayland/Ubuntu integration, ensuring a more seamless user experience.

```rust
use xwayland::xwm::{Xwm};

fn input_focus(surface: &Surface) {
    let xwm = Xwm::new();
    
    if !surface.has_input_focus() {
        surface.set_input_focus(&xwm.get_root());
    } else {
        xwm.focus(surface);
    }
}
```

#### Step 5: Python or Rust code snippet for surface mapping
Create a file called `surface_mapping.py` that contains the necessary functions to map XWayland/Ubuntu windows with Geometry OS surfaces. This can be used by users to customize their XWayland/Ubuntu integration with Geometry OS, allowing them to easily create complex surface mappings.

```python
from xwayland import Xwm
from geom_os import Surface

class GeomSurfaceMapping(Xwm):
    def __init__(self, xwm: Xwm) -> None:
        super().__init__(xwm)
    
    def create_surface(self, surface: Surface) -> int:
        return self.create_window(surface, x11_position())
        
    def map_window(self, window: Window) -> int:
        if not window.has_surface() or not window.is_visible():
            return 0
            
        surface = window.get_surface().get_surface()
        self.create_surface(surface)
        
        xwm = Xwm()
        self._map_window(window, xwm.get_root(), surface.get_id())
    
    def _map_window(self, window: Window, root: int, id: int) -> int:
        surface = self.get_surface_by_id(id)
        
        if not surface or not surface.is_visible():
            return 0
        
        decoration = surface.create_decoration()
        decoration.set_geometry(x11_position())
        
        self._map_decoration(window, decoration)
        
        self.focus(surface)
    
    def _map_decoration(self, window: Window, decoration: Decoration) -> int:
        decoration.set_visible(true)
        
        return decoration.get_id()
```

--- Conclusion ---

Adding a complete implementation of an AI-powered XWayland/Ubuyntus Completion Daemon for the Geometry OS systems team is a challenging task that requires a deep understanding of Smithay's compositor, LM Studio, and X11/Xwayland. This proposaal provides a concretie implementation plan or code solution for this task. The proposed solution uses an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuyntus integration code, specifically the `XwmHandler` trait implementation and related window management logic. The proposaal also proposes a Python or Rust code snippet for surface mapping, input focus coordination, and WinDecoration rendering, respectively, that can be used by users to customize their XWayland/Ubuntus integration with Geometry OS. Overall, this proposaal provides a clear and concretie solution that aligns with Smithay's philosophy of compositor autonomy.
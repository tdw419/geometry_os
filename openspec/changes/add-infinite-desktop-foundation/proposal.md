# Proposal: Infinite Map as Primary Visual Shell

## Context
Geometry OS requires a visual interface that matches its underlying tensor-based architecture. The current HTML prototype (`infinite_desktop.html`) demonstrates the concept: an infinite, zoomable, Hilbert-mapped 2D plane where apps reside as "Window Particles".

## Objective
Establish the **Infinite Map** as the foundational shell (compositor) for Geometry OS, replacing traditional desktop environments.

## Why?
- **Geometric Alignment**: The OS storage is a 2D Hilbert curve; the OS interface should be a navigation of that same curve.
- **RTS Native**: Leveraging the RTS driver effectively means "The hard drive is the screen."
- **Spatial Memory**: Exploits human spatial cognition (loci method) for file/app management.

## Architecture: The "RTS Linux Compositor"
We will implement a native Rust compositor (`systems/infinite_map_rs`) that:
1.  **Backing Store**: Maps the `geometry_os.rts` file into memory via the `rts_rs` driver logic.
2.  **Rendering Engine**: Uses `wgpu` (WebGPU for Rust) to render the Hilbert curve substrate at 60fps.
3.  **Window Management**: Implements a Wayland compositor (via `Smithay` or `winit`+custom logic) to place application windows onto the map.

## Implementation Phases
1.  **Phase 1 (Foundation)**: Port `infinite_desktop.html` logic to Rust + WGPU.
2.  **Phase 2 (RTS Link)**: Feed the live RTS texture into the background shader.
3.  **Phase 3 (Windowing)**: Enable X11/Wayland apps to render onto the surface.

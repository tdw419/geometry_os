# Glyph-Atomic Windowing: Native Geometry OS Design

## Vision
A "Fully Native" Windowing System where windows are not pixel buffers, but **Autonomous Spatial Programs** arranged in the Glyph Stratum. This system eliminates human-made languages (Rust, WGSL, etc.) in favor of self-describing, font-atomic programs that execute directly on the GPU substrate.

## Architectural Layers (GlyphStratum 5-Layer Model)

### L0: Substrate (Physical Reality)
- **Screen**: A raw 2D texture (the visual hard drive).
- **Atlas**: The Instruction Cache (pre-rendered GEOS font opcodes).
- **Registers/Memory**: Fast GPU storage for spatial state.

### L1: Memory (Spatial State)
- **Window Descriptor Glyphs**: Specific glyphs in the stratum that store (X, Y, W, H, Z-Index).
- **Coordinate Offsets**: Local coordinate systems for each "window" region.

### L2: Logic (Spatial Opcodes)
The "Windowing Opcodes" that handle the UI:
- **`DRAW` (215u)**: Blits a glyph from the atlas to the screen.
- **`WINDOW_CLIP`**: Limits execution/rendering to a specific rectangular region.
- **`MOVE_WINDOW`**: Opcodes that update the L1 Memory glyphs based on mouse input.
- **`Z_ORDER`**: Opcodes that sort the execution sequence of window programs.

### L3: Spec (Visual Templates)
- Templates for window borders, title bars, and buttons, all constructed from primitive font characters.

### L4: Intent (Global Coordination)
- The high-level OS goals (e.g., "Open a new application window at the mouse position").

## The "Visual Bootstrapping" Strategy
1. **Incubation**: Use the current WGPU/WGSL substrate to "grow" the initial glyph programs.
2. **Elimination**: Progressively replace Rust-based compositor logic (Smithay/Wayland) with glyph-atomic logic.
3. **Pure Execution**: Move the final, self-sufficient glyph programs to a bare-metal framebuffer environment.

## Verification & Prototype
- **Native Drag Prototype**: Implement a window-drag script using only existing `MOV`, `ST`, and `DRAW` opcodes in `glyph_microcode.wgsl`.
- **Z-Sorting Test**: Demonstrate two windows overlapping and changing focus via glyph-level state updates.

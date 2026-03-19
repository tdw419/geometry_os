# ASCII Workspace Plan (The Ultimate GPU Ascension)

> "Let's use the ASCII system to replace infinite_map_rs."

## Objective
Eliminate the heavy Rust/Smithay Wayland compositor (`infinite_map_rs`) and replace it with a pure GPU-native **ASCII Workspace Cartridge**. The OS Window Manager and UI will be entirely defined in an `.ascii` file and executed natively on the GPU by the Glyph VM, fulfilling the ultimate "GPU-First" vision.

## Background & Motivation
Currently, `infinite_map_rs` contains thousands of lines of Rust code to handle window dragging, text editing, rendering, and event routing. Now that we have achieved **Level 3 Sovereignty (Self-Hosting)** with a native ASCII assembler running on the GPU, we no longer need the CPU to manage the UI. The GPU can manage its own spatial windows.

## Scope & Impact
- **Phase 1:** Create `workspace.ascii`, a self-contained window manager written in ASCII/Glyph Assembly.
- **Phase 2:** Create `micro_host.rs`, a severely stripped-down Rust bootloader that *only* initializes WGPU, sets up the `GlyphVmScheduler`, blits the RAM texture to the screen, and forwards raw input to a hardware mailbox.
- **Phase 3:** Boot the system. The Micro-Host loads `workspace.ascii` into VM #0 and steps back. The GPU takes over completely.

## Proposed Solution

### 1. The Workspace Cartridge (`workspace.ascii`)
This file will be the new OS shell.
- **Visuals:** An 80x24 (or larger) ASCII grid defining the desktop background, system stats, and a default "terminal" or editor window.
- **Logic (Inline Assembly):**
    - **Event Loop:** Continuously poll the hardware mailbox (e.g., address `0x0200`).
    - **Input Handling:** Read raw mouse coordinates and click states.
    - **Spatial Management:** If a click falls on a window border, execute `Pixels Move Pixels` logic to drag the memory block representing that window to a new spatial coordinate.
    - **Spawning:** Clicking a cartridge icon uses `SPATIAL_SPAWN` to boot a new VM.

### 2. The Micro-Host (`systems/infinite_map_rs/src/bin/micro_host.rs`)
A new, minimal Rust binary that replaces the main `infinite_map_rs` Wayland compositor.
- Drops Smithay, Wayland, and all complex CPU-side UI structs (`App`, `TextEngine`, `Window`).
- Simply initializes `winit` for an OS window (or KMS/DRM for bare metal).
- Initializes `wgpu`.
- Instantiates `GlyphVmScheduler`.
- Writes mouse/keyboard events into the VM #0 mailbox buffer.
- Dispatches the compute shader 60 times a second.

## Implementation Steps

1.  **Draft `workspace.ascii`:** Write the visual layout and the core event polling loop in Glyph Assembly.
2.  **Add Mailbox Support:** Ensure the `GlyphVmScheduler` WGSL shader has a dedicated buffer or memory address (`0x0200` to `0x020F`) for the host to write raw input events.
3.  **Build `micro_host.rs`:** Write the minimal WGPU bootloader.
4.  **Integrate:** Compile `workspace.ascii` to `.rts.png` using the self-hosting compiler, then boot it using `micro_host`.

## Alternatives Considered
- *Refactoring `infinite_map_rs`:* We could slowly hollow out the Rust compositor. However, creating a clean `micro_host.rs` parallel binary is safer and provides an immediate, pure "GPU-First" execution environment without breaking the current setup.

## Verification
- Boot `micro_host.rs` with `workspace.ascii`.
- Move the mouse and verify the ASCII cursor moves without any Rust CPU logic calculating the movement.
- Click and drag an ASCII window on the screen using pure GPU compute logic.

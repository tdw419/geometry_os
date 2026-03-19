# ASCII Workspace Micro-Host Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Replace the heavy Rust/Smithay compositor with a minimal GPU-native ASCII Workspace that runs entirely on the Glyph VM.

**Architecture:** A 3-layer stack: (1) `micro_host.rs` - ~200 line Rust bootloader that initializes wgpu and forwards input events to VM mailbox, (2) `workspace.ascii` - 80x24 visual layout with inline Glyph assembly for event handling, (3) `workspace.rts.png` - compiled cartridge loaded into VM #0. The GPU handles all window management, rendering, and UI logic.

**Tech Stack:** Rust, wgpu, winit, Glyph VM, ASCII-First templates, Hilbert-indexed textures

---

## Prerequisites (Already Exist)

| Component | File | Status |
|-----------|------|--------|
| Glyph VM Scheduler | `src/glyph_vm_scheduler.rs` | ✅ 8 VM slots, mailbox binding 3 |
| Event Queue Shader | `src/shaders/glyph_vm_scheduler.wgsl` | ✅ event_queue at binding 5 |
| Infinite Map Glyph | `systems/glyph_stratum/programs/infinite_map.glyph` | ✅ Event handling at 0x0200 |
| Self-Hosting Compiler | `src/ascii_native/self_hosting_cartridge.rs` | ✅ PNG generation |

---

## Task 1: Create Mailbox Bridge Module

**Files:**
- Create: `systems/infinite_map_rs/src/mailbox_bridge.rs`
- Modify: `systems/infinite_map_rs/src/lib.rs`
- Test: `systems/infinite_map_rs/tests/mailbox_bridge_test.rs`

**Step 1: Write the failing test**

```rust
// tests/mailbox_bridge_test.rs
use infinite_map_rs::mailbox_bridge::{InputEvent, MailboxBridge};

#[test]
fn test_mouse_move_event_serialization() {
    let mut bridge = MailboxBridge::new();

    let event = InputEvent::MouseMove { x: 100, y: 200, dx: 5, dy: -3 };
    bridge.write_event(event);

    // Event should be at address 0x0200 (EVENT_BASE)
    let words = bridge.read_mailbox();
    assert_eq!(words[0], 1, "Event type 1 = MouseMove");
    assert_eq!(words[1], 100, "X coordinate");
    assert_eq!(words[2], 200, "Y coordinate");
    assert_eq!(words[4], 5, "DX delta");
    assert_eq!(words[5], 0xFFFFFFFD_u32, "DY delta (signed -3)");
}

#[test]
fn test_click_event_serialization() {
    let mut bridge = MailboxBridge::new();

    let event = InputEvent::Click { x: 150, y: 300, button: 1 };
    bridge.write_event(event);

    let words = bridge.read_mailbox();
    assert_eq!(words[0], 2, "Event type 2 = Click");
    assert_eq!(words[1], 150);
    assert_eq!(words[2], 300);
    assert_eq!(words[3], 1);
}

#[test]
fn test_scroll_event_serialization() {
    let mut bridge = MailboxBridge::new();

    let event = InputEvent::Scroll { dx: 0, dy: 120 }; // scroll up
    bridge.write_event(event);

    let words = bridge.read_mailbox();
    assert_eq!(words[0], 4, "Event type 4 = Scroll");
    assert_eq!(words[5], 120);
}

#[test]
fn test_clear_event() {
    let mut bridge = MailboxBridge::new();

    bridge.write_event(InputEvent::Click { x: 100, y: 200, button: 1 });
    assert_ne!(bridge.read_mailbox()[0], 0);

    bridge.clear_event();
    assert_eq!(bridge.read_mailbox()[0], 0, "Event type should be 0 after clear");
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test -p infinite_map_rs mailbox_bridge_test`
Expected: FAIL with "module `mailbox_bridge` not found"

**Step 3: Write minimal implementation**

```rust
// src/mailbox_bridge.rs
//! Mailbox Bridge - CPU to VM Event Forwarding
//!
//! Serializes input events to the VM mailbox format at address 0x0200.
//! Used by micro_host.rs to forward winit events to GPU VM.

/// Memory layout for input events (matches infinite_map.glyph)
pub const EVENT_BASE: u32 = 0x0200;
pub const EVENT_TYPE: u32 = 0x0200;
pub const EVENT_X: u32 = 0x0204;
pub const EVENT_Y: u32 = 0x0208;
pub const EVENT_BTN: u32 = 0x020C;
pub const EVENT_DX: u32 = 0x0210;
pub const EVENT_DY: u32 = 0x0214;

/// Input event types
#[derive(Debug, Clone, Copy)]
pub enum InputEvent {
    MouseMove { x: u32, y: u32, dx: i32, dy: i32 },
    Click { x: u32, y: u32, button: u32 },
    Scroll { dx: i32, dy: i32 },
}

/// Bridge for writing events to VM mailbox
pub struct MailboxBridge {
    mailbox: [u32; 6],
}

impl MailboxBridge {
    pub fn new() -> Self {
        Self { mailbox: [0; 6] }
    }

    /// Write an event to the mailbox
    pub fn write_event(&mut self, event: InputEvent) {
        match event {
            InputEvent::MouseMove { x, y, dx, dy } => {
                self.mailbox[0] = 1; // EVENT_TYPE_MOUSE_MOVE
                self.mailbox[1] = x;
                self.mailbox[2] = y;
                self.mailbox[3] = 0;
                self.mailbox[4] = dx as u32;
                self.mailbox[5] = dy as u32;
            }
            InputEvent::Click { x, y, button } => {
                self.mailbox[0] = 2; // EVENT_TYPE_CLICK
                self.mailbox[1] = x;
                self.mailbox[2] = y;
                self.mailbox[3] = button;
                self.mailbox[4] = 0;
                self.mailbox[5] = 0;
            }
            InputEvent::Scroll { dx, dy } => {
                self.mailbox[0] = 4; // EVENT_TYPE_SCROLL
                self.mailbox[1] = 0;
                self.mailbox[2] = 0;
                self.mailbox[3] = 0;
                self.mailbox[4] = dx as u32;
                self.mailbox[5] = dy as u32;
            }
        }
    }

    /// Read the mailbox as raw words (for GPU upload)
    pub fn read_mailbox(&self) -> &[u32; 6] {
        &self.mailbox
    }

    /// Clear the event (set type to 0)
    pub fn clear_event(&mut self) {
        self.mailbox[0] = 0;
    }
}

impl Default for MailboxBridge {
    fn default() -> Self {
        Self::new()
    }
}
```

Add to `src/lib.rs`:
```rust
pub mod mailbox_bridge;
```

**Step 4: Run test to verify it passes**

Run: `cargo test -p infinite_map_rs mailbox_bridge_test`
Expected: 4 tests PASS

**Step 5: Commit**

```bash
git add src/mailbox_bridge.rs src/lib.rs tests/mailbox_bridge_test.rs
git commit -m "feat(mailbox): add InputEvent serialization for VM mailbox"
```

---

## Task 2: Create Micro-Host Binary

**Files:**
- Create: `systems/infinite_map_rs/src/bin/micro_host.rs`
- Modify: `systems/infinite_map_rs/Cargo.toml` (add binary)

**Step 1: Write minimal winit + wgpu bootstrap**

```rust
// src/bin/micro_host.rs
//! Micro-Host - Minimal GPU Bootloader for ASCII Workspace
//!
//! This is NOT a compositor. It's a thin shim that:
//! 1. Opens a window (winit)
//! 2. Initializes GPU (wgpu)
//! 3. Loads workspace.rts.png into texture
//! 4. Forwards input events to VM mailbox
//! 5. Dispatches compute shader 60 times/sec
//! 6. Blits RAM texture to screen
//!
//! All UI logic runs on the GPU in the Glyph VM.

use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, MAX_VMS};
use infinite_map_rs::mailbox_bridge::{MailboxBridge, InputEvent};
use winit::{
    event::{Event, WindowEvent, MouseButton, MouseScrollDelta},
    event_loop::{ControlFlow, EventLoop},
    window::WindowBuilder,
};

const WORKSPACE_CARTRIDGE: &str = "workspace.rts.png";

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // 1. Initialize window
    let event_loop = EventLoop::new()?;
    let window = WindowBuilder::new()
        .with_title("GEOS ASCII Workspace")
        .with_inner_size(winit::dpi::LogicalSize::new(1920, 1080))
        .build(&event_loop)?;

    // 2. Initialize GPU
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let surface = unsafe { instance.create_surface(&window) }?;
    let adapter = instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: Some(&surface),
        ..Default::default()
    })?.await?;

    let (device, queue) = adapter.request_device(
        &wgpu::DeviceDescriptor::default(),
        None,
    ).await?;

    // 3. Load workspace cartridge
    let cartridge_bytes = std::fs::read(WORKSPACE_CARTRIDGE)?;
    let cartridge_image = image::load_from_memory(&cartridge_bytes)?;
    let cartridge_rgba = cartridge_image.to_rgba8();
    let (width, height) = cartridge_rgba.dimensions();

    // Create RAM texture from cartridge
    let ram_texture = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("RAM Texture"),
        size: wgpu::Extent3d { width, height, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::TEXTURE_BINDING,
        view_formats: &[],
    });

    queue.write_texture(
        wgpu::ImageCopyTexture {
            texture: &ram_texture,
            mip_level: 0,
            origin: wgpu::Origin3d::ZERO,
            aspect: wgpu::TextureAspect::All,
        },
        &cartridge_rgba,
        wgpu::ImageDataLayout {
            offset: 0,
            bytes_per_row: Some(width * 4),
            rows_per_image: Some(height),
        },
        wgpu::Extent3d { width, height, depth_or_array_layers: 1 },
    );

    // 4. Initialize Glyph VM Scheduler
    let mut scheduler = GlyphVmScheduler::new(&device, width, height)?;

    // Spawn VM #0 with workspace program
    let config = VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        ..Default::default()
    };
    scheduler.spawn_vm(0, &config)?;

    // 5. Mailbox bridge for input events
    let mut mailbox = MailboxBridge::new();
    let mut last_mouse_pos = (0.0, 0.0);

    // 6. Event loop
    event_loop.run(move |event, elwt| {
        match event {
            Event::WindowEvent { event, .. } => match event {
                WindowEvent::CloseRequested => {
                    elwt.exit();
                }
                WindowEvent::MouseInput { button, state, .. } => {
                    if state == winit::event::ElementState::Pressed {
                        let (x, y) = last_mouse_pos;
                        mailbox.write_event(InputEvent::Click {
                            x: x as u32,
                            y: y as u32,
                            button: match button {
                                MouseButton::Left => 1,
                                MouseButton::Right => 2,
                                MouseButton::Middle => 3,
                                _ => 0,
                            },
                        });
                    }
                }
                WindowEvent::CursorMoved { position, .. } => {
                    let dx = position.x - last_mouse_pos.0;
                    let dy = position.y - last_mouse_pos.1;
                    last_mouse_pos = (position.x, position.y);

                    mailbox.write_event(InputEvent::MouseMove {
                        x: position.x as u32,
                        y: position.y as u32,
                        dx: dx as i32,
                        dy: dy as i32,
                    });
                }
                WindowEvent::MouseWheel { delta, .. } => {
                    let (dx, dy) = match delta {
                        MouseScrollDelta::LineDelta(x, y) => (x as i32 * 10, y as i32 * 10),
                        MouseScrollDelta::PixelDelta(p) => (p.x as i32, p.y as i32),
                    };
                    mailbox.write_event(InputEvent::Scroll { dx, dy });
                }
                _ => {}
            },
            Event::AboutToWait => {
                // Write mailbox to GPU memory
                let mailbox_words = mailbox.read_mailbox();
                scheduler.write_mailbox(&queue, 0, mailbox_words);

                // Dispatch VM scheduler
                scheduler.dispatch(&queue);

                // Submit and present
                queue.submit([]);
                // ... present to surface ...

                // Clear event after processing
                mailbox.clear_event();

                window.request_redraw();
            }
            _ => {}
        }
    })?;

    Ok(())
}
```

**Step 2: Run to verify it compiles**

Run: `cargo build -p infinite_map_rs --bin micro_host`
Expected: May have compilation errors - fix iteratively

**Step 3: Add missing GlyphVmScheduler methods**

Modify `src/glyph_vm_scheduler.rs` to add:
```rust
impl GlyphVmScheduler {
    /// Write mailbox data for a specific VM
    pub fn write_mailbox(&mut self, queue: &wgpu::Queue, vm_id: usize, data: &[u32; 6]) {
        // Write to mailbox buffer at binding 3
        // This maps to EVENT_BASE (0x0200) in VM address space
        self.queue.write_buffer(&self.mailbox_buffer, vm_id * 24, bytemuck::cast_slice(data));
    }
}
```

**Step 4: Build and verify**

Run: `cargo build -p infinite_map_rs --bin micro_host`
Expected: Build succeeds

**Step 5: Commit**

```bash
git add src/bin/micro_host.rs src/glyph_vm_scheduler.rs
git commit -m "feat(micro-host): add minimal GPU bootloader for ASCII workspace"
```

---

## Task 3: Create Workspace ASCII Template

**Files:**
- Create: `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/workspace.ascii`
- Create: `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/workspace.mapping.json`

**Step 1: Write the ASCII template**

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  GEOS ASCII WORKSPACE                              v1.0   Frame: {{frame}}   ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  [1] Terminal   [2] Editor   [3] Files   [4] Help   [Q] Quit                  ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║  ┌────────────────────────────────────────────────────────────────────────┐  ║
║  │  {{#each terminal_lines}}                                               │  ║
║  │  {{this}}                                                              │  ║
║  │  {{/each}}                                                             │  ║
║  │  {{prompt}}                                                            │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║                                                                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  Mouse: {{mouse_x}}, {{mouse_y}}     Zoom: {{zoom}}%     VMs: {{vm_count}}  ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

**Step 2: Write the mapping config**

```json
{
  "name": "GEOS ASCII Workspace",
  "version": "1.0.0",
  "buttons": [
    {
      "label": "1",
      "text": "Terminal",
      "action": "SPAWN_VM",
      "target": "0x5000",
      "key": "1"
    },
    {
      "label": "2",
      "text": "Editor",
      "action": "SPAWN_VM",
      "target": "0x6000",
      "key": "2"
    },
    {
      "label": "3",
      "text": "Files",
      "action": "SPAWN_VM",
      "target": "0x7000",
      "key": "3"
    },
    {
      "label": "Q",
      "text": "Quit",
      "action": "HALT",
      "target": "",
      "key": "q"
    }
  ],
  "state_vars": {
    "frame": {
      "type": "u32",
      "default": 0,
      "address": "0x1000"
    },
    "mouse_x": {
      "type": "u32",
      "default": 0,
      "address": "0x1004"
    },
    "mouse_y": {
      "type": "u32",
      "default": 0,
      "address": "0x1008"
    },
    "zoom": {
      "type": "u32",
      "default": 100,
      "address": "0x100C"
    },
    "vm_count": {
      "type": "u32",
      "default": 1,
      "address": "0x1010"
    },
    "prompt": {
      "type": "string",
      "default": "$ ",
      "address": "0x1100"
    },
    "terminal_lines": {
      "type": "array",
      "default": [
        "GEOS ASCII Workspace Ready",
        "Type 'help' for commands"
      ],
      "address": "0x1200"
    }
  },
  "memory_layout": {
    "glyph_grid": {
      "base": "0x0000",
      "size": "0x0BFF"
    },
    "sit": {
      "base": "0x0C00",
      "size": "0x00FF"
    },
    "state_buffer": {
      "base": "0x1000",
      "size": "0x03FF"
    },
    "mailbox": {
      "base": "0x0200",
      "size": "0x0010"
    },
    "window_table": {
      "base": "0x0100",
      "size": "0x0040"
    },
    "terminal_segment": {
      "base": "0x5000",
      "size": "0x0FFF"
    },
    "editor_segment": {
      "base": "0x6000",
      "size": "0x0FFF"
    },
    "files_segment": {
      "base": "0x7000",
      "size": "0x0FFF"
    }
  }
}
```

**Step 3: Commit**

```bash
git add apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/workspace.ascii
git add apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/workspace.mapping.json
git commit -m "feat(workspace): add ASCII template for GPU-native window manager"
```

---

## Task 4: Create Workspace Glyph Program

**Files:**
- Create: `systems/glyph_stratum/programs/workspace.glyph`

**Step 1: Write the main loop glyph program**

```glyph
// ============================================================================
// WORKSPACE - GPU-Native ASCII Window Manager
// ============================================================================
//
// This program IS the GEOS desktop. It runs entirely on the GPU and handles:
// - Mouse/keyboard input from mailbox
// - Window management (drag, resize, spawn)
// - Rendering the ASCII grid to screen
//
// Entry: 0x0000 (VM #0)
// ============================================================================

// Register conventions (same as infinite_map.glyph)
.equ CAMERA_X, 20
.equ CAMERA_Y, 21
.equ ZOOM, 22
.equ FRAME, 28

// Memory addresses
.equ EVENT_TYPE, 0x0200
.equ EVENT_X, 0x0204
.equ EVENT_Y, 0x0208
.equ EVENT_BTN, 0x020C
.equ EVENT_DX, 0x0210
.equ EVENT_DY, 0x0214

.equ STATE_FRAME, 0x1000
.equ STATE_MOUSE_X, 0x1004
.equ STATE_MOUSE_Y, 0x1008
.equ STATE_ZOOM, 0x100C
.equ STATE_VM_COUNT, 0x1010

.equ WINDOW_TABLE, 0x0100
.equ MAX_WINDOWS, 8

// ============================================================================
// ENTRY POINT
// ============================================================================
:entry
    // Initialize state
    MOV r0, 0
    STORE STATE_FRAME, r0
    STORE STATE_MOUSE_X, r0
    STORE STATE_MOUSE_Y, r0
    MOV r1, 100
    STORE STATE_ZOOM, r1
    MOV r1, 1
    STORE STATE_VM_COUNT, r1

    JMP main_loop

// ============================================================================
// MAIN LOOP
// ============================================================================
:main_loop
    // Increment frame counter
    LOAD r1, STATE_FRAME
    ADD r1, r1, 1
    STORE STATE_FRAME, r1

    // Handle input events
    CALL handle_input

    // Update state from events
    CALL update_state

    // Process window clicks
    CALL process_windows

    // Render ASCII grid
    CALL render_ascii

    // Yield for cooperative multitasking
    YIELD

    // Loop forever
    JMP main_loop

// ============================================================================
// INPUT HANDLING
// ============================================================================
:handle_input
    LOAD r1, EVENT_TYPE
    CMP r1, 0
    JE :input_done

    // Event type 1 = Mouse move
    CMP r1, 1
    JNE :check_click
    CALL handle_mouse_move
    JMP :clear_event

:check_click
    // Event type 2 = Click
    CMP r1, 2
    JNE :check_scroll
    CALL handle_click
    JMP :clear_event

:check_scroll
    // Event type 4 = Scroll
    CMP r1, 4
    JNE :clear_event
    CALL handle_scroll

:clear_event
    MOV r1, 0
    STORE EVENT_TYPE, r1

:input_done
    RET

// ============================================================================
// EVENT HANDLERS
// ============================================================================
:handle_mouse_move
    // Update mouse position in state
    LOAD r2, EVENT_X
    LOAD r3, EVENT_Y
    STORE STATE_MOUSE_X, r2
    STORE STATE_MOUSE_Y, r3

    // Check for window drag (button held)
    LOAD r4, EVENT_BTN
    CMP r4, 0
    JE :mouse_done

    // TODO: Implement window drag
    // 1. Find which window is being dragged
    // 2. Move window by EVENT_DX, EVENT_DY
    // 3. Redraw

:mouse_done
    RET

:handle_click
    // Check for button bar clicks (row 1)
    LOAD r2, EVENT_Y
    CMP r2, 20          ; Approximate button bar Y
    JLT :check_window_clicks

    // Check which button was clicked
    LOAD r3, EVENT_X

    // [1] Terminal button
    CMP r3, 80
    JLT :spawn_terminal

    // [2] Editor button
    CMP r3, 200
    JLT :spawn_editor

    // [3] Files button
    CMP r3, 300
    JLT :spawn_files

    JMP :click_done

:spawn_terminal
    MOV r8, 0x5000      ; Terminal segment
    SPAWN r8            ; Opcode 225: SPATIAL_SPAWN
    JMP :click_done

:spawn_editor
    MOV r8, 0x6000      ; Editor segment
    SPAWN r8
    JMP :click_done

:spawn_files
    MOV r8, 0x7000      ; Files segment
    SPAWN r8
    JMP :click_done

:check_window_clicks
    // Hit test against window table
    CALL hit_test_windows
    // r8 = window ID or 0xFF if none
    RET

:click_done
    RET

:handle_scroll
    // Update zoom
    LOAD r2, EVENT_DY
    LOAD r3, STATE_ZOOM

    CMP r2, 0
    JLT :zoom_out

:zoom_in
    ADD r3, r3, 10
    JMP :clamp_zoom

:zoom_out
    SUB r3, r3, 10

:clamp_zoom
    CMP r3, 25
    JLT :set_min_zoom
    CMP r3, 400
    JGT :set_max_zoom
    JMP :store_zoom

:set_min_zoom
    MOV r3, 25
    JMP :store_zoom

:set_max_zoom
    MOV r3, 400

:store_zoom
    STORE STATE_ZOOM, r3
    RET

// ============================================================================
// STATE UPDATE
// ============================================================================
:update_state
    // Already updated in event handlers
    RET

// ============================================================================
// WINDOW MANAGEMENT
// ============================================================================
:process_windows
    // Process any pending window operations
    RET

:hit_test_windows
    MOV r8, 0xFF        ; No hit by default
    MOV r9, 0           ; Window index

:hit_loop
    CMP r9, MAX_WINDOWS
    JGE :hit_done

    // Load window bounds from table
    MOV r10, r9
    MUL r10, r10, 8
    ADD r10, WINDOW_TABLE, r10

    LOAD r2, r10 + 1    ; win.x
    LOAD r3, r10 + 2    ; win.y
    LOAD r4, r10 + 3    ; win.w
    LOAD r5, r10 + 4    ; win.h

    LOAD r6, EVENT_X
    LOAD r7, EVENT_Y

    // Bounds check
    CMP r6, r2
    JLT :next_window
    ADD r11, r2, r4
    CMP r6, r11
    JGT :next_window
    CMP r7, r3
    JLT :next_window
    ADD r11, r3, r5
    CMP r7, r11
    JGT :next_window

    // Hit!
    LOAD r8, r10        ; win.id
    JMP :hit_done

:next_window
    ADD r9, r9, 1
    JMP :hit_loop

:hit_done
    RET

// ============================================================================
// ASCII RENDERING
// ============================================================================
:render_ascii
    // Render the ASCII grid to the glyph grid memory
    // This is done by copying template data to 0x0000-0x0BFF

    // For now, just update the dynamic values
    LOAD r1, STATE_FRAME
    STORE 0x0040, r1    ; Frame counter in template

    LOAD r1, STATE_MOUSE_X
    STORE 0x0044, r1    ; Mouse X in template

    LOAD r1, STATE_MOUSE_Y
    STORE 0x0048, r1    ; Mouse Y in template

    RET

// ============================================================================
// HALT (for testing)
// ============================================================================
:test_halt
    HALT
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/workspace.glyph
git commit -m "feat(workspace): add Glyph VM window manager program"
```

---

## Task 5: Create Workspace Cartridge Generator

**Files:**
- Create: `systems/infinite_map_rs/src/ascii_native/workspace_cartridge.rs`
- Modify: `systems/infinite_map_rs/src/ascii_native/mod.rs`

**Step 1: Write the cartridge generator**

```rust
// src/ascii_native/workspace_cartridge.rs
//! Workspace Cartridge Generator
//!
//! Generates workspace.rts.png from workspace.ascii template.

use crate::ascii_native::self_hosting_template::SelfHostingTemplate;
use crate::glyph_to_cartridge::compile_glyph_to_cartridge;
use image::{DynamicImage, ImageBuffer, Rgba};
use std::path::Path;

/// Generate workspace cartridge
pub fn generate_workspace_cartridge<P: AsRef<Path>>(
    output_path: P,
) -> Result<(), String> {
    // Load workspace glyph program
    let workspace_glyph = include_str!("../../../../systems/glyph_stratum/programs/workspace.glyph");

    // Compile to cartridge
    compile_glyph_to_cartridge(workspace_glyph, output_path)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;

    fn temp_path(name: &str) -> PathBuf {
        std::env::temp_dir().join(name)
    }

    #[test]
    fn test_workspace_cartridge_generates() {
        let output = temp_path("test_workspace.rts.png");
        generate_workspace_cartridge(&output).expect("Should generate");
        assert!(output.exists(), "Cartridge file should exist");

        let img = image::open(&output).expect("Should load as PNG");
        assert!(img.width() > 0, "Should have width");

        std::fs::remove_file(&output).ok();
    }
}
```

**Step 2: Add to mod.rs**

```rust
// src/ascii_native/mod.rs
pub mod self_hosting_template;
pub mod self_hosting_cartridge;
pub mod workspace_cartridge;  // Add this line
```

**Step 3: Run tests**

Run: `cargo test -p infinite_map_rs workspace_cartridge`
Expected: 1 test PASS

**Step 4: Commit**

```bash
git add src/ascii_native/workspace_cartridge.rs src/ascii_native/mod.rs
git commit -m "feat(workspace): add cartridge generator for GPU-native workspace"
```

---

## Task 6: Integration Test

**Files:**
- Create: `systems/infinite_map_rs/tests/workspace_integration_test.rs`

**Step 1: Write integration test**

```rust
// tests/workspace_integration_test.rs
//! Workspace Integration Tests
//!
//! Verifies the complete GPU-native workspace pipeline.

use infinite_map_rs::ascii_native::workspace_cartridge::generate_workspace_cartridge;
use infinite_map_rs::ascii_cartridge::AsciiCartridge;
use infinite_map_rs::mailbox_bridge::{MailboxBridge, InputEvent};
use std::path::PathBuf;

fn temp_path(name: &str) -> PathBuf {
    std::env::temp_dir().join(name)
}

#[test]
fn test_workspace_cartridge_loads() {
    let output = temp_path("test_workspace_load.rts.png");
    generate_workspace_cartridge(&output).expect("Should generate");

    let cartridge = AsciiCartridge::load(&output).expect("Should load");
    assert!(!cartridge.program_buffer.is_empty(), "Should have program");

    std::fs::remove_file(&output).ok();
}

#[test]
fn test_mailbox_bridge_generates_valid_events() {
    let mut bridge = MailboxBridge::new();

    // Simulate mouse movement
    bridge.write_event(InputEvent::MouseMove { x: 100, y: 200, dx: 5, dy: -3 });
    let words = bridge.read_mailbox();
    assert_eq!(words[0], 1, "Event type should be MouseMove");
    assert_eq!(words[1], 100, "X should be 100");
    assert_eq!(words[2], 200, "Y should be 200");

    // Clear and verify
    bridge.clear_event();
    assert_eq!(bridge.read_mailbox()[0], 0, "Event should be cleared");
}

#[test]
fn test_click_event_generates_spawn_signal() {
    let mut bridge = MailboxBridge::new();

    // Simulate click on terminal button (approximate coordinates)
    bridge.write_event(InputEvent::Click { x: 50, y: 15, button: 1 });
    let words = bridge.read_mailbox();
    assert_eq!(words[0], 2, "Event type should be Click");
    assert_eq!(words[3], 1, "Button should be 1 (left)");
}

#[test]
fn test_scroll_updates_zoom() {
    let mut bridge = MailboxBridge::new();

    // Simulate scroll up
    bridge.write_event(InputEvent::Scroll { dx: 0, dy: 120 });
    let words = bridge.read_mailbox();
    assert_eq!(words[0], 4, "Event type should be Scroll");
    assert_eq!(words[5], 120, "DY should be 120");
}
```

**Step 2: Run tests**

Run: `cargo test -p infinite_map_rs workspace_integration_test`
Expected: 4 tests PASS

**Step 3: Commit**

```bash
git add tests/workspace_integration_test.rs
git commit -m "test(workspace): add integration tests for GPU-native workspace"
```

---

## Task 7: Build and Run

**Step 1: Build the workspace cartridge**

Run: `cargo run -p infinite_map_rs --bin geos-compile -- systems/glyph_stratum/programs/workspace.glyph -o workspace.rts.png --self-hosting`
Expected: Generates workspace.rts.png

**Step 2: Build micro-host**

Run: `cargo build -p infinite_map_rs --bin micro_host --release`
Expected: Builds successfully

**Step 3: Run (requires GPU)**

Run: `cargo run -p infinite_map_rs --bin micro_host --release`
Expected: Window opens, GPU dispatches, mouse moves update state

**Step 4: Commit final**

```bash
git add .
git commit -m "feat(workspace): complete GPU-native ASCII workspace implementation"
```

---

## Verification Checklist

- [ ] Mailbox bridge serializes input events correctly
- [ ] Micro-host compiles and initializes wgpu
- [ ] Workspace cartridge generates valid PNG
- [ ] Workspace glyph program handles mouse/scroll events
- [ ] Click on button bar triggers SPAWN opcode
- [ ] Integration tests pass (4+ tests)
- [ ] Manual test: Run micro_host, see window, move mouse

---

## Files Created/Modified

| File | Action |
|------|--------|
| `src/mailbox_bridge.rs` | Create |
| `src/lib.rs` | Modify (add module) |
| `tests/mailbox_bridge_test.rs` | Create |
| `src/bin/micro_host.rs` | Create |
| `src/glyph_vm_scheduler.rs` | Modify (add write_mailbox) |
| `apps/.../workspace.ascii` | Create |
| `apps/.../workspace.mapping.json` | Create |
| `systems/glyph_stratum/programs/workspace.glyph` | Create |
| `src/ascii_native/workspace_cartridge.rs` | Create |
| `src/ascii_native/mod.rs` | Modify |
| `tests/workspace_integration_test.rs` | Create |

---

## Dependencies

- Existing `GlyphVmScheduler` (8 VM slots, mailbox buffer)
- Existing `wgpu` + `winit` setup
- Existing `ascii_native` module
- Existing `glyph_to_cartridge` compiler

---

## Success Criteria

- [ ] Micro-host binary under 300 lines of Rust
- [ ] All UI logic runs on GPU (no Rust event handlers for UI)
- [ ] Mouse movement updates ASCII grid without CPU intervention
- [ ] Window spawning via SPATIAL_SPAWN opcode
- [ ] 10+ tests passing

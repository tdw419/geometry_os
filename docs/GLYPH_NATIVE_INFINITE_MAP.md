# Glyph-Native Infinite Map

## Building the Infinite Map with Geometry OS Fonts

The infinite map is currently written in Rust. To make it self-hosting, we need to express the entire map system as executable glyphs.

## Core Insight

The infinite map IS just memory addressed via Hilbert curve. The "map" doesn't exist as data structures - it IS the texture memory itself, indexed spatially.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     GLYPH-NATIVE INFINITE MAP                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   Hilbert Space (GPU Texture Memory)                                       │
│   ┌─────────────────────────────────────────────────────────────────────┐  │
│   │                                                                     │  │
│   │    Every pixel IS an address.                                       │  │
│   │    Every glyph at that address IS executable.                       │  │
│   │    The camera IS just a viewport into this space.                   │  │
│   │                                                                     │  │
│   │    (0,0) ──► Hilbert(0) ──► texture[0] = glyph                      │  │
│   │    (1,0) ──► Hilbert(1) ──► texture[1] = glyph                      │  │
│   │    ...                                                              │  │
│   │    (4095,4095) ──► Hilbert(16777215) ──► texture[N] = glyph         │  │
│   │                                                                     │  │
│   └─────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
│   Camera Glyph (VM #0)                                                      │
│   ┌─────────────────────────────────────────────────────────────────────┐  │
│   │   regs[CAMERA_X] = current camera X in Hilbert space               │  │
│   │   regs[CAMERA_Y] = current camera Y in Hilbert space               │  │
│   │   regs[ZOOM] = zoom level (1 = 1:1, 0.5 = 2:1, 2 = 1:2)            │  │
│   │                                                                     │  │
│   │   For each screen pixel (sx, sy):                                  │  │
│   │     world_x = sx * ZOOM + CAMERA_X                                 │  │
│   │     world_y = sy * ZOOM + CAMERA_Y                                 │  │
│   │     hilbert_d = xy_to_d(world_x, world_y)                          │  │
│   │     screen[sx,sy] = texture[hilbert_d]                             │  │
│   │                                                                     │  │
│   └─────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Glyph-Native Components

### 1. Camera Glyph (Opcode 230)

A dedicated opcode for viewport transformation:

```wgsl
// OP_CAMERA (230): Render viewport from Hilbert space to screen
case OP_CAMERA: {
    let cam_x = vm.regs[20];  // Camera X in world space
    let cam_y = vm.regs[21];  // Camera Y in world space
    let zoom = vm.regs[22];   // Zoom level (fixed-point 16.16)

    let screen_w = vm.regs[p1];  // Screen width
    let screen_h = vm.regs[p2];  // Screen height

    // For each screen pixel, sample from Hilbert space
    for (var sy = 0u; sy < screen_h; sy++) {
        for (var sx = 0u; sx < screen_w; sx++) {
            let world_x = f32(sx) / f32(zoom) + f32(cam_x);
            let world_y = f32(sy) / f32(zoom) + f32(cam_y);
            let d = xy_to_d(u32(world_x), u32(world_y));

            // Sample glyph from Hilbert space
            let glyph = textureLoad(ram, d_to_coords(d));
            textureStore(screen, vec2(sx, sy), glyph);
        }
    }
}
```

### 2. Infinite Map Glyph Program

```asm
; infinite_map.glyph - Self-hosting infinite map compositor
;
; This glyph IS the infinite map. When executed, it renders the viewport.
;
; Entry: 0x0000 (Hilbert origin)
; Stratum: SPEC (3) - This is a specification, not just logic

; ============================================================================
; CONSTANTS
; ============================================================================
.equ CAMERA_X, 20      ; Camera position registers
.equ CAMERA_Y, 21
.equ ZOOM, 22
.equ SCREEN_W, 23
.equ SCREEN_H, 24
.equ MOUSE_X, 25
.equ MOUSE_Y, 26
.equ MOUSE_BTN, 27

; ============================================================================
; ENTRY POINT
; ============================================================================
:entry
    ; Initialize camera at world origin
    MOV r0, 0
    MOV r[CAMERA_X], r0
    MOV r[CAMERA_Y], r0
    MOV r[ZOOM], 0x10000    ; 1.0 in 16.16 fixed point
    MOV r[SCREEN_W], 1920
    MOV r[SCREEN_H], 1080

    ; Jump to main loop
    JMP main_loop

; ============================================================================
; MAIN LOOP
; ============================================================================
:main_loop
    ; 1. Handle input (pan/zoom)
    CALL handle_input

    ; 2. Render viewport
    CALL render_viewport

    ; 3. Process window events
    CALL process_windows

    ; 4. Yield to scheduler (cooperative multitasking)
    YIELD

    ; 5. Loop forever
    JMP main_loop

; ============================================================================
; INPUT HANDLING
; ============================================================================
:handle_input
    ; Check for mouse drag (pan)
    LOAD r[MOUSE_BTN], mouse_button_addr
    CMP r[MOUSE_BTN], 0
    JE :input_done

    ; Pan camera based on mouse delta
    LOAD r3, mouse_dx_addr
    LOAD r4, mouse_dy_addr

    ; camera_x -= dx / zoom
    SUB r[CAMERA_X], r[CAMERA_X], r3
    SUB r[CAMERA_Y], r[CAMERA_Y], r4

:input_done
    RET

; ============================================================================
; VIEWPORT RENDERING
; ============================================================================
:render_viewport
    ; Use OP_CAMERA to render the viewport
    MOV r1, r[SCREEN_W]
    MOV r2, r[SCREEN_H]
    CAMERA r1, r2          ; Opcode 230

    RET

; ============================================================================
; WINDOW MANAGEMENT
; ============================================================================
:process_windows
    ; Check for clicks on window regions
    ; Hit test against window table

    LOAD r3, event_pending_addr
    CMP r3, 0
    JE :windows_done

    ; Event pending - process it
    CALL dispatch_event

:windows_done
    RET

; ============================================================================
; EVENT DISPATCH
; ============================================================================
:dispatch_event
    ; Load event type
    LOAD r3, event_type_addr

    ; Event type 1 = mouse click
    CMP r3, 1
    JNE :dispatch_done

    ; Hit test to find target window
    CALL hit_test_windows

    ; If hit, inject event to that window's mailbox
    CMP r7, 0xFF
    JE :dispatch_done      ; No window hit

    ; Send event to window r7
    MOV r8, r7
    CALL inject_to_mailbox

:dispatch_done
    ; Clear event
    MOV r3, 0
    STORE event_pending_addr, r3
    RET

; ============================================================================
; HIT TESTING
; ============================================================================
:hit_test_windows
    ; r[MOUSE_X], r[MOUSE_Y] = mouse position
    ; r7 = hit window ID (0xFF = none)

    MOV r7, 0xFF           ; Assume no hit
    MOV r8, 0              ; Window index

:hit_test_loop
    ; Load window bounds from window table
    ; window_table[index * 8 + 0] = id
    ; window_table[index * 8 + 1] = x
    ; window_table[index * 8 + 2] = y
    ; window_table[index * 8 + 3] = width
    ; window_table[index * 8 + 4] = height

    MUL r9, r8, 8
    ADD r9, window_table_base, r9

    LOAD r10, r9 + 1       ; win.x
    LOAD r11, r9 + 2       ; win.y
    LOAD r12, r9 + 3       ; win.w
    LOAD r13, r9 + 4       ; win.h

    ; Check if mouse in bounds
    ; if (mx >= x && mx <= x+w && my >= y && my <= y+h)

    ; mx < x?
    CMP r[MOUSE_X], r10
    JLT :next_window

    ; mx > x+w?
    ADD r14, r10, r12
    CMP r[MOUSE_X], r14
    JGT :next_window

    ; my < y?
    CMP r[MOUSE_Y], r11
    JLT :next_window

    ; my > y+h?
    ADD r14, r11, r13
    CMP r[MOUSE_Y], r14
    JGT :next_window

    ; HIT! Store window ID
    LOAD r7, r9 + 0        ; win.id
    JMP :hit_test_done

:next_window
    ADD r8, r8, 1
    CMP r8, 8              ; Max 8 windows
    JLT :hit_test_loop

:hit_test_done
    RET

; ============================================================================
; HALT
; ============================================================================
:halt
    HALT

; ============================================================================
; DATA SECTION
; ============================================================================
:mouse_x_addr        .word 0x0200
:mouse_y_addr        .word 0x0204
:mouse_button_addr   .word 0x0208
:mouse_dx_addr       .word 0x020C
:mouse_dy_addr       .word 0x0210
:event_pending_addr  .word 0x0214
:event_type_addr     .word 0x0218
:window_table_base   .word 0x0100
```

## The Bootstrap Problem

To run glyph-native code, we need GPU execution. But GPU execution requires Rust to set up wgpu. This creates a bootstrap problem:

```
┌─────────────────────────────────────────────────────────────────┐
│                    BOOTSTRAP LAYERS                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Layer 0: Hardware (GPU silicon)                               │
│  Layer 1: Firmware (VBIOS - initializes GPU)                   │
│  Layer 2: Driver (kernel DRM/KMS)                              │
│  Layer 3: API (wgpu - Rust GPU abstraction)  ← We are here     │
│  Layer 4: Seed (glyph_vm_scheduler.wgsl)                       │
│  Layer 5: Self (infinite_map.glyph running on GPU)             │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Path to Full Self-Hosting

### Phase 1: Hybrid (Current)
- Rust handles GPU initialization and dispatch
- Glyphs run logic and rendering on GPU
- Communication via memory-mapped regions

### Phase 2: WGSL Bootstrap
- Replace Rust dispatch with pure WGSL
- `glyph_vm_scheduler.wgsl` becomes the "kernel"
- Rust only does initial GPU setup, then hands off

### Phase 3: Native GPU Compute
- Use GPU compute shaders for EVERYTHING
- No CPU involvement after boot
- The GPU IS the computer

### Phase 4: Hardware Glyph Execution
- Hypothetical: GPU microcode that directly executes glyphs
- Custom silicon where glyphs ARE the native instruction set

## Implementation: Minimal Rust Seed

The Rust seed becomes minimal - just GPU init:

```rust
// seed.rs - The minimal Rust bootstrap
fn main() {
    // 1. Initialize GPU
    let (device, queue) = init_gpu();

    // 2. Load seed glyph into RAM texture
    let ram = load_glyph_program("seed.glyph");

    // 3. Create scheduler with one VM slot
    let scheduler = GlyphScheduler::new(device, queue, ram);

    // 4. Boot seed glyph as VM #0
    scheduler.spawn_vm(0, 0x0000);

    // 5. HAND OFF - Rust sleeps forever
    loop {
        scheduler.execute_frame();
        std::thread::sleep(Duration::from_micros(16667));
    }
}
```

## Key Opcodes for Infinite Map

| Opcode | Name | Description |
|--------|------|-------------|
| 230 | OP_CAMERA | Render viewport from Hilbert space |
| 231 | OP_HILBERT_D2XY | Convert Hilbert index to (x,y) |
| 232 | OP_HILBERT_XY2D | Convert (x,y) to Hilbert index |
| 233 | OP_TILE_LOAD | Load a tile region from storage |
| 234 | OP_TILE_EVICT | Evict a tile region from VRAM |
| 235 | OP_ZOOM | Set zoom level |
| 236 | OP_PAN | Pan camera by delta |

## The Beautiful Truth

The infinite map IS already glyph-native. The Hilbert-indexed texture memory IS the map. The Rust code is just a camera - a viewport that samples from this space.

When we run `infinite_map.glyph`, the glyph program reads from the same texture memory, applies the same Hilbert transformation, and produces the same output - but without any Rust code involved in the rendering logic.

**The map was always glyphs. We just needed to wake it up.**

---

*Last updated: 2026-03-13*

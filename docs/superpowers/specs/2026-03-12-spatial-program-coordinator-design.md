# Spatial Program Coordinator Design

**Date:** 2026-03-12
**Status:** Draft
**Approach:** Hybrid (Minimal Spec + Parallel Prototype)

---

## Overview

The Spatial Program Coordinator is the Geometry OS equivalent of a windowing system. In a GPU-first, glyph-native OS, applications are not rendered surfaces — they are autonomous regions of executing glyphs on the Infinite Map.

This spec defines:
1. **Interrupt Protocol** — How events become spatial glyphs
2. **Application Header** — How apps declare their requirements
3. **Syscall Interface** — How apps communicate with the Coordinator

---

## 1. Interrupt Protocol

Events (keyboard, mouse) are injected as spatial glyphs that propagate until caught.

### Interrupt Glyph Format

4-byte packet encoded as spatial data:

| Offset | Field     | Size | Description                    |
|--------|-----------|------|--------------------------------|
| 0      | type      | u8   | 0x01=KEYBOARD, 0x02=MOUSE      |
| 1      | payload   | u8   | Keycode or button ID           |
| 2-3    | timestamp | u16  | Frame counter                  |
| 4      | source    | u8   | Device seat (multi-seat)       |

### Injection Points

| Event Type  | Injection Location                            |
|-------------|-----------------------------------------------|
| Keyboard    | Entry point glyph (top-left of app region)    |
| Mouse click | Exact (x, y) coordinate within app's stratum  |
| Mouse hover | Continuous stream at cursor (opt-in)          |

### Propagation Semantics

1. Coordinator writes INT glyph at injection point
2. On each GPU tick, INT spreads to 4-connected neighbors
3. When INT reaches a glyph with `@INT_HANDLER` annotation, propagation stops
4. Handler reads payload, executes, returns control

### Handler Declaration

```glyph
; Keyboard handler at specific coordinate
@COORD(4, 0)
@INT_HANDLER(KEYBOARD):
  LD R0, INT_PAYLOAD
  CMP R0, #0x20        ; Spacebar
  JEQ toggle_pause
  RET

; Mouse handler
@COORD(4, 1)
@INT_HANDLER(MOUSE):
  LD R0, INT_PAYLOAD
  CMP R0, #0x01        ; Left click
  JEQ handle_click
  RET
```

---

## 2. Application Header

Every glyph program declares spatial requirements in the first 16 bytes.

### Header Structure

| Offset | Size | Field           | Description          |
|--------|------|-----------------|----------------------|
| 0      | 4    | MAGIC           | "GEOS" signature     |
| 4-5    | 2    | WIDTH           | Grid columns         |
| 6-7    | 2    | HEIGHT          | Grid rows            |
| 8-9    | 2    | MEM_SIZE        | Local memory slots   |
| 10-11  | 2    | ENTRY_POINT     | Start coord (x,y)    |
| 12-13  | 2    | HANDLER_TABLE   | Offset to handlers   |
| 14-15  | 2    | FLAGS           | Capabilities         |

### Capability Flags

| Bit | Flag           | Description                     |
|-----|----------------|---------------------------------|
| 0   | WANTS_KEYBOARD | Receive keyboard events         |
| 1   | WANTS_MOUSE    | Receive mouse events            |
| 2   | WANTS_HOVER    | Receive continuous hover stream |
| 3   | CAN_RESIZE     | Handle resize notifications     |
| 4   | CAN_SPAWN      | Can spawn child processes       |

### Example Header

```glyph
@HEADER:
  .ascii "GEOS"        ; Magic
  .word 64             ; Width: 64 columns
  .word 32             ; Height: 32 rows
  .word 256            ; 256 memory slots
  .word 0              ; Entry at (0,0)
  .word handlers       ; Handler table offset
  .word 0x0003         ; KEYBOARD + MOUSE
```

### Coordinator Responsibilities

1. Parse header when app is loaded
2. Allocate contiguous region on Infinite Map
3. Copy app glyphs into allocated region
4. Register entry point and handler table
5. Return allocated origin in `R_REGION_ORIGIN`

---

## 3. Syscall Interface

The `SYNC` opcode (0xFE) signals the Coordinator with requests.

### Syntax

```
SYNC R0, R1, R2
; R0 = Syscall ID
; R1 = Arg 1
; R2 = Arg 2
; R3 = Return value (written by Coordinator)
```

### Syscall Table

| ID   | Name           | R1         | R2         | R3 (Return)   | Description              |
|------|----------------|------------|------------|---------------|--------------------------|
| 0x01 | RESIZE         | new_width  | new_height | success       | Request region resize    |
| 0x02 | CLOSE          | exit_code  | —          | —             | Terminate self           |
| 0x03 | SPAWN          | app_ptr    | flags      | child_id      | Spawn child app          |
| 0x04 | READ_CLIP      | buf_ptr    | max_len    | bytes_read    | Read clipboard           |
| 0x05 | WRITE_CLIP     | buf_ptr    | len        | success       | Write clipboard          |
| 0x06 | GET_TIME       | —          | —          | frame_count   | Current frame            |
| 0x07 | REQUEST_FOCUS  | —          | —          | success       | Grab keyboard focus      |
| 0x08 | YIELD_FOCUS    | —          | —          | success       | Release focus            |

### Error Codes

| Code | Meaning          |
|------|------------------|
| 0    | Success          |
| 1    | Invalid args     |
| 2    | Out of memory    |
| 3    | Permission denied|
| 4    | Not found        |

### Example: Resize on Keypress

```glyph
@INT_HANDLER(KEYBOARD):
  LD R0, INT_PAYLOAD
  CMP R0, #0x2B         ; '+' key
  JNE done

  MOV R0, #0x01         ; SYS_RESIZE
  MOV R1, #80           ; new width
  MOV R2, #40           ; new height
  SYNC R0, R1, R2

  CMP R3, #1
  JNE failed
  DRAW #COLOR_GREEN
done:
  RET

failed:
  DRAW #COLOR_ORANGE
  RET
```

---

## 4. Implementation Files

```
systems/spatial_coordinator/
├── coordinator.wgsl         # Main compute shader
├── interrupt_injector.wgsl  # INT injection & propagation
├── app_loader.wgsl          # Header parsing, region allocation
├── syscall_handler.wgsl     # SYNC processing
├── test_app.glyph           # Minimal test app
└── README.md
```

---

## 5. Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Apps load from headers | Load test_app.glyph, verify region allocated |
| Interrupts propagate | Inject keyboard event, verify handler fires |
| Syscalls work | App calls RESIZE, verify region grows |
| Multiple apps coexist | Load 3 apps, verify no spatial conflicts |
| 60 FPS maintained | Profile frame time with 10 apps |

---

## 6. Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    SPATIAL PROGRAM COORDINATOR                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐      │
│  │ App A        │    │ App B        │    │ App C        │      │
│  │ 64x32        │    │ 128x64       │    │ 32x32        │      │
│  │ ┌──────────┐ │    │ ┌──────────┐ │    │ ┌──────────┐ │      │
│  │ │ HEADER   │ │    │ │ HEADER   │ │    │ │ HEADER   │ │      │
│  │ │ CODE     │ │    │ │ CODE     │ │    │ │ CODE     │ │      │
│  │ │ HANDLERS │ │    │ │ HANDLERS │ │    │ │ HANDLERS │ │      │
│  │ │ MEMORY   │ │    │ │ MEMORY   │ │    │ │ MEMORY   │ │      │
│  │ └──────────┘ │    │ └──────────┘ │    │ └──────────┘ │      │
│  └──────────────┘    └──────────────┘    └──────────────┘      │
│                                                                 │
│  ═══════════════════════ INFINITE MAP ═════════════════════════ │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  COORDINATOR SERVICES                                          │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐              │
│  │ Interrupt   │ │ Region     │ │ Syscall     │              │
│  │ Injector    │ │ Allocator  │ │ Handler     │              │
│  └─────────────┘ └─────────────┘ └─────────────┘              │
└─────────────────────────────────────────────────────────────────┘
```

### Per-Frame Data Flow

```
1. HOST → COORDINATOR:  Push events to interrupt queue
2. COORDINATOR:         Inject INT glyphs at target coordinates
3. COORDINATOR:         Propagate INTs spatially to handlers
4. APPS:                Execute glyph microcode
5. APPS → COORDINATOR:  SYNC syscalls processed
6. COORDINATOR:         Execute syscalls (resize, spawn, etc.)
7. COORDINATOR:         Render all regions to visual output
8. Repeat
```

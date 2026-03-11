# Implementation Tasks

## Phase 1: Core Infrastructure (P0)

### Task 1.1: AlpineV3Builder (Shim Approach)
**File**: `systems/pixel_compiler/alpine_v3_builder.py`

Create ISO to PixelRTS v3 converter using **shim strategy** (not full transpilation):
- [x] Parse Alpine ISO structure
- [x] Extract kernel and initramfs as binary blobs
- [x] Create boot.pasm shim with NATIVE_EXEC call
- [x] Map blobs to Hilbert coordinates (768,0)+
- [x] Generate RGBA boot sector with shim loader
- [x] Output `alpine_v3.rts.png`

**Note**: Full opcode transpilation not required. Uses native_exec shim (Task 1.4) to execute standard Alpine kernel.

**Verification**: Unit test generates valid v3 format file with bootable shim

---

### Task 1.2: Terminal Opcodes
**File**: `systems/pixel_compiler/pixelrts_v3/opcodes.py`

Extend v3 opcode set with terminal operations:
- [x] Implement PRINT (0x40) - char output at cursor
- [x] Implement SCAN (0x41) - keyboard buffer read
- [x] Implement CURSOR (0x42) - position setting
- [x] Implement CLEAR (0x43) - screen clear
- [x] Implement SCROLL (0x44) - scroll up one line

**Verification**: Unit tests for each opcode execution

---

### Task 1.3: InputPixelMapper
**File**: `systems/visual_shell/api/input_pixel_mapper.py`

Map keyboard events to memory-mapped I/O pixels:
- [x] Key event → ASCII conversion
- [x] ASCII → Pixel coordinate mapping (0x0000 offset)
- [x] Ready flag setting (0x0001 offset)
- [x] Support for special keys (Enter, Backspace, arrows)

**Verification**: Unit tests verify correct pixel coordinates

---

### Task 1.4: Native Exec Shim (NEW)
**File**: `systems/pixel_compiler/pixelrts_v3/native_exec.py`

Implement shim approach for native kernel execution (per review feedback):
- [x] Implement NATIVE_EXEC opcode (0xF0)
- [x] Create PixelIOBridge for native→pixel I/O routing
- [x] Support QEMU execution backend
- [x] Handle protected memory regions
- [x] Bridge native kernel to memory-mapped terminal

**Verification**: Unit tests for shim execution with I/O bridge

---

## Phase 2: LiveTileService Integration (P0)

### Task 2.1: Extend LiveTileInstance
**File**: `systems/evolution_daemon/live_tile_service.py`

Add v3 format support to LiveTileInstance:
- [x] Add `v3_format: bool` field
- [x] Add `terminal_grid: List[List[str]]` (80x24)
- [x] Add `focus_state: str` (idle, focused, typing, background)
- [x] Add `input_pixel_map: Dict` for key→pixel mapping
- [x] Add `last_input_time: float` for FPS calculation

**Verification**: Unit tests for new fields and methods

---

### Task 2.2: Adaptive Screenshot Loop
**File**: `systems/evolution_daemon/live_tile_service.py`

Implement FPS-based framebuffer capture:
- [x] Calculate target FPS based on focus state
- [x] Capture terminal grid from memory-mapped region
- [x] Broadcast via WebSocket on change
- [x] Handle BACKGROUND state (pause capture)

**Verification**: Integration test verifies FPS adaptation

---

## Phase 3: WebSocket API (P1)

### Task 3.1: Alpine WebSocket Handlers
**File**: `systems/visual_shell/api/visual_bridge.py`

Add Alpine-specific message handlers:
- [x] `alpine_input` - Receive input from client/agent
- [x] `alpine_output` - Broadcast terminal grid updates
- [x] `alpine_focus` - Handle focus state changes
- [x] `alpine_stats` - Report CPU/memory/uptime

**Verification**: E2E test with WebSocket client

---

## Phase 4: Frontend (P1)

### Task 4.1: LiveTile.js Terminal Mode
**File**: `systems/visual_shell/web/js/LiveTile.js`

Add terminal rendering to LiveTile:
- [x] Detect v3 format tiles
- [x] Render 80x24 char grid with monospace font
- [x] Highlight cursor position with blink animation
- [x] Handle keyboard input when focused
- [x] WebSocket relay for input events

**Verification**: Manual test in browser

---

## Phase 5: Neural Memory (P2)

### Task 5.1: Alpine Event Capture
**File**: `systems/evolution_daemon/neural_event.py`

Log Alpine commands to NeuralMemoryHub:
- [x] Define ALPINE_COMMAND event type
- [x] Define ALPINE_OUTPUT event type
- [x] Define ALPINE_ERROR event type
- [x] Capture with Hilbert coordinates

**Verification**: Unit tests verify event structure

---

## Phase 6: WordPress Semantic Publishing (P2)

### Task 6.1: Alpine WordPress Bridge
**File**: `systems/evolution_daemon/alpine_wordpress_bridge.py`

Bridge Alpine events to WordPress Semantic District:
- [x] Implement `AlpineWordPressBridge` class
- [x] Add significant command pattern matching
- [x] Rate limiting (1 post / 30 seconds)
- [x] Semantic HTML formatting for posts
- [x] Visual Bridge pulse on publish

**Verification**: Unit tests for bridge and rate limiting

---

### Task 6.2: WordPress-LiveTile Integration
**File**: `systems/evolution_daemon/live_tile_service.py`

Connect LiveTileService to WordPress bridge:
- [x] Add `wp_bridge` to LiveTileService
- [x] Track pending commands for output correlation
- [x] Call `publish_session_log` on significant output
- [x] Handle `_on_alpine_output` callback

**Verification**: Integration test for end-to-end publishing

---

## Test Coverage

| Phase | Unit Tests | Integration Tests | E2E Tests |
|-------|------------|-------------------|-----------|
| 1 | 19 | 3 | 0 |
| 2 | 8 | 4 | 0 |
| 3 | 0 | 0 | 3 |
| 4 | 5 | 0 | 2 |
| 5 | 4 | 0 | 0 |
| 6 | 6 | 1 | 0 |
| **Total** | **42** | **8** | **5** |

---

## File Structure

```
systems/
├── pixel_compiler/
│   ├── alpine_v3_builder.py       # NEW
│   └── pixelrts_v3/
│       ├── opcodes.py             # EXTEND
│       └── native_exec.py         # NEW (Task 1.4)
│
├── evolution_daemon/
│   ├── live_tile_service.py       # EXTEND
│   ├── neural_event.py            # EXTEND
│   └── alpine_wordpress_bridge.py # NEW (Task 6.1)
│
├── visual_shell/
│   ├── api/
│   │   ├── visual_bridge.py       # EXTEND
│   │   └── input_pixel_mapper.py  # NEW
│   └── web/js/
│       └── LiveTile.js            # EXTEND
│
├── riscv_gpu/
│   └── alpine_v3_kernel/          # NEW
│       ├── boot.pasm
│       ├── terminal.pasm
│       └── shell.pasm
│
└── wordpress_zone/
    └── publish_to_wp.py           # EXISTING (used by bridge)
```

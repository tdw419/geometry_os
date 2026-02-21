# Implementation Tasks

## Phase 1: Core Infrastructure (P0)

### Task 1.1: AlpineV3Builder (Shim Approach)
**File**: `systems/pixel_compiler/alpine_v3_builder.py`

Create ISO to PixelRTS v3 converter using **shim strategy** (not full transpilation):
- [ ] Parse Alpine ISO structure
- [ ] Extract kernel and initramfs as binary blobs
- [ ] Create boot.pasm shim with NATIVE_EXEC call
- [ ] Map blobs to Hilbert coordinates (768,0)+
- [ ] Generate RGBA boot sector with shim loader
- [ ] Output `alpine_v3.rts.png`

**Note**: Full opcode transpilation not required. Uses native_exec shim (Task 1.4) to execute standard Alpine kernel.

**Verification**: Unit test generates valid v3 format file with bootable shim

---

### Task 1.2: Terminal Opcodes
**File**: `systems/pixel_compiler/pixelrts_v3/opcodes.py`

Extend v3 opcode set with terminal operations:
- [ ] Implement PRINT (0x40) - char output at cursor
- [ ] Implement SCAN (0x41) - keyboard buffer read
- [ ] Implement CURSOR (0x42) - position setting
- [ ] Implement CLEAR (0x43) - screen clear
- [ ] Implement SCROLL (0x44) - scroll up one line

**Verification**: Unit tests for each opcode execution

---

### Task 1.3: InputPixelMapper
**File**: `systems/visual_shell/api/input_pixel_mapper.py`

Map keyboard events to memory-mapped I/O pixels:
- [ ] Key event → ASCII conversion
- [ ] ASCII → Pixel coordinate mapping (0x0000 offset)
- [ ] Ready flag setting (0x0001 offset)
- [ ] Support for special keys (Enter, Backspace, arrows)

**Verification**: Unit tests verify correct pixel coordinates

---

### Task 1.4: Native Exec Shim (NEW)
**File**: `systems/pixel_compiler/pixelrts_v3/native_exec.py`

Implement shim approach for native kernel execution (per review feedback):
- [ ] Implement NATIVE_EXEC opcode (0xF0)
- [ ] Create PixelIOBridge for native→pixel I/O routing
- [ ] Support QEMU execution backend
- [ ] Handle protected memory regions
- [ ] Bridge native kernel to memory-mapped terminal

**Verification**: Unit tests for shim execution with I/O bridge

---

## Phase 2: LiveTileService Integration (P0)

### Task 2.1: Extend LiveTileInstance
**File**: `systems/evolution_daemon/live_tile_service.py`

Add v3 format support to LiveTileInstance:
- [ ] Add `v3_format: bool` field
- [ ] Add `terminal_grid: List[List[str]]` (80x24)
- [ ] Add `focus_state: str` (idle, focused, typing, background)
- [ ] Add `input_pixel_map: Dict` for key→pixel mapping
- [ ] Add `last_input_time: float` for FPS calculation

**Verification**: Unit tests for new fields and methods

---

### Task 2.2: Adaptive Screenshot Loop
**File**: `systems/evolution_daemon/live_tile_service.py`

Implement FPS-based framebuffer capture:
- [ ] Calculate target FPS based on focus state
- [ ] Capture terminal grid from memory-mapped region
- [ ] Broadcast via WebSocket on change
- [ ] Handle BACKGROUND state (pause capture)

**Verification**: Integration test verifies FPS adaptation

---

## Phase 3: WebSocket API (P1)

### Task 3.1: Alpine WebSocket Handlers
**File**: `systems/visual_shell/api/visual_bridge.py`

Add Alpine-specific message handlers:
- [ ] `alpine_input` - Receive input from client/agent
- [ ] `alpine_output` - Broadcast terminal grid updates
- [ ] `alpine_focus` - Handle focus state changes
- [ ] `alpine_stats` - Report CPU/memory/uptime

**Verification**: E2E test with WebSocket client

---

## Phase 4: Frontend (P1)

### Task 4.1: LiveTile.js Terminal Mode
**File**: `systems/visual_shell/web/js/LiveTile.js`

Add terminal rendering to LiveTile:
- [ ] Detect v3 format tiles
- [ ] Render 80x24 char grid with monospace font
- [ ] Highlight cursor position with blink animation
- [ ] Handle keyboard input when focused
- [ ] WebSocket relay for input events

**Verification**: Manual test in browser

---

## Phase 5: Neural Memory (P2)

### Task 5.1: Alpine Event Capture
**File**: `systems/evolution_daemon/neural_event.py`

Log Alpine commands to NeuralMemoryHub:
- [ ] Define ALPINE_COMMAND event type
- [ ] Define ALPINE_OUTPUT event type
- [ ] Define ALPINE_ERROR event type
- [ ] Capture with Hilbert coordinates

**Verification**: Unit tests verify event structure

---

## Phase 6: WordPress Semantic Publishing (P2)

### Task 6.1: Alpine WordPress Bridge
**File**: `systems/evolution_daemon/alpine_wordpress_bridge.py`

Bridge Alpine events to WordPress Semantic District:
- [ ] Implement `AlpineWordPressBridge` class
- [ ] Add significant command pattern matching
- [ ] Rate limiting (1 post / 30 seconds)
- [ ] Semantic HTML formatting for posts
- [ ] Visual Bridge pulse on publish

**Verification**: Unit tests for bridge and rate limiting

---

### Task 6.2: WordPress-LiveTile Integration
**File**: `systems/evolution_daemon/live_tile_service.py`

Connect LiveTileService to WordPress bridge:
- [ ] Add `wp_bridge` to LiveTileService
- [ ] Track pending commands for output correlation
- [ ] Call `publish_session_log` on significant output
- [ ] Handle `_on_alpine_output` callback

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

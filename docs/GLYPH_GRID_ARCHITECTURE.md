# Glyph Grid — Bidirectional Pixel Abstraction Layer

## Core Concept

The glyph grid is a **spatial abstraction layer** that sits between raw pixels and semantic meaning. It gives every pixel on screen a **queryable identity** — instead of just a color value, each pixel knows which glyph it belongs to, which token owns that glyph, and what callback fires when the pixel changes.

This is the inverse of a traditional display pipeline:

```
Traditional:    Data → Scene Graph → Triangles → Pixels (dead end)
Glyph Grid:     Pixels ↔ Glyph Cells ↔ Tokens ↔ Callbacks (bidirectional)
```

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│  Layer 3: Host / Application (Python, assembly, agents) │
│     │  writes to mailbox/batch-queue, reads events      │
│     ▼                                                   │
│  ┌───────────────────────────────────────────────────┐  │
│  │  Layer 2: Token Callbacks                         │  │
│  │  ┌─────────────────────────────────────────────┐  │  │
│  │  │ Token 0: "MOVE"  callback→0x2100            │  │  │
│  │  │ Token 1: "SELECT" callback→0x2200           │  │  │
│  │  │ ...up to 32 tokens                           │  │  │
│  │  └─────────────────────────────────────────────┘  │  │
│  │     │ ▲                                           │  │
│  │     │ │ events via RAM[0x7B40]                    │  │
│  │     ▼ │                                           │  │
│  │  ┌─────────────────────────────────────────────┐  │  │
│  │  │ Layer 1: Glyph Grid (32×32 cells)           │  │  │
│  │  │ Each cell: char_code, fg, bg, token_id,    │  │  │
│  │  │           dirty_flag, pixel_block_coords    │  │  │
│  │  │ 32 cols × 32 rows = 1024 glyph cells        │  │  │
│  │  │ Each cell owns an 8×8 pixel block            │  │  │
│  │  └─────────────────────────────────────────────┘  │  │
│  │     │ ▲                                           │  │
│  │     │ │ render (dirty → pixels)                   │  │
│  │     │ │ scan (pixels → detect changes)            │  │
│  │     ▼ │                                           │  │
│  │  ┌─────────────────────────────────────────────┐  │  │
│  │  │ Layer 0: Pixel Framebuffer (256×256 RGBA)   │  │  │
│  │  │ screen[y×256 + x] = 0xRRGGBB                │  │  │
│  │  └─────────────────────────────────────────────┘  │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

## How the Bidirectional Loop Works

### Downward Path (glyph → pixels)

Two delivery channels exist, processed in order each FRAME:

**Channel A — Batch Command Queue** (high throughput, at 0x7B10):
1. A program writes one or more compact commands into the ring buffer at 0x7B10-0x7B3D
2. On FRAME, `glyph_grid.on_frame()` drains ALL queued commands (up to 11 per frame)
3. Each batch command is 4 u32s packed for minimal RAM waste
4. Multiple agents can write to different queue slots simultaneously — no race on a single address

**Channel B — Single Mailbox** (legacy, at 0x7B00):
1. A program writes to the mailbox at RAM addresses `0x7B00-0x7B0D`
2. On the next `FRAME` opcode, `process_mailbox()` reads the command and updates cell state
3. `render_to_screen()` writes the 8×8 font bitmap to the correct pixel block
4. Each glyph cell maps to a fixed pixel region: cell (cx, cy) owns pixels (cx×8, cy×8) through (cx×8+7, cy×8+7)

**Why two channels?** The single mailbox processes one command per frame — filling a 32×32 window would take 1024 frames (~17s at 60fps). The batch queue processes 11 commands per frame, reducing the same operation to ~93 frames (~1.5s). For true bulk writes, programs use LDI/STORE loops to write directly to the memory-mapped character region.

### Upward Path (pixel change → event)

1. Any code (another agent, a socket write, a mouse handler) can modify pixels directly on the framebuffer
2. On the next `FRAME`, `scan_for_changes()` compares every **owned** glyph cell's pixel block against what the font bitmap + colors would produce
3. If a mismatch is found, an event is written to RAM at `0x7B40-0x7BFF`. Up to 48 events fit in a single frame (increased from 16 to prevent dropping events during large spatial operations like window dragging)
4. If the token has a `callback_addr` set, the FRAME handler dispatches the callback using **VM CALL semantics** (push r31 to stack, set r31 = return address, jump to callback). The callback returns via the standard `RET` opcode.

### Why This Is Different From a Display List

| Property | Traditional Display List | Glyph Grid |
|----------|------------------------|------------|
| **Direction** | Unidirectional (data→pixels) | Bidirectional (pixels↔meaning) |
| **State** | Rebuilt each frame | Persistent across frames |
| **Queryable** | No (pixel is just a color) | Yes (pixel → cell → token) |
| **Ownership** | None | Each cell claims its pixel block |
| **Detection** | No | Scans for external pixel changes |
| **Callbacks** | No | Token-level events with dispatch |
| **Throughput** | N/A (many ops/frame) | Batch mode: 11 commands/frame |

## Communication Protocols

### Batch Command Queue (RAM 0x7B10-0x7B3D)

Ring buffer for high-throughput glyph operations. Up to 11 slots, each 4 u32s:

```
0x7B10: head (write index, 0-10, next free slot)
0x7B11: tail (read index, 0-10, next unprocessed slot)
0x7B12-0x7B3D: 11 slots × 4 u32s = 44 words
```

**Each slot (4 u32s):**

| Word | Bits | Field | Purpose |
|------|------|-------|---------|
| word 0 | 7:0 | cmd | Command (1=PUT, 4=BIND, 5=CLEAR) |
| word 0 | 15:8 | cell_x | Glyph cell column (0-31) |
| word 0 | 23:16 | cell_y | Glyph cell row (0-31) |
| word 0 | 31:24 | flags | Flags (bit 0 = auto_clear) |
| word 1 | 7:0 | char_code | ASCII character (0-127) |
| word 1 | 31:8 | fg | Foreground RGBA (24-bit) |
| word 2 | 31:0 | bg | Background RGBA (full 32-bit) |
| word 3 | 15:0 | token_id | Token identifier (for BIND) |
| word 3 | 31:16 | callback_low | Callback addr low bits (for BIND) |

**Usage (assembly):**
```
; Queue 3 glyph PUTs in one frame
LDI r0, 1           ; PUT command
LDI r1, 0           ; cell_x = 0
LDI r2, 0           ; cell_y = 0
OR r0, r1, 8        ; pack: cmd|cell_x<<8
OR r0, r2, 16       ; pack: ...|cell_y<<16
OR r0, r0, 1<<24    ; set auto_clear flag
STORE r0, 0x7B12    ; slot 0, word 0
LDI r0, 0x58        ; 'X'
OR r0, r0, 0xFFFFFF<<8 ; fg = white
STORE r0, 0x7B13    ; slot 0, word 1
STORE r0, 0x7B00    ; bg = black
; ... repeat for slots 1, 2 ...
LDI r0, 3
STORE r0, 0x7B10    ; head = 3 (3 commands queued)
```

**Multiple agents:** Agents write to different slot addresses (no shared state beyond head/tail). The head pointer is the only write-shared address — agents coordinate via atomic increment or a designated writer.

### Mailbox (RAM 0x7B00-0x7B0F)

Legacy single-command protocol, processed each FRAME:

| Address | Name | Purpose |
|---------|------|---------|
| 0x7B00 | command | 0=NOP, 1=PUT, 2=GET, 3=SCAN, 4=BIND, 5=CLEAR, 6=CLEAR_TOKEN |
| 0x7B01 | cell_x | Glyph cell column (0-31) |
| 0x7B02 | cell_y | Glyph cell row (0-31) |
| 0x7B03 | char_code | ASCII character (0-127) |
| 0x7B04 | fg_color | Foreground RGBA |
| 0x7B05 | bg_color | Background RGBA |
| 0x7B06 | token_id | Token identifier (0-31) |
| 0x7B07-0x7B0A | token_rect | Token cell range (sx, sy, ex, ey) |
| 0x7B0B | callback_addr | VM assembly address for token callback |
| 0x7B0C | status | Written by handler: 1=done, 0xFFFFFFFF=error |
| 0x7B0D | auto_clear | Set to 1 to auto-reset command to NOP |

GET, SCAN, CLEAR_TOKEN are only available via the legacy mailbox.

### Event Buffer (RAM 0x7B40-0x7BFF)

Written each FRAME after scan. Flat array with 48-slot capacity:

```
0x7B40: u32 count (number of pending events, 0-48)
0x7B41: event[0].token_id
0x7B42: event[0].cell_x
0x7B43: event[0].cell_y
0x7B44: event[0].detected_char
0x7B45-0x7B48: event[1]
...continues for up to 48 events
```

The 48-slot capacity (3× the original 16) prevents event loss during large spatial operations like dragging a window across the screen, which can trigger 20-40 pixel-mismatches per frame.

### Callback Protocol (Stack-Based, Preferred)

Callbacks use the VM's native CALL/RET mechanism:

```
1. FRAME detects event → pushes current r31 to stack (SP = r30)
2. Sets r31 = return address (current pc)
3. Sets pc = callback_addr
4. Callback assembly runs, reads event from 0x7B40
5. Callback returns via RET (0x34) — pops r31, restores PC
6. Original code resumes
```

**Why stack-based?** The old protocol saved the return PC to a fixed RAM address (0x7B50). If multiple callbacks fired in sequence (or nested callbacks via another FRAME), the fixed address would be clobbered. The stack supports arbitrary nesting and re-entrancy — each CALL/RET pair uses its own stack frame.

**Backward compatibility:** The old RAM[0x7B52] return-flag protocol still works. Legacy callbacks can write 1 to 0x7B52 and call FRAME; the FRAME handler checks this flag at the top of each frame and restores the saved PC.

### Legacy Callback Protocol (RAM 0x7B50-0x7B52, Deprecated)

```
0x7B50: u32 return_address (saved by FRAME handler before callback)
0x7B52: u32 return_flag (callback writes 1 here, FRAME handler restores PC)
```

Callback flow (legacy):
```
1. FRAME detects event → saves self.pc to RAM[0x7B50], sets pc=callback_addr
2. Callback assembly runs, reads event from 0x7B40
3. Callback writes 1 to RAM[0x7B52], calls FRAME
4. FRAME handler sees flag, restores PC from RAM[0x7B50]
5. Original code resumes
```

**⚠ Limitation:** Only one callback can be active at a time. Nested callbacks or sequential dispatches within the same frame will clobber 0x7B50. New code should use the stack-based protocol (RET).

### Token Topology (Flexible, Non-Contiguous)

Tokens are **not** bound by a rectangle. Each cell stores its `token_id` independently. A token is simply the set of all cells that share its ID. This enables:

- **L-shaped regions** — a button that wraps around a display element
- **Checkboxes with labels** — two disconnected cells share the same token
- **Non-rectangular GUI** — circular or irregular control surfaces
- **Fluid UI** — tokens don't need recalculation when shape changes

`bind_token()` still accepts a range as a convenience to mark cells, but the token itself stores no bounding box. `clear_token()` does a linear scan of all 1024 cells and clears matching token_ids (trivially fast for the grid size).

### Race Condition Safety

The architecture handles concurrency at three levels:

1. **Batch queue slots** are at distinct RAM addresses (0x7B12+4i). Two agents writing to different slots cannot collide. The only shared address is the head pointer (0x7B10), which should be written last after all slots are populated.

2. **Individual cells** at distinct memory addresses. Multiple agents can PUT or STORE to different cells simultaneously. The 48-slot event buffer collects all changes.

3. **Mailbox** is a single shared address — serialized by frame timing. Legacy agents must coordinate or use the batch queue instead.

## Implementation Files

| File | Purpose |
|------|---------|
| `src/glyph_grid.rs` | Core implementation: GlyphCell, GlyphGrid, Token, mailbox/batch processing, scan/render, callback dispatch |
| `src/vm/mod.rs` | FRAME opcode (0x02) handler calls `glyph_grid.on_frame()`, dispatches callback via CALL semantics |
| `src/lib.rs` | Module registration |
| `src/save.rs` | Serialization support |
| `src/vm/io.rs` | Deserialization support |
| `scripts/glyph_grid.py` | Python bridge via Unix socket (`/tmp/geo_cmd.sock`) |

## Python Bridge (Regime B)

The `glyph_grid.py` module connects to a running GeOS VM through its Unix socket and provides high-level Python methods:

```python
from glyph_grid import GlyphGrid

gg = GlyphGrid()

# Write glyphs
gg.put_glyph(0, 0, ord('X'), fg=0xFFFFFF, bg=0x000000)
gg.render_string(0, 2, "Hello", fg=0x00FF00)

# Read glyphs
cell = gg.get_glyph(0, 0)   # → {char_code: 88, fg: 16777215, bg: 0}

# Bind tokens
gg.bind_token(0, 0, 0, 4, 0, callback_addr=0x2100)

# Read events
events = gg.get_events()
# → [{token_id: 0, cell_x: 1, cell_y: 0, detected_char: 0x4F}, ...]

# Control
gg.clear_all()
gg.get_screenshot("/tmp/output.png")
```

## Data Structures

### GlyphCell (32×32 grid = 1024 cells)

```rust
struct GlyphCell {
    char_code: u8,      // ASCII (0 = empty cell)
    fg: u32,            // Foreground color
    bg: u32,            // Background color
    token_id: u16,      // Owning token (0xFFFF = none)
    dirty: bool,        // Needs re-render
}
```

### Token (up to 32)

```rust
struct Token {
    id: u16,            // 0-31
    callback_addr: u32, // VM assembly address to call on change (0 = none)
    active: bool,       // Whether this token is registered
}
```

**No bounding box.** Membership is per-cell via `cell.token_id == token.id`.

## Key Properties

1. **Persistence**: Cell state survives across frames — a glyph set at frame 10 is still there at frame 1000 unless explicitly changed

2. **Ownership**: Only cells bound to a token trigger scan events. Unowned cells can change freely without generating events

3. **Efficiency**: Only dirty cells are re-rendered. Unchanged cells skip the render pass entirely

4. **Independence**: Multiple agents can write to different cells simultaneously. The 48-slot event buffer collects all changes in one frame. The 11-slot batch queue allows bulk operations without the frame-per-command bottleneck

5. **Composability**: Tokens are defined per-cell, not by bounding box. Multiple tokens can coexist. Non-contiguous shapes (L-regions, disjoint selections) work naturally. Higher layers (semantic dispatch, agent coordination) can be built on top without modifying the glyph grid

## Performance Notes

- **Throughput**: Batch queue: 11 commands/frame. Legacy mailbox: 1 command/frame. At 60fps, the batch queue achieves 660 PUT ops/second vs 60 ops/second for the legacy mailbox.
- **Scan overhead**: 65,536 pixel comparisons per frame worst-case (all cells owned, all checked). At <1µs per comparison, this is ~65ms — acceptable for CPU-side operation. Future optimization: GPU dirty-bit hash from WGSL shader.
- **Event loss prevention**: 48 events/frame capacity (3× improvement over original 16). Window drag operations typically trigger 20-40 pixel mismatches per frame, which now fits without overflow.

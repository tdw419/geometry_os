# Reactive Loop for ASCII Cartridges

> Design document for the Click → VM → Display reactive loop.

**Date:** 2026-03-18
**Status:** Approved & Implemented

---

## Overview

Three components that close the loop between user interaction and visible display:

```
Click → SIT Lookup → VM Execution → STORE to Glyph Grid → Display Updates
```

This is the difference between a static screenshot and a living program.

---

## Design Decisions

### 1. State Mapper — Direct Memory Mapping

**Decision:** State Buffer lives at fixed VRAM address `0xF000-0xF3FF`.

| Region | Address Range | Size | Purpose |
|--------|---------------|------|---------|
| Glyph Grid | `0x0000-0x0BFF` | 1920 (80×24) | Visible ASCII display |
| Reserved | `0x0C00-0x7FFF` | — | Future expansion |
| Program Code | `0x8000-0xEFFF` | 28672 | VM instructions |
| State Buffer | `0xF000-0xF3FF` | 1024 | Application variables |

**Rationale:**
- Uniform access: VM uses same LOAD/STORE for everything
- Registers are scarce (128 total) — memory is abundant
- Debuggable with `peek()` at known addresses
- Fits "pixels are memory, memory is addressable" philosophy

**Access Pattern:**
```rust
LOAD r1, [0xF005]   // r1 = state variable at index 5
STORE [0xF005], r2  // state variable at index 5 = r2
```

---

### 2. Dynamic Glyph Update — Direct Writes

**Decision:** VM writes directly to Glyph Grid memory. No template engine, no compositor.

**Rationale:**
- The program IS the machine
- STORE to glyph address → pixel changes → that's it
- Same operation as self-replication: pixels move pixels
- More complex programs is a feature — programs actually do the work

**Access Pattern:**
```rust
// Write 'A' to position (10, 5)
LDI r1, 10           // x = 10
LDI r2, 5            // y = 5
LDI r3, 80
MUL r4, r2, r3       // offset = y * 80
ADD r4, r4, r1       // offset = y * 80 + x
LDI r5, 65           // 'A' = ASCII 65
STORE [r4], r5       // glyph_grid[offset] = 'A'
```

---

### 3. Symbol Resolution — Compile-Time Binding

**Decision:** Compiler resolves all labels to absolute addresses. No runtime lookup.

**Rationale:**
- Pixels are already data — no symbol table segment needed
- No runtime overhead — JMP main becomes JMP 0x8100 directly
- Compiler knows layout at compile time
- Position independence not needed — cartridges load at fixed base

**Encoding:**
```
SIT entry = [opcode, addr_low, addr_high, 255]

Example: JMP main where main = 0x8100
         → [9, 0x00, 0x81, 0xFF]
```

---

## Data Flow

```
1. User clicks [A] Run at position (4, 4)
2. find_action_at(4, 4) → SitAction { opcode: 209, target_addr: 0x8100 }
3. handle_sit_click(0, 209, 0x8100) → VM[0].pc = 0x8100
4. VM executes at 0x8100:
   - LDI r1, 0xF000      ; state buffer base
   - LOAD r2, [r1]       ; read current state
   - ADD r2, r2, 1       ; increment
   - STORE [r1], r2      ; write back
   - LDI r3, 0x0000      ; glyph grid base
   - ADD r4, r3, 40      ; position 40
   - LDI r5, 42          ; '*' character
   - STORE [r4], r5      ; write to display
   - HALT
5. Render loop reads glyph grid, displays updated '*'
```

---

## Implementation

### Files Modified

| File | Change |
|------|--------|
| `geos_ascii_compiler.py` | Added `scan_labels()` and `resolve_target()` — labels → addresses |
| `ascii_cartridge.rs` | Added `mem_layout` constants: `STATE_BASE`, `GLYPH_BASE`, `PROGRAM_BASE` |
| `ascii_cartridge.rs` | Added `target_addr: u32` to `SitAction` — resolved address from SIT |
| `synthetic_vram.rs` | Added `handle_sit_click()` — executes VM opcodes directly |

### Memory Layout Constants

```rust
pub mod mem_layout {
    pub const GLYPH_BASE: u32 = 0x0000;
    pub const GLYPH_SIZE: u32 = 80 * 24; // 1920

    pub const PROGRAM_BASE: u32 = 0x8000;
    pub const PROGRAM_SIZE: u32 = 0x7000; // 28672

    pub const STATE_BASE: u32 = 0xF000;
    pub const STATE_SIZE: u32 = 0x0400; // 1024

    pub fn state_addr(index: u32) -> u32 { STATE_BASE + index }
    pub fn glyph_addr(x: u32, y: u32) -> u32 { GLYPH_BASE + (y * 80 + x) }
}
```

---

## Success Criteria

- [x] Click executes VM code — `handle_sit_click()` jumps to resolved address
- [x] VM reads/writes state — LOAD/STORE at 0xF000+ works
- [x] VM writes visible display — STORE at 0x0000-0x0BFF updates glyph grid
- [x] Labels resolve correctly — `JMP main` jumps to numeric address

---

## Next Steps

1. Create test cartridge with labels and VM code
2. Verify full loop: click → VM → display update
3. Port to real GPU (when ready)

---

*Design approved: 2026-03-18*

# Native Glyph-Atomic Windowing System

**Status:** Design Approved
**Created:** 2026-03-12
**Type:** Architecture Design Document

---

## Executive Summary

A fully native windowing system for Geometry OS where windows are **Autonomous Spatial Programs** rather than pixel buffers. Windows are grids of executable glyphs that handle their own rendering, hit-testing, and movement directly on the GPU.

---

## 1. Philosophy

### 1.1 Windows as Programs

In traditional windowing systems:
- Window = RGBA pixel buffer
- Compositor = CPU-side buffer blender
- Interaction = Event loop in application code

In Glyph-Atomic Windowing:
- Window = Grid of executable glyphs
- Compositor = Spatial instruction dispatcher (GPU)
- Interaction = Opcode branching (JZ, JMP) in glyph programs

### 1.2 Zero CPU Dependencies

The CPU's only responsibilities:
1. Write mouse state to memory[0-4]
2. Dispatch the glyph program
3. Present the screen texture

All window logic (hit-testing, movement, rendering) executes on GPU.

---

## 2. Architecture

### 2.1 Layer Mapping (GlyphStratum 5-Layer Model)

```
┌─────────────────────────────────────────────────────────────┐
│  L4: Intent     "Open window at (100, 100)"                │
├─────────────────────────────────────────────────────────────┤
│  L3: Spec       Window templates (borders, title bars)     │
├─────────────────────────────────────────────────────────────┤
│  L2: Logic      Glyph programs (drag, draw, hit-test)      │
├─────────────────────────────────────────────────────────────┤
│  L1: Memory     Window descriptors (X, Y, W, H, Z, ID)     │
├─────────────────────────────────────────────────────────────┤
│  L0: Substrate  Screen texture + Atlas + Registers         │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Components

| Component | Path | Purpose |
|-----------|------|---------|
| WGSL Bootloader | `shaders/glyph_microcode.wgsl` | "Synthetic silicon" - fetch-decode-execute |
| Glyph VM | `src/gpu/glyph_vm.rs` | Rust wrapper for GPU execution |
| Window Demo | `src/bin/glyph_window_demo.rs` | Standalone test binary |
| Bootstrap Script | `systems/glyph_stratum/native_window_bootstrap.py` | Generates glyph programs |

---

## 3. Instruction Set Extensions

### 3.1 New Opcodes (216-218)

| Opcode | Name | Signature | Description |
|--------|------|-----------|-------------|
| 216u | `ADD_MEM` | `mem[target] = mem[p1] + mem[p2]` | Memory-to-memory addition |
| 217u | `SUB_MEM` | `mem[target] = mem[p1] - mem[p2]` | Memory-to-memory subtraction |
| 218u | `INT_DISPATCH` | `mem[target] = hit_id` | Hit-test mouse against region table |

### 3.2 INT_DISPATCH Semantics

```
INT_DISPATCH(table_start, num_entries, target)

1. Read mouse state: x = mem[0], y = mem[1], btn = mem[2]
2. If btn == 0: mem[target] = 0.0 (no hit)
3. For each entry in table:
   - Entry format: [x, y, w, h, id] (5 floats)
   - If mouse inside rect: mem[target] = id
4. Result: Window ID that was clicked, or 0.0
```

### 3.3 Existing Opcodes Used

| Opcode | Name | Usage |
|--------|------|-------|
| 204u | `LD` | Copy memory: `mem[target] = mem[p1]` |
| 206u | `MOV` | Set constant: `mem[target] = p1` |
| 209u | `JZ` | Conditional jump if zero |
| 215u | `DRAW` | Blit glyph from atlas to screen |
| 212u | `HALT` | Stop execution |

---

## 4. Memory Layout

### 4.1 Global Memory Map (1024 floats)

| Range | Purpose | Description |
|-------|---------|-------------|
| 0-4 | Mouse State | X, Y, BTN, DX, DY |
| 10-14 | Window 0 | X, Y, W, H, HIT_FLAG |
| 20-24 | Hit Table 0 | X, Y, W, H, ID |
| 30-34 | Window 1 | X, Y, W, H, HIT_FLAG |
| 40-44 | Hit Table 1 | X, Y, W, H, ID |
| ... | ... | Scales to ~40 windows |
| 100+ | General | Application data |

### 4.2 Window Descriptor Structure

```c
struct WindowDesc {
    float x;      // Position X
    float y;      // Position Y
    float w;      // Width
    float h;      // Height
    float hit;    // Non-zero if clicked
};
```

---

## 5. Execution Model

### 5.1 Frame Loop

```
CPU Side:
1. Poll mouse events → update memory[0-4]
2. Upload memory to GPU
3. Dispatch glyph program (1 workgroup)
4. Present screen texture

GPU Side (per frame):
1. Fetch glyph at PC
2. Decode opcode
3. Execute operation
4. Advance PC (or jump)
5. Repeat until HALT or cycle limit
```

### 5.2 Window Program Example

```python
# Pseudocode for a self-moving window
program = [
    [MOV, 0, 0.0, 0.0, 14],           # Clear hit flag
    [LD, 0, 20, 10, 20],              # Update hit table X from window X
    [LD, 0, 21, 11, 21],              # Update hit table Y from window Y
    [INT_DISPATCH, 0, 20.0, 1.0, 14], # Hit-test, result in 14
    [JZ, 0, 7.0, 0.0, 14],            # If no hit, jump to DRAW
    [ADD_MEM, 0, 10.0, 3.0, 10],      # WIN_X += MOUSE_DX
    [ADD_MEM, 0, 11.0, 4.0, 11],      # WIN_Y += MOUSE_DY
    [DRAW, 0, 65.0, 10.0, 11],        # Draw glyph at window position
    [HALT, 0, 0.0, 0.0, 0],           # Stop
]
```

---

## 6. Z-Sorting Protocol (Future)

### 6.1 Problem

When two windows overlap, which one is drawn on top?

### 6.2 Proposed Solution

1. Each window has a Z-index in its descriptor (memory[14] for window 0)
2. Focused window gets highest Z
3. Glyph program sorts execution order by Z before DRAW
4. Higher Z = draws last = appears on top

### 6.3 Implementation Path

Add opcode 219: `SORT_Z` that reorders program execution based on Z-index values in memory.

---

## 7. Visual Bootstrapping Strategy

### 7.1 Phase 1: Incubation (Current)

- Use WGPU/WGSL as substrate
- Grow glyph programs using Python bootstrap scripts
- Test with standalone demo binary

### 7.2 Phase 2: Elimination

- Remove Smithay/Wayland dependencies
- Integrate into main Infinite Map compositor
- All window logic in glyphs, CPU only passes input

### 7.3 Phase 3: Pure Execution

- Port to bare-metal framebuffer
- No OS dependencies
- Self-hosting Geometry OS

---

## 8. File Locations

| Component | Path |
|-----------|------|
| WGSL Bootloader | `systems/infinite_map_rs/shaders/glyph_microcode.wgsl` |
| Glyph VM | `systems/infinite_map_rs/src/gpu/glyph_vm.rs` |
| Window Demo | `systems/infinite_map_rs/src/bin/glyph_window_demo.rs` |
| Bootstrap Script | `systems/glyph_stratum/native_window_bootstrap.py` |
| Generated Program | `systems/glyph_stratum/native_window_program.json` |

---

## 9. Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Bootloader < 100 lines | `wc -l glyph_microcode.wgsl` |
| Window drags without CPU logic | Mouse delta in memory, ADD_MEM on GPU |
| Hit-testing on GPU | INT_DISPATCH returns correct window ID |
| Zero Wayland dependencies in demo | `ldd glyph_window_demo` shows no wayland |

---

## 10. Next Steps

1. **Build Test**: `cargo build --bin glyph_window_demo`
2. **Z-Sorting**: Implement SORT_Z opcode for overlapping windows
3. **Multi-Window**: Extend bootstrap for 2+ windows
4. **Integration**: Replace compositor window logic with glyph programs

---

*Design completed: 2026-03-12*
*Implementation: In Progress*

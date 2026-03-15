# SPATIAL_SPAWN Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement opcode 232 (SPATIAL_SPAWN) enabling glyph programs to write new glyphs into the program buffer.

**Architecture:** Single opcode with mode flag handles both single-glyph and block spawns. Glyph data read from VM memory, written to program buffer. Silent bounds checking prevents crashes.

**Tech Stack:** WGSL compute shader, existing Glyph/VMState structs

---

## Task 1: Add Opcode Constant

**Files:**
- Modify: `systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl:51`

**Step 1: Add opcode constant**

After line 51 (after `const OP_SHR_MEM: u32 = 231u;`), add:

```wgsl
// AI-Native Opcodes
const OP_SPAWN: u32 = 232u;
```

**Step 2: Commit**

```bash
git add systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl
git commit -m "feat(glyph): add OP_SPAWN constant (opcode 232)"
```

---

## Task 2: Implement Single Glyph Spawn

**Files:**
- Modify: `systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl`

**Step 1: Add single spawn case**

After the `case 231u` block (around line 216), add:

```wgsl
        case 232u: { // SPATIAL_SPAWN
            let mode = u32(inst.p1);
            let src_addr = u32(inst.p2);
            let target = inst.dst;

            // Bounds check - silent no-op on failure
            if (target >= arrayLength(&program)) {
                state.pc = state.pc + 1u;
                return;
            }

            if (mode == 0u) {
                // Single glyph spawn
                program[target].opcode = u32(memory[src_addr]);
                program[target].stratum = u32(memory[src_addr + 1u]);
                program[target].p1 = memory[src_addr + 2u];
                program[target].p2 = memory[src_addr + 3u];
                program[target].dst = u32(memory[src_addr + 4u]);
            }
            state.pc = state.pc + 1u;
        }
```

**Step 2: Commit**

```bash
git add systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl
git commit -m "feat(glyph): implement OP_SPAWN single glyph mode"
```

---

## Task 3: Implement Block Spawn

**Files:**
- Modify: `systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl`

**Step 1: Extend spawn case for block mode**

Replace the entire `case 232u` block with:

```wgsl
        case 232u: { // SPATIAL_SPAWN
            let mode = u32(inst.p1);
            let src_addr = u32(inst.p2);
            let target = inst.dst;

            // Bounds check - silent no-op on failure
            if (target >= arrayLength(&program)) {
                state.pc = state.pc + 1u;
                return;
            }

            if (mode == 0u) {
                // Single glyph spawn
                program[target].opcode = u32(memory[src_addr]);
                program[target].stratum = u32(memory[src_addr + 1u]);
                program[target].p1 = memory[src_addr + 2u];
                program[target].p2 = memory[src_addr + 3u];
                program[target].dst = u32(memory[src_addr + 4u]);
            } else {
                // Block spawn - check bounds
                if (target + mode > arrayLength(&program)) {
                    state.pc = state.pc + 1u;
                    return;
                }
                for (var i: u32 = 0u; i < mode; i++) {
                    let src_offset = src_addr + i * 5u;
                    let dst_offset = target + i;
                    program[dst_offset].opcode = u32(memory[src_offset]);
                    program[dst_offset].stratum = u32(memory[src_offset + 1u]);
                    program[dst_offset].p1 = memory[src_offset + 2u];
                    program[dst_offset].p2 = memory[src_offset + 3u];
                    program[dst_offset].dst = u32(memory[src_offset + 4u]);
                }
            }
            state.pc = state.pc + 1u;
        }
```

**Step 2: Commit**

```bash
git add systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl
git commit -m "feat(glyph): implement OP_SPAWN block mode"
```

---

## Task 4: Update Transpiler

**Files:**
- Modify: `systems/glyph_stratum/programs/compile_glyph.py`

**Step 1: Add SPAWN to opcode map**

Find the opcode mapping dictionary and add:

```python
    'SPAWN': 232,
```

**Step 2: Add SPAWN instruction parser**

Add parsing support for spawn syntax:

```python
# SPAWN target, source, count
# Compiles to: opcode=232, dst=target, p2=source, p1=count
elif mnemonic == 'SPAWN':
    dst = parse_operand(operands[0])
    src = parse_operand(operands[1])
    count = parse_operand(operands[2]) if len(operands) > 2 else 0
    return Glyph(opcode=232, stratum=0, p1=float(count), p2=float(src), dst=dst)
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/compile_glyph.py
git commit -m "feat(transpiler): add SPAWN instruction support"
```

---

## Task 5: Create Test Glyph Program

**Files:**
- Create: `systems/glyph_stratum/programs/test_spawn.glyph`

**Step 1: Write test program**

```glyph
# Test SPATIAL_SPAWN
# Setup: Write a HALT instruction (opcode 141) into memory at address 100-104

# memory[100] = 141 (HALT opcode)
LD 100, 141

# memory[101] = 0 (stratum)
LD 101, 0

# memory[102] = 0 (p1)
LD 102, 0

# memory[103] = 0 (p2)
LD 103, 0

# memory[104] = 0 (dst)
LD 104, 0

# Spawn single glyph at program[200] from memory[100]
SPAWN 200, 100, 0

# Verify by jumping to 200 (should halt)
JMP 200

# Should never reach here
NOP
NOP
HALT
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/test_spawn.glyph
git commit -m "test(glyph): add SPAWN opcode test program"
```

---

## Task 6: Manual Integration Test

**Files:**
- None (runtime test)

**Step 1: Build the project**

```bash
cd systems/infinite_map_rs && cargo build
```

**Step 2: Run GPU daemon**

```bash
cargo run --bin gpu_dev_daemon
```

**Step 3: Load test program via MCP**

Use the GPU Daemon API to load `test_spawn.glyph` and verify execution.

**Step 4: Verify spawn succeeded**

Check that program[200] contains HALT instruction after execution.

---

## Summary

| Task | Description | Commits |
|------|-------------|---------|
| 1 | Add opcode constant | 1 |
| 2 | Single spawn impl | 1 |
| 3 | Block spawn impl | 1 |
| 4 | Transpiler update | 1 |
| 5 | Test program | 1 |
| 6 | Integration test | 0 |

**Total: 5 commits**

# Pixels Move Pixels

**The first proven self-replicating glyph program in Geometry OS.**

On March 16, 2026, an 18-pixel program on the GPU copied itself from one location to another on a Hilbert curve — without any CPU involvement during execution. No Python orchestrated it. No Rust logic ran during the copy. The GPU's compute shader read its own instructions from a texture, executed them, and wrote a perfect duplicate of itself to a new address.

This document explains exactly how it works.

---

## The Problem It Solves

Geometry OS had 9,160 Python files and 74 WGSL shaders. The vision was "pixels move pixels" — the GPU as sovereign computing substrate. But every time someone wanted to do something new, they wrote Python to orchestrate it. The GPU VM had a complete instruction set that nobody had ever used to run a real program.

The self-replicating glyph is the proof that the VM works. Pixels actually moved pixels.

---

## Architecture

```
┌───────────────────────────────────────────────────────────┐
│                  FROZEN BOOTSTRAP (Rust)                   │
│                                                            │
│  1. Create 4096×4096 RGBA8 texture (the "RAM")            │
│  2. Write 18 pixels into it (the program)                  │
│  3. Spawn VM 0 at address 0                                │
│  4. Call execute_frame() — dispatch compute shader          │
│                                                            │
│  This is the LAST TIME the CPU touches the program.        │
└────────────────────────┬──────────────────────────────────┘
                         │ dispatch once
                         ▼
┌───────────────────────────────────────────────────────────┐
│                  GPU COMPUTE SHADER                        │
│                  (glyph_vm_scheduler.wgsl)                 │
│                                                            │
│  The shader reads instructions from the RAM texture,       │
│  executes them, and writes results back to the same        │
│  texture. The program IS the texture. The texture IS       │
│  the memory. What you see on screen is what executes.      │
│                                                            │
│  VM 0 runs 1024 cycles per frame.                          │
│  The self-replication loop takes ~150 cycles.               │
│  It finishes in a single frame.                             │
└───────────────────────────────────────────────────────────┘
```

---

## The RAM Texture

All of Geometry OS memory lives in a single GPU texture:

- **Format:** 4096 × 4096 pixels, RGBA8 unsigned integer
- **Total capacity:** 16,777,216 pixels = 64 MB
- **Each pixel** is one 32-bit word: 4 bytes (R, G, B, A)
- **Addressing:** via a [Hilbert curve](https://en.wikipedia.org/wiki/Hilbert_curve), which maps a 1D address to a 2D pixel coordinate

The Hilbert curve matters because it preserves spatial locality — addresses that are near each other in 1D are near each other in 2D. This means a program's instructions cluster together visually on the texture. You can literally *see* where a program lives.

```
Address 0  → pixel (0, 0)
Address 1  → pixel (1, 0)
Address 2  → pixel (1, 1)
Address 3  → pixel (0, 1)
Address 4  → pixel (0, 2)
...
Address 100 → pixel somewhere else on the curve
```

The `d2xy` function in the shader converts addresses to coordinates:

```wgsl
fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u; var y = 0u; var s = 1u; var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) { x = s - 1u - x; y = s - 1u - y; }
            let t = x; x = y; y = t;
        }
        x += s * rx; y += s * ry; d /= 4u; s *= 2u;
    }
    return vec2<u32>(x, y);
}
```

---

## Instruction Encoding

Every pixel in the RAM texture can be interpreted as an instruction:

```
┌─────────┬──────────┬─────────┬─────────┐
│  R (8b) │  G (8b)  │  B (8b) │  A (8b) │
│ opcode  │ stratum  │   p1    │   p2    │
└─────────┴──────────┴─────────┴─────────┘
```

- **R = opcode:** What to do (0-255)
- **G = stratum:** Modifier / condition type / context
- **B = p1:** First parameter (register index, address, etc.)
- **A = p2:** Second parameter

This means every instruction is exactly one pixel (4 bytes). Some instructions (like LDI) consume the *next* pixel as a 32-bit data value, making them 2-pixel instructions.

### Opcodes Used by the Self-Replicating Program

| Opcode | Name   | Encoding                   | Behavior                                                      |
|--------|--------|----------------------------|---------------------------------------------------------------|
| 1      | LDI    | `(1, 0, reg, 0)` + DATA   | Load 32-bit immediate into register. Reads next pixel as data. PC += 2 |
| 3      | LOAD   | `(3, 0, src_reg, dst_reg)` | `r[p2] = mem[r[p1]]` — Read from RAM texture at Hilbert address in r[p1] |
| 4      | STORE  | `(4, 0, addr_reg, val_reg)`| `mem[r[p1]] = r[p2]` — Write to RAM texture at Hilbert address in r[p1] |
| 5      | ADD    | `(5, 0, src_reg, dst_reg)` | `r[p2] = r[p1] + r[p2]` — Add two registers                 |
| 10     | BRANCH | `(10, cond, r1, r2)` + OFF | Conditional branch. If condition met, PC = PC + 2 + signed_offset |
| 13     | HALT   | `(13, 0, 0, 0)`           | Stop execution                                                |

Branch condition types (encoded in stratum/G channel):

| Stratum | Condition | Meaning                    |
|---------|-----------|----------------------------|
| 0       | BEQ       | Branch if r[p1] == r[p2]   |
| 1       | BNE       | Branch if r[p1] != r[p2]   |
| 2       | BLT       | Branch if r[p1] < r[p2] (signed) |
| 3       | BGE       | Branch if r[p1] >= r[p2] (signed) |
| 4       | BLTU      | Branch if r[p1] < r[p2] (unsigned) |
| 5       | BGEU      | Branch if r[p1] >= r[p2] (unsigned) |

---

## The Self-Replicating Program

18 pixels. 72 bytes. The entire program:

```
┌──────┬──────────────────┬───────────────────────────────────────────────┐
│ Addr │ Pixel (R,G,B,A)  │ Meaning                                     │
├──────┼──────────────────┼───────────────────────────────────────────────┤
│    0 │ (  1, 0, 0, 0)   │ LDI r0 ──┐                                  │
│    1 │ (  0, 0, 0, 0)   │ DATA: 0  ┘  r0 = 0 (source start address)   │
│    2 │ (  1, 0, 1, 0)   │ LDI r1 ──┐                                  │
│    3 │ (100, 0, 0, 0)   │ DATA: 100┘  r1 = 100 (destination address)  │
│    4 │ (  1, 0, 2, 0)   │ LDI r2 ──┐                                  │
│    5 │ (  0, 0, 0, 0)   │ DATA: 0  ┘  r2 = 0 (loop counter)          │
│    6 │ (  1, 0, 3, 0)   │ LDI r3 ──┐                                  │
│    7 │ (  1, 0, 0, 0)   │ DATA: 1  ┘  r3 = 1 (increment constant)    │
│    8 │ (  1, 0, 4, 0)   │ LDI r4 ──┐                                  │
│    9 │ ( 18, 0, 0, 0)   │ DATA: 18 ┘  r4 = 18 (program length)       │
├──────┼──────────────────┼───────────────────────────────────────────────┤
│   10 │ (  3, 0, 0, 5)   │ LOAD r5 = mem[r0]    ← read src glyph      │
│   11 │ (  4, 0, 1, 5)   │ STORE mem[r1] = r5   ← write to dst        │
│   12 │ (  5, 0, 3, 0)   │ ADD r0 = r3 + r0     ← src++               │
│   13 │ (  5, 0, 3, 1)   │ ADD r1 = r3 + r1     ← dst++               │
│   14 │ (  5, 0, 3, 2)   │ ADD r2 = r3 + r2     ← counter++           │
│   15 │ ( 10, 1, 2, 4)   │ BRANCH BNE r2, r4 ──┐← if counter != 18   │
│   16 │ (249,255,255,255) │ DATA: -7 (signed)   ┘  jump back to addr 10│
├──────┼──────────────────┼───────────────────────────────────────────────┤
│   17 │ ( 13, 0, 0, 0)   │ HALT                                        │
└──────┴──────────────────┴───────────────────────────────────────────────┘
```

### How It Executes

**Setup phase (addresses 0-9):** Five LDI instructions load constants into registers. Each LDI is 2 pixels — the instruction pixel and a data pixel. After this phase:

- `r0 = 0` (source cursor)
- `r1 = 100` (destination cursor)
- `r2 = 0` (loop counter)
- `r3 = 1` (constant used for incrementing)
- `r4 = 18` (total pixels to copy)

**Copy loop (addresses 10-16):** Each iteration:

1. **LOAD** (addr 10): Read the pixel at Hilbert address `r0` from the RAM texture into `r5`
2. **STORE** (addr 11): Write `r5` to the RAM texture at Hilbert address `r1`
3. **ADD×3** (addr 12-14): Increment source, destination, and counter by 1
4. **BRANCH BNE** (addr 15-16): If counter ≠ 18, jump back to address 10

The branch offset is stored in address 16 as a 32-bit signed integer: `-7`. The branch formula is `new_pc = current_pc + 2 + offset = 15 + 2 + (-7) = 10`.

After 18 iterations, counter equals program length, branch falls through to HALT.

**Total cycles:** 10 (setup) + 18 × 8 (loop body: LOAD + STORE + ADD + ADD + ADD + BRANCH + offset-read + loop overhead) ≈ 150 cycles. Well within the 1024 cycle-per-frame budget.

### What It Copies

The program copies *everything* — including itself. Address 0-17 is duplicated to address 100-117. The copy includes:

- The LDI instructions and their data pixels
- The copy loop itself
- The branch offset
- The HALT instruction

The copy at address 100 is a **valid, complete program**. If you spawned a second VM at address 100, it would execute and copy itself to address 200. (That's the next test.)

---

## Execution Trace

What the GPU actually does, instruction by instruction:

```
PC= 0  LDI r0        → r0 = 0           (read data from pixel 1)
PC= 2  LDI r1        → r1 = 100         (read data from pixel 3)
PC= 4  LDI r2        → r2 = 0           (read data from pixel 5)
PC= 6  LDI r3        → r3 = 1           (read data from pixel 7)
PC= 8  LDI r4        → r4 = 18          (read data from pixel 9)

PC=10  LOAD r5=[r0]  → r5 = mem[0]   = 0x00000001  (the LDI opcode pixel)
PC=11  STORE [r1]=r5 → mem[100] = 0x00000001       (copied!)
PC=12  ADD r0+=r3    → r0 = 1
PC=13  ADD r1+=r3    → r1 = 101
PC=14  ADD r2+=r3    → r2 = 1
PC=15  BNE r2,r4     → 1 ≠ 18, take branch
       read offset   → mem[16] = -7
       PC = 15+2+(-7) = 10

PC=10  LOAD r5=[r0]  → r5 = mem[1]   = 0x00000000  (the DATA pixel: src=0)
PC=11  STORE [r1]=r5 → mem[101] = 0x00000000       (copied!)
...
(16 more iterations)
...
PC=14  ADD r2+=r3    → r2 = 18
PC=15  BNE r2,r4     → 18 == 18, fall through
PC=17  HALT          → VM stops
```

---

## The Frozen Bootstrap

The Rust code that loads the program is deliberately minimal. It runs once, before the GPU takes over:

```rust
// Encode one instruction pixel
fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32
        | ((stratum as u32) << 8)
        | ((p1 as u32) << 16)
        | ((p2 as u32) << 24)
}

// Write 18 pixels to the RAM texture
scheduler.poke_substrate_single(0,  glyph(1, 0, 0, 0));  // LDI r0
scheduler.poke_substrate_single(1,  0);                    // DATA: src=0
scheduler.poke_substrate_single(2,  glyph(1, 0, 1, 0));  // LDI r1
scheduler.poke_substrate_single(3,  100);                  // DATA: dst=100
// ... (14 more poke calls)

// Spawn and run
scheduler.spawn_vm(0, &config);
scheduler.execute_frame();  // GPU does the rest
```

After `execute_frame()`, the CPU can read back the texture to verify:

```rust
scheduler.sync_gpu_to_shadow();
let copied = scheduler.peek_substrate_single(100);
assert_eq!(copied, glyph(1, 0, 0, 0));  // ✓ The LDI instruction was copied
```

---

## Verified Output

From the actual test run:

```
=== VERIFICATION: Did pixels move pixels? ===

  ✓ addr   0 → addr 100: expected 0x00000001, got 0x00000001
  ✓ addr   1 → addr 101: expected 0x00000000, got 0x00000000
  ✓ addr   2 → addr 102: expected 0x00010001, got 0x00010001
  ✓ addr   3 → addr 103: expected 0x00000064, got 0x00000064
  ✓ addr   4 → addr 104: expected 0x00020001, got 0x00020001
  ✓ addr   5 → addr 105: expected 0x00000000, got 0x00000000
  ✓ addr   6 → addr 106: expected 0x00030001, got 0x00030001
  ✓ addr   7 → addr 107: expected 0x00000001, got 0x00000001
  ✓ addr   8 → addr 108: expected 0x00040001, got 0x00040001
  ✓ addr   9 → addr 109: expected 0x00000012, got 0x00000012
  ✓ addr  10 → addr 110: expected 0x05000003, got 0x05000003
  ✓ addr  11 → addr 111: expected 0x05010004, got 0x05010004
  ✓ addr  12 → addr 112: expected 0x00030005, got 0x00030005
  ✓ addr  13 → addr 113: expected 0x01030005, got 0x01030005
  ✓ addr  14 → addr 114: expected 0x02030005, got 0x02030005
  ✓ addr  15 → addr 115: expected 0x0402010A, got 0x0402010A
  ✓ addr  16 → addr 116: expected 0xFFFFFFF9, got 0xFFFFFFF9
  ✓ addr  17 → addr 117: expected 0x0000000D, got 0x0000000D

  ╔══════════════════════════════════════════╗
  ║   PIXELS MOVED PIXELS.                  ║
  ║   18 glyphs copied themselves on GPU.   ║
  ║   No Python. No CPU. Just light.        ║
  ╚══════════════════════════════════════════╝

  ✓ Source pixels intact. Self-replication is non-destructive.
```

Every pixel matches. The source is untouched. The program replicated itself.

---

## Running the Test

```bash
cd systems/infinite_map_rs
cargo test --test self_replication_test -- --ignored --nocapture
```

Requires a GPU (integrated or discrete). The test uses wgpu's automatic backend selection — Vulkan on Linux, Metal on macOS, DX12 on Windows.

---

## What This Means

This is the base case for Geometry OS. Everything else builds on this loop:

| Milestone | What it proves | Status |
|-----------|----------------|--------|
| **Self-replication** | Pixels can copy pixels | ✅ Done |
| **Copy executes** | The copy is a valid program that runs | ✅ Done |
| **Self-modification** | A program can rewrite its own opcodes | ✅ Done |
| **The Writer** | Pixels copy from atlas (texture-native abstraction) | ✅ Done |
| **Patch-and-copy** | GPU loads template, patches operands, emits new code | ✅ Done |
| **Pixels boot RISC-V** | Glyph VM bootloads RISC-V program → UART "Hi" | ✅ Done |
| **Glyph assembler (Rust)** | Bootstrap tool compiles text → opcodes | ✅ Done |
| **Full Assembler Loop** | GPU-native text → opcode compilation | ✅ Done |
| Boot Linux | Glyph VM loads kernel into RISC-V VM | Next |
| Self-hosting | No more Rust bootstrap needed | Goal |

The frozen bootstrap (18 `poke_substrate_single` calls) is the last time the CPU writes program logic. After that, programs write programs. Pixels move pixels. Light computes with light.

---

## Files

| File | Purpose |
|------|---------|
| `systems/infinite_map_rs/tests/self_replication_test.rs` | The test — loads 18 pixels, runs VM, verifies copy |
| `systems/infinite_map_rs/tests/copy_executes_test.rs` | Tests that copies can execute (0 → 100 → 200) |
| `systems/infinite_map_rs/tests/self_modification_test.rs` | Tests programs rewriting their own opcodes |
| `systems/infinite_map_rs/tests/training_glyph_test.rs` | GPU-native training glyph tests |
| `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl` | The GPU VM — executes instructions from the RAM texture |
| `systems/infinite_map_rs/src/glyph_vm_scheduler.rs` | Rust scheduler — manages VM state, dispatches compute shader |

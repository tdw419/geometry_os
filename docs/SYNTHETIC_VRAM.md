# Synthetic VRAM

**A CPU-side emulator of the Glyph VM that lets you develop and test programs without touching a real GPU.**

Created March 17, 2026. The day after pixels moved pixels on the GPU, we made them move on the CPU too — so we could stop crashing the computer.

---

## Why It Exists

The Glyph VM runs as a compute shader on the GPU. The "RAM" is a 4096×4096 RGBA8 texture. Programs are pixels. The GPU reads its own instructions from this texture, executes them, and writes results back.

This is powerful. It's also dangerous.

A bug in a glyph program — an out-of-bounds write, an infinite loop in the shader, a memory address that hits the wrong Hilbert coordinate — can hang the GPU, freeze the display, or crash the entire system. There's no debugger. There's no breakpoint. There's no "undo." You write pixels, dispatch a compute shader, and either it works or your screen goes black and you're reaching for the power button.

**Synthetic VRAM solves this.** It's a `Vec<u32>` that pretends to be a GPU texture. Every opcode, every Hilbert mapping, every VM state transition is replicated exactly in Rust on the CPU. You get:

- **No crashes.** It's just a Vec. The worst that happens is a Rust panic with a stack trace.
- **Single-stepping.** Execute one instruction at a time. Inspect every register after every cycle.
- **Execution tracing.** Record every opcode, every PC value, every cycle — then replay or analyze.
- **Fast iteration.** No GPU initialization, no wgpu device creation, no shader compilation. Tests run in microseconds.
- **CI-friendly.** Runs on any machine, even headless servers with no GPU.

---

## How It Maps to the Real GPU

The Synthetic VRAM is a **line-by-line port** of `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl`. Every opcode case in the WGSL `switch` has a corresponding `match` arm in Rust. The memory model is identical.

```
 REAL GPU                              SYNTHETIC VRAM
┌──────────────────────┐              ┌──────────────────────┐
│ texture_storage_2d   │              │ Vec<u32>             │
│ <rgba8uint>          │    ═══▶      │ (4096×4096 entries)  │
│ 4096×4096 pixels     │              │                      │
└──────────┬───────────┘              └──────────┬───────────┘
           │                                     │
    textureLoad(ram, pos)                 vram[y * 4096 + x]
    textureStore(ram, pos, val)           vram[y * 4096 + x] = val
           │                                     │
    Hilbert d2xy(d) → (x,y)              Hilbert d2xy(d) → (x,y)
           │                                     │
    ┌──────▼──────────────┐              ┌───────▼─────────────┐
    │ WGSL switch(opcode) │              │ Rust match opcode {  │
    │   case 1u: LDI      │    ═══▶      │   1 => LDI          │
    │   case 3u: LOAD     │              │   3 => LOAD          │
    │   case 4u: STORE    │              │   4 => STORE          │
    │   case 5u: ADD      │              │   5 => ADD            │
    │   case 10u: BRANCH  │              │   10 => BRANCH        │
    │   case 13u: HALT    │              │   13 => HALT          │
    │   ...               │              │   ...                 │
    └─────────────────────┘              └───────────────────────┘
```

### What's Identical

| Component | GPU | Synthetic |
|---|---|---|
| Memory layout | 4096×4096 RGBA8 texture | `Vec<u32>` of 16,777,216 entries |
| Addressing | Hilbert curve `d2xy()` | Same algorithm in Rust |
| Pixel format | R=opcode, G=stratum, B=p1, A=p2 | Same u32 encoding |
| VM count | 8 max | 8 max |
| Registers | 128 per VM | 128 per VM |
| Call stack | 64 entries per VM | 64 entries per VM |
| Cycles per frame | 1024 per VM | 1024 per VM (configurable) |
| Spatial bounds | `check_spatial_bounds()` | Same logic |
| All opcodes | 0–235 | Same set |

### What's Different

| Aspect | GPU | Synthetic |
|---|---|---|
| Parallelism | 8 VMs execute simultaneously | 8 VMs execute sequentially (VM 0, then 1, then 2...) |
| Timing | All VMs share one dispatch | Each VM runs its full cycle budget before the next |
| Texture atomics | Implicit (single workgroup) | N/A (sequential Rust) |
| Performance | Hardware-speed | ~100x slower, but still fast for testing |

The sequential execution is actually a **feature** — it makes behavior deterministic and reproducible, which is exactly what you want for development and debugging.

---

## The Hilbert Curve

Both the GPU shader and Synthetic VRAM use the same Hilbert curve to map a 1D address to a 2D coordinate:

```
Address 0 → (0, 0)     Address 4 → (0, 2)
Address 1 → (1, 0)     Address 5 → (0, 3)
Address 2 → (1, 1)     Address 6 → (1, 3)
Address 3 → (0, 1)     Address 7 → (1, 2)
```

The curve is space-filling and locality-preserving: addresses that are close in 1D are close in 2D. This means instructions that execute together live near each other in the texture, which is good for GPU cache performance. In Synthetic VRAM it doesn't matter for performance, but the mapping must be identical so programs behave the same way.

```rust
fn d2xy(&self, d: u32) -> (u32, u32) {
    let n = self.grid_size();
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut d = d;
    while s < n {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);
        if ry == 0 {
            if rx == 1 { x = s - 1 - x; y = s - 1 - y; }
            std::mem::swap(&mut x, &mut y);
        }
        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }
    (x, y)
}
```

---

## Instruction Encoding

Every pixel in VRAM is one instruction (or one data word). The encoding is:

```
Bit layout of a u32 pixel:

 31       24 23       16 15        8 7         0
┌───────────┬───────────┬───────────┬───────────┐
│    p2     │    p1     │  stratum  │  opcode   │
│  (arg 2)  │  (arg 1)  │  (layer)  │ (op code) │
└───────────┴───────────┴───────────┴───────────┘
     A           B           G           R

This matches the GPU's RGBA8 texture format:
  R = opcode    (byte 0)
  G = stratum   (byte 1)
  B = p1        (byte 2)
  A = p2        (byte 3)
```

To write an instruction in Rust:

```rust
// Helper to encode a glyph pixel
fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32
        | ((stratum as u32) << 8)
        | ((p1 as u32) << 16)
        | ((p2 as u32) << 24)
}
```

---

## The Opcode Table

These are all opcodes implemented in Synthetic VRAM, matching the WGSL shader exactly.

### Register-based (0–16) — The Core ISA

| Op | Name | Encoding | Behavior |
|---|---|---|---|
| 0 | NOP | `(0, -, -, -)` | Skip. PC += 1 |
| 1 | LDI | `(1, -, reg, -)` + next pixel = data | `regs[p1] = mem[PC+1]`. PC += 2 |
| 2 | MOV | `(2, -, src, dst)` | `regs[p2] = regs[p1]`. PC += 1 |
| 3 | LOAD | `(3, -, addr_reg, dst_reg)` | `regs[p2] = mem[regs[p1]]`. PC += 1 |
| 4 | STORE | `(4, -, addr_reg, val_reg)` | `mem[regs[p1]] = regs[p2]`. PC += 1 |
| 5 | ADD | `(5, -, r1, r2)` | `regs[p2] = regs[p1] + regs[p2]`. PC += 1 |
| 6 | SUB | `(6, -, r1, r2)` | `regs[p2] = regs[p1] - regs[p2]`. PC += 1 |
| 7 | MUL | `(7, -, r1, r2)` | `regs[p2] = regs[p1] * regs[p2]`. PC += 1 |
| 8 | DIV | `(8, -, r1, r2)` | `regs[p2] = regs[p1] / regs[p2]` (0-safe). PC += 1 |
| 9 | JMP | `(9, mode, r/lo, hi)` | stratum=2: PC-relative. else: `PC = regs[p1]` |
| 10 | BRANCH | `(10, cond, r1, r2)` + next pixel = offset | Conditional PC-relative. See below. |
| 11 | CALL | `(11, -, addr_reg, -)` | Push PC+1, jump to `regs[p1]` |
| 12 | RET | `(12, -, -, -)` | Pop PC from stack |
| 13 | HALT | `(13, -, -, -)` | Stop VM |
| 14 | DATA | `(14, -, -, -)` | Passive. Skipped. PC += 1 |
| 16 | JAL | `(16, -, link_reg, -)` + next pixel = offset | `regs[p1] = PC+2`, then PC-relative jump |

### BRANCH conditions (opcode 10, stratum selects comparison)

| Stratum | Condition | Mnemonic |
|---|---|---|
| 0 | `regs[p1] == regs[p2]` | BEQ |
| 1 | `regs[p1] != regs[p2]` | BNE |
| 2 | `(signed) regs[p1] < regs[p2]` | BLT |
| 3 | `(signed) regs[p1] >= regs[p2]` | BGE |
| 4 | `(unsigned) regs[p1] < regs[p2]` | BLTU |
| 5 | `(unsigned) regs[p1] >= regs[p2]` | BGEU |

The branch target is PC-relative: `new_pc = current_pc + 2 + signed_offset` where `signed_offset` is the 32-bit value in the next pixel.

### Bitwise (128–133)

| Op | Name | Behavior |
|---|---|---|
| 128 | AND | `regs[p2] = regs[p1] & regs[p2]` |
| 129 | OR | `regs[p2] = regs[p1] \| regs[p2]` |
| 130 | XOR | `regs[p2] = regs[p1] ^ regs[p2]` |
| 131 | SHL | `regs[p2] = regs[p1] << (regs[p2] & 31)` |
| 132 | SHR | `regs[p2] = regs[p1] >> (regs[p2] & 31)` |
| 133 | SAR | Arithmetic shift right (sign-preserving) |

### Spatial / Self-Modifying (225–235)

| Op | Name | Behavior |
|---|---|---|
| 225 | SPATIAL_SPAWN | Find an inactive VM slot, start it at `regs[p1]` |
| 226 | GLYPH_MUTATE | Hebbian weight update (AI-native) |
| 232 | GLYPH_WRITE | Copy glyphs in memory (self-modifying code) |
| 233 | ATTENTION_FOCUS | Set/clear attention mask on VM |
| 234 | GLYPH_MUTATE_FIELD | Modify one byte of a glyph in-place |
| 235 | SEMANTIC_MERGE | Deduplicate glyph clusters |

### Memory-based (200–229) — Compiled Program ISA

These operate on memory addresses directly (not registers). Used by the GPU assembler's output.

| Op | Name | Encoding `(op, dst, src1, src2)` | Behavior |
|---|---|---|---|
| 200 | NOP | | Skip |
| 201 | ADD | `(201, dst, s1, s2)` | `mem[dst] = mem[s1] + mem[s2]` |
| 202 | SUB | | `mem[dst] = mem[s1] - mem[s2]` |
| 203 | MUL | | `mem[dst] = mem[s1] * mem[s2]` |
| 204 | DIV | | `mem[dst] = mem[s1] / mem[s2]` |
| 205 | LOAD | `(205, dst, src, -)` | `mem[dst] = mem[src]` |
| 206 | STORE | `(206, dst, imm, -)` | `mem[dst] = imm` |
| 207 | LOADIMM | `(207, dst, -, -)` + next pixel | `mem[dst] = next_pixel_u32` |
| 208 | JUMP | `(208, target, -, -)` | `PC = target` |
| 209 | JUMPZ | `(209, test_addr, target, -)` | `if mem[test] == 0: PC = target` |
| 210 | JUMPNZ | `(210, test_addr, target, -)` | `if mem[test] != 0: PC = target` |
| 211 | CMP | `(211, dst, s1, s2)` | `mem[dst] = (mem[s1] == mem[s2]) ? 1 : 0` |
| 212–217 | AND/OR/XOR/NOT/SHL/SHR | | Bitwise on memory |
| 218 | CALL | `(218, target, -, -)` | Push PC+1, jump to target |
| 219 | RET | | Pop PC |
| 220 | PUSH | `(220, addr, -, -)` | Push `mem[addr]` onto stack memory |
| 221 | POP | `(221, addr, -, -)` | Pop from stack memory into `mem[addr]` |
| 228 | FADD | | Float add (integer fallback) |
| 229 | FMUL | | Float mul (integer fallback) |

---

## API Reference

### Construction

```rust
use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};

// Full 4096×4096 grid (64MB, matches real GPU)
let mut vram = SyntheticVram::new();

// Smaller grid for fast tests (must be power of 2)
let mut vram = SyntheticVram::new_small(256);
```

### Writing Programs (The Frozen Bootstrap)

```rust
// Write raw u32 values
vram.poke(0, 0x00000001);  // addr 0 = LDI r0

// Write structured glyph instructions
vram.poke_glyph(0, 1, 0, 0, 0);  // LDI r0 (opcode=1, stratum=0, p1=0, p2=0)
vram.poke(1, 42);                  // DATA = 42
vram.poke_glyph(2, 13, 0, 0, 0);  // HALT
```

### Running Programs

```rust
// Spawn a VM
let config = SyntheticVmConfig {
    entry_point: 0,        // Start executing at Hilbert address 0
    base_addr: 0,          // Memory bounds start (0 = unrestricted)
    bound_addr: 0,         // Memory bounds end (0 = unrestricted)
    ..Default::default()
};
vram.spawn_vm(0, &config).unwrap();  // VM slot 0

// Execute one frame (up to 1024 cycles per VM)
vram.execute_frame();

// Or with custom cycle limit
vram.execute_frame_with_limit(100);

// Or single-step for debugging
vram.step(0);  // Execute one instruction on VM 0
```

### Inspecting State

```rust
// Read memory
let val = vram.peek(100);

// Read VM registers
let vm = vram.vm_state(0).unwrap();
println!("PC: {}, r0: {}, r1: {}", vm.pc, vm.regs[0], vm.regs[1]);

// Check if halted
if vram.is_halted(0) {
    println!("VM 0 has stopped");
}

// Dump a range of memory
for (addr, val) in vram.dump_range(100, 18) {
    println!("  addr {}: 0x{:08X}", addr, val);
}
```

### Execution Tracing

```rust
vram.enable_tracing();
vram.execute_frame();

for entry in vram.trace() {
    println!("VM{} PC={:3} op={:3} stratum={} p1={} p2={} cycle={}",
        entry.vm_id, entry.pc, entry.opcode,
        entry.stratum, entry.p1, entry.p2, entry.cycle);
}
```

### Spatial Bounds (Sandboxing)

```rust
let config = SyntheticVmConfig {
    entry_point: 50,
    base_addr: 50,
    bound_addr: 200,  // VM can only access addresses [50, 200)
    ..Default::default()
};
// Any LOAD or STORE outside this range halts the VM immediately
```

---

## Worked Example: Self-Replication

The 18-pixel program that copies itself from address 0 to address 100. This is the same program that ran on the real GPU on March 16, 2026. Here it runs on the CPU with zero crash risk.

```rust
let mut vram = SyntheticVram::new();

// Helper
fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32 | ((stratum as u32) << 8)
        | ((p1 as u32) << 16) | ((p2 as u32) << 24)
}

// === THE PROGRAM (18 pixels) ===
//
// Setup: load constants into registers
vram.poke(0,  glyph(1, 0, 0, 0));  // LDI r0 (source address)
vram.poke(1,  0);                    //   = 0
vram.poke(2,  glyph(1, 0, 1, 0));  // LDI r1 (destination address)
vram.poke(3,  100);                  //   = 100
vram.poke(4,  glyph(1, 0, 2, 0));  // LDI r2 (counter)
vram.poke(5,  0);                    //   = 0
vram.poke(6,  glyph(1, 0, 3, 0));  // LDI r3 (increment)
vram.poke(7,  1);                    //   = 1
vram.poke(8,  glyph(1, 0, 4, 0));  // LDI r4 (program length)
vram.poke(9,  18);                   //   = 18

// Copy loop
vram.poke(10, glyph(3, 0, 0, 5));  // LOAD  r5 = mem[r0]  — read source pixel
vram.poke(11, glyph(4, 0, 1, 5));  // STORE mem[r1] = r5  — write to destination
vram.poke(12, glyph(5, 0, 3, 0));  // ADD   r0 += r3      — source++
vram.poke(13, glyph(5, 0, 3, 1));  // ADD   r1 += r3      — destination++
vram.poke(14, glyph(5, 0, 3, 2));  // ADD   r2 += r3      — counter++
vram.poke(15, glyph(10, 1, 2, 4)); // BRANCH BNE r2, r4   — loop if counter != 18
vram.poke(16, (-7i32) as u32);      //   offset = -7  (15 + 2 + (-7) = 10)
vram.poke(17, glyph(13, 0, 0, 0)); // HALT

// Run it
vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
vram.execute_frame();

// Verify: addresses 100–117 are an exact copy of 0–17
for addr in 0..18 {
    assert_eq!(vram.peek(addr), vram.peek(100 + addr));
}
```

### Execution trace of the self-replicator

```
Cycle  PC  Instruction          Effect
─────  ──  ───────────────────  ─────────────────────────────
  0     0  LDI r0               r0 = 0 (source start)
  1     2  LDI r1               r1 = 100 (dest start)
  2     4  LDI r2               r2 = 0 (counter)
  3     6  LDI r3               r3 = 1 (increment)
  4     8  LDI r4               r4 = 18 (length)
  5    10  LOAD r5, [r0]        r5 = mem[0] (first pixel of itself)
  6    11  STORE [r1], r5       mem[100] = r5 (write copy)
  7    12  ADD r0 += r3         r0 = 1
  8    13  ADD r1 += r3         r1 = 101
  9    14  ADD r2 += r3         r2 = 1
 10    15  BRANCH BNE r2,r4     1 != 18 → jump to PC 10
 11    10  LOAD r5, [r0]        r5 = mem[1] (second pixel)
 12    11  STORE [r1], r5       mem[101] = r5
  ...  ...  (repeats 16 more times)
113    15  BRANCH BNE r2,r4     18 != 18 → false, fall through
114    17  HALT                  VM stops. 18 pixels copied.
```

---

## Development Workflow

```
 1. Write program              2. Test on Synthetic VRAM         3. Deploy to GPU
    (pixels/glyphs)               (safe, fast, debuggable)          (the real thing)

  ┌─────────────┐             ┌──────────────────────┐          ┌─────────────────┐
  │ .glyph file │────────────▶│  cargo test --lib    │─────────▶│ execute_frame() │
  │ or Rust     │  compile    │  synthetic_vram      │  proven  │ on real GPU     │
  │ poke() calls│             │                      │          │                 │
  └─────────────┘             │  • Single-step       │          └─────────────────┘
                              │  • Trace execution   │
                              │  • Assert registers  │
                              │  • No GPU required   │
                              │  • No crash risk     │
                              └──────────────────────┘
```

1. **Write your glyph program** using `poke()` / `poke_glyph()` calls
2. **Test on Synthetic VRAM** — single-step, trace, inspect registers, assert outcomes
3. **Once proven**, run the same program on the real GPU via `GlyphVmScheduler`

The program bytes are identical. The encoding is identical. If it works in Synthetic VRAM, it works on the GPU.

---

## File Location

```
systems/infinite_map_rs/src/synthetic_vram.rs
```

Registered as `pub mod synthetic_vram` in `src/lib.rs`.

Run all Synthetic VRAM tests:
```bash
cargo test --lib synthetic_vram
```

---

## Relationship to Other Components

| Component | Role |
|---|---|
| `glyph_vm_scheduler.wgsl` | The real GPU shader. Synthetic VRAM is a port of this. |
| `GlyphVmScheduler` (Rust) | Rust wrapper that dispatches the WGSL shader. Uses `wgpu::Texture`. |
| `SyntheticVram` (Rust) | CPU emulator. Uses `Vec<u32>`. Same opcodes, same behavior. |
| `self_replication_test.rs` | GPU test (requires `#[ignore]` + real GPU). |
| `synthetic_vram::tests` | CPU tests. Run anywhere, always. |

---

## Limitations

- **No render output.** Synthetic VRAM doesn't produce pixels on screen. It's for logic testing, not visual output.
- **Sequential VM execution.** Real GPU runs all 8 VMs in parallel within one dispatch. Synthetic VRAM runs them one at a time. For most programs this doesn't matter, but race conditions between VMs won't reproduce identically.
- **No trap interface.** The `poll_trap_region()` mechanism (for RISC-V↔Glyph bridging) is not emulated.
- **Full grid is 64MB.** `SyntheticVram::new()` allocates a 4096×4096 grid of u32 (64MB). Use `new_small(256)` for unit tests that don't need the full address space.

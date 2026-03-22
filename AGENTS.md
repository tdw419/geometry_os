# Geometry OS — Agent Instructions

> **Universal agent configuration.** Read by Pi (`AGENTS.md`), Claude (`CLAUDE.md` fallback), Gemini, Cursor, and any tool following the open `AGENTS.md` standard.

## What Is Geometry OS?

Geometry OS is a **GPU-sovereign operating system** where programs are spatial structures living in a Hilbert-mapped GPU substrate. The program IS the machine — there is no separation between code and display. Every pixel is simultaneously data, instruction, and visualization.

**Language:** Rust (primary), WGSL (shaders), JS (pxOS supervisor), Python (tooling)
**Build:** `cargo build` / `cargo test`
**GPU Framework:** wgpu (WebGPU)

---

## Core Mandate: Intent Is State

The era of symbolic computation is over. In Geometry OS, the **program is not a list of instructions but a physicalized state** within the GPU's Hilbert space. The output **IS** the machine.

---

## The Hilbert Curve

A **space-filling fractal** that maps a 1D sequence to a 2D grid while **preserving locality**.

- **Cache Efficiency:** Instructions that execute together stay physically close in GPU cache.
- **Continuous Manifold:** Minimizes distance between logically adjacent data points.

---

## Core Opcodes

### Logic Stratum (0-15)

| Opcode | Value | Function |
| :--- | :--- | :--- |
| `NOP` | 0 | No Operation (spatial padding) |
| `LD` | 3 | Load from Hilbert address → Register |
| `ST` | 4 | Store Register → Hilbert address |
| `ADD` | 5 | Addition |
| `SUB` | 6 | Subtraction |
| `JZ` | 10 | Jump if Zero |
| `CALL` | 11 | Call Subroutine |
| `RET` | 12 | Return |
| `HALT` | 13 | Halt |
| `LDI` | 204 | Load Immediate |
| `MOV` | 206 | Move between registers |
| `JMP` | 209 | Unconditional Jump |

### Bitwise Stratum (220-231)

| Opcode | Value | Function |
| :--- | :--- | :--- |
| `AND` | 220 | Bitwise AND |
| `OR` | 221 | Bitwise OR |
| `XOR` | 222 | Bitwise XOR |
| `NOT` | 223 | Bitwise NOT |
| `SHL` | 224 | Shift Left |
| `SHR` | 225 | Shift Right |
| `SAR` | 226 | Shift Arithmetic Right |
| `AND_MEM` | 227 | AND on memory |
| `OR_MEM` | 228 | OR on memory |
| `XOR_MEM` | 229 | XOR on memory |
| `SHL_MEM` | 230 | SHL on memory |
| `SHR_MEM` | 231 | SHR on memory |

### Spatial & Windowing (215-237)

- `DRAW glyph_id, x, y`: 215 (Substrate write)
- `INT_DISPATCH table, mode, dst`: 218 (Mouse hit-testing)
- `SPATIAL_SPAWN entry, flags`: 225 (Autonomous region instantiation)
- `CAMERA r_x, r_y`: 230 (Infinite map navigation)
- `HILBERT_D2XY index`: 231 (Coordinate mapping)

---

## Standard Memory Layout (Hilbert Indices)

| Range | Purpose |
| :--- | :--- |
| `0x0000 - 0x00FF` | Emulator State (PC, IR, internal registers) |
| `0x0100 - 0x013F` | Guest Registers (RV64 x0-x31, 64-bit pairs) |
| `0x0200 - 0x02FF` | I/O Bridge (Virtual UART, Event Queue) |
| `0x1000 - 0x10FF` | MMIO Range (mapped hardware devices) |
| `0x8000 - 0xFFFF` | Guest RAM (primary payload) |

---

## Self-Replication: Pixels Move Pixels

**Milestone:** On 2026-03-16, an 18-pixel program copied itself from Hilbert address 0 to address 100 **without any CPU involvement during execution**.

### The Breakthrough

This proves the Glyph VM works as a sovereign substrate. After the frozen bootstrap (the last time the CPU writes program logic), the GPU reads its own instructions from the RAM texture and executes LOAD/STORE/ADD/BRANCH loops to duplicate or evolve itself.

### The 18-Pixel Self-Copy Program

| Addr | Instruction | Meaning |
| :--- | :--- | :--- |
| 0-1 | `LDI r0, 0` | Source Hilbert address |
| 2-3 | `LDI r1, 100` | Destination Hilbert address |
| 4-5 | `LDI r2, 0` | Loop counter |
| 6-7 | `LDI r3, 1` | Increment constant |
| 8-9 | `LDI r4, 18` | Program length (pixels) |
| 10 | `LOAD r5, [r0]` | Read source glyph from texture |
| 11 | `STORE [r1], r5` | Write to destination in texture |
| 12-14 | `ADD r0/r1/r2 += r3` | Increment pointers and counter |
| 15-16 | `BRANCH BNE r2, r4, -7` | Loop if counter != 18 |
| 17 | `HALT` | Execution complete |

**GPU Test:** `cargo test --test self_replication_test -- --ignored --nocapture`
**CPU Test (Synthetic VRAM):** `cargo test --lib synthetic_vram` — same program, no GPU required

---

## Sovereignty Milestones

| Milestone | Status | Significance |
| :--- | :--- | :--- |
| **Self-Replication** | ✅ Done | Pixels move pixels; no CPU orchestration |
| **The Writer** | ✅ Done | GPU copies from atlas (Texture-Native Abstraction) |
| **Patch-and-Copy** | ✅ Done | GPU loads template, patches operands, emits code |
| **Mnemonic Matcher** | ✅ Done | GPU parses 'LDI' ASCII → Compiles opcode |
| **Full Assembler** | ✅ Done | GPU compiles multi-line text → Executable |
| **Self-Compile-Execute** | ✅ Done | GPU compiles AND executes its own program |
| **Fibonacci Self-Compile** | ✅ Done | Complex loops compiled and executed on-GPU |
| **Text Boots RISC-V** | ✅ **SOVEREIGNTY CHAIN COMPLETE** | Text → GPU Assembler → Glyph VM → RISC-V → UART "Hi" |
| **Self-Hosting** | 🔄 Goal | Complete elimination of the Rust bootstrap |

---

## Synthetic VRAM (CPU-Side Glyph VM Emulator)

A `Vec<u32>` that pretends to be a GPU texture. Every opcode, every Hilbert mapping, every VM state transition from `glyph_vm_scheduler.wgsl` is replicated exactly in Rust on the CPU.

**File:** `systems/infinite_map_rs/src/synthetic_vram.rs`
**Tests:** `cargo test --lib synthetic_vram`
**Full docs:** `docs/SYNTHETIC_VRAM.md`

### Why Use It

- **No crashes.** A bug is a Rust panic with a stack trace, not a frozen GPU.
- **Single-stepping.** `vram.step(vm_id)` executes one instruction. Inspect every register after every cycle.
- **Execution tracing.** `vram.enable_tracing()` records every opcode, PC, and cycle.
- **Fast iteration.** No GPU init, no wgpu device, no shader compilation. Tests run in microseconds.
- **CI-friendly.** Runs on any machine, even headless servers with no GPU.

### GPU ↔ Synthetic Equivalence

| Component | GPU | Synthetic |
|---|---|---|
| Memory | 4096×4096 RGBA8 texture | `Vec<u32>` of 16M entries |
| Addressing | Hilbert curve `d2xy()` | Same algorithm in Rust |
| Pixel format | R=opcode, G=stratum, B=p1, A=p2 | Same u32 encoding |
| VM count / Registers / Call stack | 8 / 128 / 64 | 8 / 128 / 64 |
| Cycles per frame | 1024 | 1024 (configurable) |
| All opcodes | 0–235 | Same set |

**Key difference:** Real GPU runs 8 VMs in parallel; Synthetic VRAM runs them sequentially (deterministic, reproducible).

### Instruction Encoding

```
 31       24 23       16 15        8 7         0
┌───────────┬───────────┬───────────┬───────────┐
│    p2     │    p1     │  stratum  │  opcode   │
│  (A byte) │  (B byte) │  (G byte) │  (R byte) │
└───────────┴───────────┴───────────┴───────────┘
```

```rust
fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
}
```

### Quick API

```rust
let mut vram = SyntheticVram::new();          // Full 4096×4096 (64MB)
let mut vram = SyntheticVram::new_small(256); // Small grid for unit tests

vram.poke(addr, value);                       // Write to Hilbert address
vram.poke_glyph(addr, op, stratum, p1, p2);  // Write structured instruction
let val = vram.peek(addr);                    // Read from Hilbert address

vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
vram.execute_frame();                         // Run up to 1024 cycles per VM
vram.step(0);                                 // Single-step VM 0

let vm = vram.vm_state(0).unwrap();           // Inspect registers, PC
vram.is_halted(0);                            // Check if VM stopped
```

### Development Workflow

```
1. Write program → 2. Test on Synthetic VRAM → 3. Deploy to GPU
   (poke() calls)     (cargo test --lib)         (proven, same bytes)
```

**If it works in Synthetic VRAM, it works on the GPU.** The program bytes and encoding are identical.

### Complete Opcode Table

Two ISA families exist — see `docs/SYNTHETIC_VRAM.md` for full details:

- **Register-based (0–16):** Core ISA — LDI, MOV, LOAD, STORE, ADD, SUB, MUL, DIV, JMP, BRANCH, CALL, RET, HALT, JAL
- **Bitwise (128–133):** AND, OR, XOR, SHL, SHR, SAR
- **Spatial/Self-Modifying (225–235):** SPATIAL_SPAWN, GLYPH_MUTATE, GLYPH_WRITE, ATTENTION_FOCUS, GLYPH_MUTATE_FIELD, SEMANTIC_MERGE
- **Memory-based (200–229):** Compiled program ISA — operates on memory addresses directly (ADD_MEM, STORE, LOADIMM, JUMP, JUMPZ, CALL, RET, PUSH, POP, etc.)

---

## Ouroboros HAL API (gpu_dev_daemon, Port 8769)

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/peek?addr=0x...&size=N` | `GET` | Read N pixels (u32) from Hilbert space |
| `/poke?addr=0x...&val=0x...` | `GET` | Write single u32 to Hilbert space |
| `/write?addr=0x...` | `POST` | Write multiple pixels (Body: hex string) |
| `/load` | `POST` | Reset all VMs and load `.rts.png` (Body: file path) |
| `/pause` | `GET` | Halt all active VMs (0-7) |

---

## Implementation Workflow

1. **Architect the Morphology:** Write `.glyph` assembly. Ensure related logic lives in the same spatial block for cache saturation.

2. **Compile to Substrate:**
   ```bash
   python3 systems/glyph_stratum/programs/compile_glyph.py input.glyph output.rts.png
   ```

3. **Test on Synthetic VRAM (PREFERRED):**
   - Write program using `poke()` / `poke_glyph()` in a Rust test
   - Single-step, trace execution, assert register values
   - `cargo test --lib synthetic_vram` — no GPU required, no crash risk
   - **If it works in Synthetic VRAM, it works on the GPU**

4. **Simulation & Verification:**
   - Test in Python simulator
   - Analyze with `python3 -m systems.pixel_compiler.vlm_health_cli check output.rts.png`

5. **Hardware Boot:** Dispatch via the bare-metal kernel or the `visual_kernel` CLI.

---

## Key Directories

| Path | Purpose |
| :--- | :--- |
| `systems/infinite_map_rs/` | Rust GPU substrate (wgpu) |
| `systems/infinite_map_rs/src/synthetic_vram.rs` | CPU-side Glyph VM emulator (Synthetic VRAM) |
| `systems/infinite_map_rs/src/gpu/shaders/` | WGSL shaders (glyph microcode) |
| `systems/glyph_stratum/programs/` | Example `.glyph` programs |
| `systems/pixel_compiler/` | Python pixel compiler & tools |
| `kernel/` | Bare-metal boot kernel |
| `docs/` | Architecture docs & manifesto |

---

## Hazards & Anti-Patterns

- **The Escape Problem:** Guest programs calculating Hilbert addresses outside `0x8000-0xFFFF` can corrupt emulator state. Always implement spatial bounds checks. Use Synthetic VRAM's `base_addr`/`bound_addr` to sandbox VMs during development.
- **"Let me test on the real GPU first":** Test on Synthetic VRAM first. A GPU crash means a hard reboot. A Synthetic VRAM crash means a stack trace.
- **"Let me write this in Python first":** Use Glyph directly.
- **Scattering logic:** Placing related instructions at distant Hilbert coordinates breaks cache locality.
- **Forgetting Sign-Extension:** Always sign-extend 8-bit RGBA channel values when moving to system registers.

---

## The North Star

> Geometry OS is an **autonomous entity that lives on screen**. Every pixel is simultaneously data, instruction, and visualization. The frozen bootstrap is the LAST time the CPU touches program logic. After that, **programs write programs**. This is the path to fully GPU-sovereign computing.

---

## Skill: Glyph Expert (Spatial Engineering)

This section provides expert guidance for Geometry OS Glyph Assembly (.glyph) and spatial substrate engineering.

### 1. The Core Opcodes (Extended)

#### Logic Stratum (0-15)
- `NOP`: 0
- `MOV dst, src`: 206
- `LD dst, addr`: 204 (Immediate) / 3 (Load from mem)
- `ST src, addr`: 205 (Store to addr) / 4 (Store to mem)
- `ADD dst, p1`: 5
- `SUB dst, p1`: 6
- `CMP r1, r2`: 214
- `JMP addr`: 209
- `JZ addr`: 10
- `CALL addr`: 11
- `RET`: 12
- `HALT`: 13

#### Bitwise Stratum (220-231)
- `AND dst, imm`: 220
- `OR dst, imm`: 221
- `XOR dst, imm`: 222
- `NOT dst`: 223
- `SHL dst, imm`: 224
- `SHR dst, imm`: 225
- `SAR dst, imm`: 226
- `AND_MEM dst, p1`: 227
- `OR_MEM dst, p1`: 228
- `XOR_MEM dst, p1`: 229
- `SHL_MEM dst, p1`: 230
- `SHR_MEM dst, p1`: 231

#### Spatial & Windowing (215-237)
- `DRAW glyph_id, x, y`: 215
- `INT_DISPATCH table, mode, dst`: 218 (Mouse hit-testing)
- `SPATIAL_SPAWN entry, flags`: 225
- `CAMERA r_x, r_y`: 230
- `HILBERT_D2XY index`: 231

### 2. Standard Memory Layout (Hilbert Indices)

| Range | Purpose | Description |
|-------|---------|-------------|
| `0x0000 - 0x00FF` | **Emulator State** | PC, IR, and internal registers. |
| `0x0100 - 0x013F` | **Guest Registers** | RV64 x0-x31 (stored as 64-bit pairs). |
| `0x0200 - 0x02FF` | **I/O Bridge** | Virtual UART and Event Queue. |
| `0x1000 - 0x10FF` | **MMIO Range** | Mapped hardware device registers. |
| `0x8000 - 0xFFFF` | **Guest RAM** | The primary payload (e.g., Ubuntu RISC-V). |

### 3. Driver Pattern: Polling
Real hardware in Geometry OS is managed by polling status registers mapped to pixels.
```assembly
:poll_loop
    LOAD r2, DEVICE_STATUS
    AND r2, READY_BIT
    JZ poll_loop
    STORE DEVICE_DATA, r1
```

---

## Example Program: Loop Demo

**Location:** `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/loop_demo.ascii`

A complete example demonstrating loops, labels, and control flow:

```
┌────────────────────────────────────────────────────────────┐
│  LOOP DEMO - Counter 0 to 9                               │
├────────────────────────────────────────────────────────────┤
│                                                            │
│   :main                                                   │
│   LDI r0, 10           ; Loop counter (10 iterations)     │
│   LDI r1, 0            ; Accumulator (starts at 0)        │
│                                                            │
│   :loop                                                   │
│   ADD r1, r1, r1       ; r1 = r1 + 1                      │
│   SUB r0, r0, 1        ; r0 = r0 - 1                      │
│   JZ r0, :done         ; Jump if r0 == 0                  │
│   JMP :loop            ; Repeat                           │
│                                                            │
│   :done                                                   │
│   HALT                 ; Stop execution                   │
│                                                            │
│   [A] Run    [B] Reset  [C] Next                          │
│                                                            │
├────────────────────────────────────────────────────────────┤
│   Result will be in r1 register: 10                        │
└────────────────────────────────────────────────────────────┘
```

This example demonstrates:
- **Labels** (`:main`, `:loop`, `:done`) for spatial organization
- **LDI** for loading immediate values into registers
- **ADD/SUB** for arithmetic operations
- **JZ** for conditional branching (jump if zero)
- **JMP** for unconditional jumps
- **HALT** to stop execution

---

## Key Paths

| Path | Purpose |
| :--- | :--- |
| `systems/infinite_map_rs/` | Rust GPU substrate (wgpu) |
| `systems/infinite_map_rs/src/synthetic_vram.rs` | CPU-side Glyph VM emulator |
| `systems/infinite_map_rs/src/gpu/shaders/` | WGSL shaders (glyph microcode) |
| `systems/glyph_stratum/programs/` | Legacy `.glyph` programs |
| `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/` | **ASCII cartridge examples** |
| `systems/pixel_compiler/` | Python pixel compiler & tools |
| `kernel/` | Bare-metal boot kernel |
| `docs/` | Architecture docs & manifesto |

# Geometry OS — Agent Instructions

> **Universal agent configuration.** Read by Pi (`AGENTS.md`), Claude (`CLAUDE.md` fallback), Gemini, Cursor, and any tool following the open `AGENTS.md` standard.

## What Is Geometry OS?

Geometry OS is a **GPU-sovereign operating system** where programs are spatial structures living in a Hilbert-mapped GPU substrate. The program IS the machine — there is no separation between code and display. Every pixel is simultaneously data, instruction, and visualization.

**Language:** Rust (primary), WGSL (shaders), Python (tooling)
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

**Test:** `cargo test --test self_replication_test -- --ignored --nocapture`

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
3. **Simulation & Verification:**
   - Test in Python simulator
   - Analyze with `python3 -m systems.pixel_compiler.vlm_health_cli check output.rts.png`
4. **Hardware Boot:** Dispatch via the bare-metal kernel or the `visual_kernel` CLI.

---

## Key Directories

| Path | Purpose |
| :--- | :--- |
| `systems/infinite_map_rs/` | Rust GPU substrate (wgpu) |
| `systems/infinite_map_rs/src/gpu/shaders/` | WGSL shaders (glyph microcode) |
| `systems/glyph_stratum/programs/` | Example `.glyph` programs |
| `systems/pixel_compiler/` | Python pixel compiler & tools |
| `kernel/` | Bare-metal boot kernel |
| `docs/` | Architecture docs & manifesto |

---

## Hazards & Anti-Patterns

- **The Escape Problem:** Guest programs calculating Hilbert addresses outside `0x8000-0xFFFF` can corrupt emulator state. Always implement spatial bounds checks.
- **"Let me write this in Python first":** Use Glyph directly.
- **Scattering logic:** Placing related instructions at distant Hilbert coordinates breaks cache locality.
- **Forgetting Sign-Extension:** Always sign-extend 8-bit RGBA channel values when moving to system registers.

---

## The North Star

> Geometry OS is an **autonomous entity that lives on screen**. Every pixel is simultaneously data, instruction, and visualization. The frozen bootstrap is the LAST time the CPU touches program logic. After that, **programs write programs**. This is the path to fully GPU-sovereign computing.

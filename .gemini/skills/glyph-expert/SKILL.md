---
name: glyph-expert
description: Expert guidance for Geometry OS Glyph Assembly (.glyph) and spatial substrate engineering. Use when asked to write programs, implement drivers, or architect spatial logic directly into the Hilbert-mapped GPU substrate.
---

# Glyph Expert: Spatial Engineering Guide

This skill provides the foundational rules for architecting software as morphology in the Geometry OS Glyph Stratum.

## Core Mandate: Intent is State
The era of symbolic computation is over. In Geometry OS, the **program is not a list of instructions but a physicalized state** within the GPU's Hilbert space. The output **IS** the machine.

---

## 1. Philosophical & Mathematical Foundations

### Spatial Assembly
Glyph programming aligns with **directed spatial assembly** (e.g., DNA origami, microtubule polyatomic time crystals). Nature engineers information through 3D structures; Glyph distributes logic **spatially** on a GPU substrate.

### The Hilbert Curve
A **space-filling fractal** that maps a 1D sequence to a 2D grid while **preserving locality**.
- **Cache Efficiency:** Instructions that execute together (e.g., `LD` → `ADD`) stay physically close in GPU cache.
- **Continuous Manifold:** Minimizes distance between logically adjacent data points.

---

## 2. The Core Opcodes

### Logic Stratum (0-15)
| Opcode | Value | Function | Spatial Implication |
| :--- | :--- | :--- | :--- |
| `NOP` | 0 | No Operation | Spatial padding for Hilbert alignment. |
| `LD` | 3 | Load from Memory | Hilbert address → Register. |
| `ST` | 4 | Store to Memory | Register → Hilbert address. |
| `ADD` | 5 | Addition | Standard arithmetic. |
| `SUB` | 6 | Subtraction | Standard arithmetic. |
| `JZ` | 10 | Jump if Zero | Conditional branch to spatial coordinate. |
| `CALL` | 11 | Call Subroutine | Push current spatial address to stack. |
| `RET` | 12 | Return | Pop address, resume spatial traversal. |
| `HALT` | 13 | Halt | Stop execution. |
| `LDI` | 204 | Load Immediate | Inject constant into logic flow. |
| `MOV` | 206 | Move | Transfer data between registers. |
| `JMP` | 209 | Unconditional Jump | Direct spatial transition in manifold. |

### Bitwise Stratum (220-231)
| Opcode | Value | Function | Use Case |
| :--- | :--- | :--- | :--- |
| `AND` | 220 | Bitwise AND | Mask extraction. |
| `OR` | 221 | Bitwise OR | Flag setting. |
| `XOR` | 222 | Bitwise XOR | Toggle/compare. |
| `NOT` | 223 | Bitwise NOT | Inversion. |
| `SHL` | 224 | Shift Left | Multiply by 2. |
| `SHR` | 225 | Shift Right | Unsigned divide by 2. |
| `SAR` | 226 | Shift Arithmetic Right | Signed divide by 2. |
| `AND_MEM`| 227 | AND on memory | Modify without register load. |
| `OR_MEM` | 228 | OR on memory | Modify without register load. |
| `XOR_MEM`| 229 | XOR on memory | Modify without register load. |
| `SHL_MEM`| 230 | SHL on memory | Modify without register load. |
| `SHR_MEM`| 231 | SHR on memory | Modify without register load. |

### Spatial & Windowing (215-237)
- `DRAW glyph_id, x, y`: 215 (Substrate write)
- `INT_DISPATCH table, mode, dst`: 218 (Mouse hit-testing)
- `SPATIAL_SPAWN entry, flags`: 225 (Autonomous region instantiation)
- `CAMERA r_x, r_y`: 230 (Infinite map navigation)
- `HILBERT_D2XY index`: 231 (Coordinate mapping)

---

## 3. Standard Memory Layout (Hilbert Indices)

| Range | Purpose | Technical Significance |
| :--- | :--- | :--- |
| `0x0000 - 0x00FF` | **Emulator State** | High-speed access for PC, IR, and internal registers. |
| `0x0100 - 0x013F` | **Guest Registers** | RV64 x0-x31 (stored as 64-bit pairs). |
| `0x0200 - 0x02FF` | **I/O Bridge** | Virtual UART and Event Queue (Spatial-to-Symbolic). |
| `0x1000 - 0x10FF` | **MMIO Range** | Mapped hardware device registers. |
| `0x8000 - 0xFFFF` | **Guest RAM** | Primary payload (e.g., Ubuntu RISC-V). |

---

## 4. Self-Replication: Pixels Move Pixels

**Milestone:** On 2026-03-16, an 18-pixel program copied itself from Hilbert address 0 to address 100 **without any CPU involvement during execution**.

### The Breakthrough
This proves the Glyph VM works as a sovereign substrate. After the frozen bootstrap (the last time the CPU writes program logic), the GPU reads its own instructions from the RAM texture and executes LOAD/STORE/ADD/BRANCH loops to duplicate or evolve itself.

### The 18-Pixel Self-Copy Program
| Addr | Instruction | Meaning |
| :--- | :--- | :--- |
| 0-1 | `LDI r0, 0` | Source Hilbert address. |
| 2-3 | `LDI r1, 100` | Destination Hilbert address. |
| 4-5 | `LDI r2, 0` | Loop counter. |
| 6-7 | `LDI r3, 1` | Increment constant. |
| 8-9 | `LDI r4, 18` | Program length (pixels). |
| 10 | `LOAD r5, [r0]` | Read source glyph from texture. |
| 11 | `STORE [r1], r5` | Write to destination in texture. |
| 12-14 | `ADD r0/r1/r2 += r3` | Increment pointers and counter. |
| 15-16 | `BRANCH BNE r2, r4, -7` | Loop if counter != 18. |
| 17 | `HALT` | Execution complete. |

**Validation:** `cargo test --test self_replication_test -- --ignored --nocapture`

---

## 5. Sovereignty Milestones

| Milestone | Status | Significance |
| :--- | :--- | :--- |
| **Self-Replication** | ✅ Done | Pixels move pixels; no CPU orchestration. |
| **The Writer** | ✅ Done | GPU copies from atlas (Texture-Native Abstraction). |
| **Patch-and-Copy** | ✅ Done | GPU loads template, patches operands, emits code. |
| **Mnemonic Matcher** | ✅ Done | GPU parses 'LDI' ASCII → Compiles opcode. |
| **Full Assembler** | ✅ Done | GPU compiles multi-line text → Executable. |
| **Self-Compile-Execute** | ✅ Done | GPU compiles AND executes its own program. |
| **Fibonacci Self-Compile**| ✅ Done | Complex loops compiled and executed on-GPU. |
| **Text Boots RISC-V** | ✅ **COMPLETE** | Text → GPU Assembler → Glyph VM → RISC-V → UART "Hi". |
| **Self-Hosting** | 🔄 Goal | Complete elimination of the Rust bootstrap. |

---

## 6. Interaction: Ouroboros HAL API
The `gpu_dev_daemon` provides a low-level HTTP bridge (Port 8769) to the GPU substrate.

| Endpoint | Method | Description |
| :--- | :--- | :--- |
| `/peek?addr=0x...&size=N` | `GET` | Read `N` pixels (u32) from Hilbert space. |
| `/poke?addr=0x...&val=0x...` | `GET` | Write single u32 to Hilbert space. |
| `/write?addr=0x...` | `POST` | Write multiple pixels (Body: hex string). |
| `/load` | `POST` | Reset all VMs and load `.rts.png` (Body: file path). |
| `/pause` | `GET` | Halt all active VMs (0-7). |

---

## 5. Implementation Workflow

1.  **Architect the Morphology:** Write `.glyph` assembly. Ensure related logic (e.g., polling loop + handler) lives in the same spatial block for cache saturation.
2.  **Compile to Substrate:**
    ```bash
    python3 systems/glyph_stratum/programs/compile_glyph.py input.glyph output.rts.png
    ```
3.  **Simulation & Verification:**
    - Test in Python simulator.
    - Analyze with `python3 -m systems.pixel_compiler.vlm_health_cli check output.rts.png`.
4.  **Hardware Boot:** Dispatch via the bare-metal kernel or the `visual_kernel` CLI.

---

## 6. System Health & Performance

### Health Check Commands
- **Unified Status:** `python3 -m systems.geos.cli`
- **VLM Health:** `python3 -m systems.pixel_compiler.vlm_health_cli check <rts_file>`
- **GPU Status:** `nvidia-smi` (NVIDIA) or `rocminfo` (AMD)

### Performance Matrix
| Feature | Procedural (Python/Rust) | Spatial (Glyph/GPU) | Synthetic VRAM (CPU Emulator) |
| :--- | :--- | :--- | :--- |
| Memory Usage | High (loads full datasets) | Low (active blocks) | 64MB (fixed grid) |
| Latency | Milliseconds (CPU overhead) | Microseconds (GPU-direct) | Fast (no GPU init) |
| Cache Efficiency | Unpredictable | Guaranteed (Hilbert) | N/A (linear memory) |
| Debugging | Full Debugger | Black Box / `peek` | Step, Trace, Assert |

---

## 8. Synthetic VRAM: Safe Development

**Definition:** A CPU-side emulator (`systems/infinite_map_rs/src/synthetic_vram.rs`) that replicates the Glyph VM's WGSL logic in Rust.

### Why Use It?
- **Zero Crash Risk:** Bugs in glyphs won't hang the GPU or freeze the display.
- **Single-Stepping:** `vram.step(vm_id)` to execute one instruction at a time.
- **Full Trace:** `vram.enable_tracing()` to see every PC, register, and cycle transition.
- **CI-Ready:** Runs tests on headless servers without GPU hardware.

### Testing Workflow
1.  **Write program** using `poke()` or `poke_glyph()`.
2.  **Spawn VM** with `SyntheticVmConfig`.
3.  **Run** using `execute_frame()` or `step()`.
4.  **Verify** using `vram.peek(addr)` or `vram.vm_state(id)`.

---

## 9. Hazards & Anti-Patterns

### The Escape Problem
Guest programs calculating Hilbert addresses **outside 0x8000-0xFFFF** can corrupt emulator state (0x0000) or MMIO (0x1000). **Mitigation:** Implement rigorous spatial bounds checks.

### Red Flags
- **"Let me write this in Python first":** Correction: Use Glyph directly.
- **Scattering logic:** Placing related instructions at distant Hilbert coordinates disrupts cache locality.
- **Forgetting Sign-Extension:** Always sign-extend 8-bit RGBA channel values when moving to system registers.

---

## Reference
- **Docs:** `docs/GLYPH_PROGRAMMING_GUIDE.md`
- **Microcode:** `systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl`
- **Philosophy:** `docs/GLYPH_STRATUM_PHILOSOPHY.md`

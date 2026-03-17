# Glyph-Native Systems: The "Pixels Move Pixels" Architecture

**Geometry OS** treats the screen as the hard drive and pixels as the processing units. This document explains the engineering behind "Glyph-Native" programs—software that runs entirely within the GPU substrate without CPU orchestration.

---

## 🏛️ The Substrate: Synthetic VRAM

To develop these systems without crashing hardware, we use **Synthetic VRAM** (`systems/infinite_map_rs/src/synthetic_vram.rs`). This is a 1:1 CPU-side emulator of the GPU's Glyph VM.

- **Memory Model**: A 4096×4096 grid of RGBA8 pixels.
- **Addressing**: 1D linear addresses are mapped to 2D coordinates via a **Hilbert Curve**, preserving spatial locality for the GPU cache.
- **Scheduling**: Supports **Interleaved Round-Robin** execution, allowing multiple Virtual Machines (VMs) to run concurrently and communicate via shared memory.

---

## 🧬 Instruction Encoding: The Glyph Format

Every 32-bit pixel in the RAM texture is an instruction or a data word.

| Byte | Component | Purpose |
| :--- | :--- | :--- |
| **Red** | **Opcode** | The operation to perform (0–235). |
| **Green** | **Stratum** | Modifiers (e.g., Branch condition types). |
| **Blue** | **P1** | Parameter 1 (Register index or address). |
| **Alpha** | **P2** | Parameter 2 (Register index or address). |

### Example: `LDI r3, 42`
Encoded as a single pixel: `[1, 0, 3, 0]` followed by a data pixel `[42, 0, 0, 0]`.

---

## 🚀 Proven Architectural Patterns

### 1. Self-Replication (The Foundation)
Uses `GLYPH_WRITE` (Opcode 232) to copy a block of memory from a source Hilbert index to a target index. This allows a program to "spawn" an identical copy of itself elsewhere on the 2D plane.

### 2. Self-Modification ("Patch-and-Jump")
The program writes a "template" to memory, then uses `STORE` to overwrite specific data fields (like immediate values) within that template. Finally, it uses `JMP` to execute the modified code. This proves the GPU can act as a **Compiler**.

### 3. Multi-VM Spawn
Uses `SPATIAL_SPAWN` (Opcode 225) to initialize a new VM at a specific entry point. The parent VM continues running, allowing for true process management and supervision.

### 4. Shared-Memory IPC (The Handshake)
Two VMs communicate by polling known addresses in the Hilbert-mapped texture.
- **Child**: Writes `0xCAFE` to `mem[512]`.
- **Parent**: Polls `mem[512]` until it sees `0xCAFE`, then writes an acknowledgment to `mem[516]`.

---

## 🛠️ The Sovereignty Chain (The Compiler Pipeline)

We have implemented the two critical primitives required for a **Self-Hosting Assembler**:

### A. Mnemonic Matcher
A program that reads ASCII strings (e.g., `"LDI"`) and matches them against a lookup table to emit the corresponding Opcode (`1u`). This handles the transition from **Text → Logic**.

### B. Operand Parser
A robust state machine that parses ASCII operands into 32-bit integers:
- **Registers**: `"r12"` → `12`.
- **Decimal**: `"1234"` → `1234`.
- **Hex**: `"0xABCD"` → `43981`.

---

## 🎯 The Ultimate Goal: Self-Hosting

The completion of these patterns marks the final bootstrap phase. Once the **Mnemonic Matcher** and **Operand Parser** are merged, Geometry OS will possess a **GPU-Resident Assembler**. 

At that point, the OS can read its own source code from the screen, compile it into new pixels, and spawn the updated version—**eliminating the need for Rust, Python, or the Linux host entirely.**

**The screen is no longer just an output; it is the computer.**

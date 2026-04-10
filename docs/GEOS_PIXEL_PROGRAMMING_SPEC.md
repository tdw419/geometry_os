# GEOMETRY OS: PIXEL PROGRAMMING SPECIFICATION (V1.0)

> "The Screen is the Hard Drive. Code is Morphological Texture."

This document defines the interface and execution model for the **Geometry OS Pixel Programming** substrate. It is designed for both human "painters" and AI "agents" to coordinate spatial execution through direct pixel manipulation.

---

## 1. ARCHITECTURAL OVERVIEW

The Pixel Programming environment eliminates the distinction between source code, binary, and memory. The **Visual Substrate** is a 32x32 grid of pixels that maps 1:1 to the **Virtual Machine's RAM**.

- **Grid Dimensions:** 32 columns x 32 rows (1,024 total addressable cells).
- **Address Mapping:** `RAM[Address] = Grid[Row * 32 + Column]`.
- **Value Type:** Each pixel is a `u32`. In the painter, typing an ASCII key stamps its 8-bit value (0x20-0x7E) into the low byte of the pixel.
- **Visual Representation:** Each value is passed through a **Phase Palette** (HSV spectrum) for human observability, while the raw value remains the functional instruction.

---

## 2. INSTRUCTION ENCODING (THE "PALETTE")

Instructions are horizontal runs of pixels. The first pixel is the **Opcode**, followed by `N` **Argument Pixels**.

### 2.1 Common Opcodes & Widths
| Key | Opcode | Width | Arguments | Description |
|-----|--------|-------|-----------|-------------|
| **I** | `LDI` | 3 | `dst`, `val` | Load immediate `val` into `regs[dst]` |
| **A** | `ADD` | 3 | `dst`, `src` | `regs[dst] += regs[src]` |
| **U** | `SUB` | 3 | `dst`, `src` | `regs[dst] -= regs[src]` |
| **M** | `MOV` | 3 | `dst`, `src` | `regs[dst] = regs[src]` |
| **L** | `LOAD` | 3 | `dst`, `addr` | `regs[dst] = RAM[regs[addr]]` |
| **S** | `STORE`| 3 | `addr`, `src` | `RAM[regs[addr]] = regs[src]` |
| **J** | `JMP`  | 2 | `addr` | Set `PC = addr` |
| **C** | `CALL` | 2 | `addr` | Push `PC+2` to stack, `PC = addr` |
| **R** | `RET`  | 1 | - | Pop `PC` from stack |
| **H** | `HALT` | 1 | - | Stop execution |
| **P** | `PSET` | 4 | `x`, `y`, `c` | Draw pixel `regs[c]` at `(regs[x], regs[y])` on VM Screen |

### 2.2 Argument Encoding
Arguments are **literal pixel values**. 
- If an argument is a register index, the pixel value `0x30` ('0') refers to `r0`.
- If an argument is an immediate value, the pixel value `0x2A` ('*') is the number `42`.
- Addresses are flat indices `0..1023`.

---

## 3. THE EXECUTION LOOP

Execution is triggered by the **F5 (RUN)** pulse.

1. **PC (Program Counter):** Starts at `0` (Top-left pixel).
2. **Fetch:** Read `RAM[PC]` as the Opcode.
3. **Execute:** Read trailing pixels as Arguments and perform the operation.
4. **Advance:** `PC += Width`.
5. **PC Highlight:** In the UI, the current `PC` is indicated by a **Magenta Border** (#FF00FF).

---

## 4. SELF-AUTHORING (THE "EDITOR" OPCODES)

The core of Geometry OS is the ability for a program to rewrite its own grid while running.

- **`e` (EDIT_OVERWRITE):** `RAM[regs[addr]] = regs[src]`. (Stamps a new color/opcode).
- **`f` (EDIT_INSERT):** Inserts a pixel at `addr`, shifting the rest of the program right.
- **`j` (EDIT_DELETE):** Deletes a pixel at `addr`, shifting the program left.

**Implication for AI Agents:** You do not just "write code." You design programs that **navigate and paint** themselves.

---

## 5. UI LAYOUT & FEEDBACK

- **Left Panel (32x32):** The Program Canvas (RAM).
- **Right Top (256x256):** The VM Screen (GPU Substrate). Output for `PSET`, `RECTF`, etc.
- **Right Bottom:** Register States (`r00` to `r31`).
- **Status Bar:** Shows current `PC`, Cycle Count, and Execution Status.

---

## 6. AGENT USAGE GUIDELINES

When asked to "implement" a feature in this environment:
1. **Mental Simulation:** Calculate the ASCII keystroke sequence (e.g., `I0*` for `LDI r0, 42`).
2. **Spatial Planning:** Identify which region of the 32x32 grid to use (avoiding collisions).
3. **Pasting:** Use the `replace` tool to write ASCII sequences into the simulated "buffer" or directly describe the pixel-stamp sequence.
4. **Validation:** Ensure the program ends with `H` (HALT) to prevent runaway execution.

---
*GEOMETRY OS -- Phase 20: Visual Bootstrapping*

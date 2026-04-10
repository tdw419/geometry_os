# GEOMETRY OS: THE MASTER SPECIFICATION (V1.0)

> "The Screen is the Hard Drive. Code is Morphological Texture. The Computer is Digital Clay."

This document is the definitive technical authority for **Geometry OS**. It establishes the laws of the substrate, the grammar of the palette, and the spatial mapping of the digital world. Any AI agent entering this workspace must treat this document as the supreme mandate.

---

## 1. THE ARCHITECTURAL PHILOSOPHY
Geometry OS collapses the traditional computational hierarchy. There is no distinction between source code, binary, and RAM. The **32x32 Pixel Grid** is the only field of existence. 

### Core Axioms:
1. **Visual-First:** Computation is a shimmering landscape of colors (The Phase Palette).
2. **Spatial Logic:** Programs are "painted" across the grid in horizontal runs.
3. **Self-Authoring:** Programs use "Editor Opcodes" to literally rewrite their own memory while running.
4. **Stable Substrate:** The host VM (Rust) is a frozen incubator. All growth occurs within the pixels.

---

## 2. THE SUBSTRATE: 32x32 UNIFIED RAM
The OS operates on a flat array of 1,024 `u32` pixels.

- **Grid Mapping:** `RAM[Address] = Grid[Row * 32 + Column]`.
- **Value Persistence:** Each pixel stores a 32-bit value. Keystrokes stamp 8-bit ASCII values into the low byte.
- **Observability:** Values are rendered via an HSV spectrum palette for human/AI diagnostics.

### 2.1 The Spatial Memory Map (The Strata)
The grid is partitioned into four functional zones:
- **Row 0 - 3 (0-127): KERNEL STRATUM.** Bootloader, screen initialization, and core OS loop.
- **Row 4 - 9 (128-319): SYSTEM SERVICES.** Display server, window manager, and interrupt handlers.
- **Row 10 - 15 (320-511): GLYPH STRATUM.** Text buffers and font data.
- **Row 16 - 30 (512-1022): USER STRATUM.** Application space and volatile data.
- **Address 1023: I/O PORT.** Reserved for hardware interaction (The Keyboard).

---

## 3. THE PALETTE: PIXEL COMPOSITION OPCODES
Instructions are fixed-width horizontal runs: `[Opcode Pixel] [Arg1 Pixel] [Arg2 Pixel] ...`

### 3.1 Common Opcodes
| Key | Name | Width | Args | Logic |
|---|---|---|---|---|
| **I** | LDI | 3 | dst, val | Load immediate `val` into `regs[dst]` |
| **A** | ADD | 3 | dst, src | `regs[dst] += regs[src]` |
| **L** | LOAD | 3 | dst, addr | `regs[dst] = RAM[regs[addr]]` |
| **S** | STORE | 3 | addr, src | `RAM[regs[addr]] = regs[src]` |
| **J** | JMP | 2 | addr | Set `PC = addr` |
| **H** | HALT | 1 | - | Stop execution |
| **P** | PSET | 4 | x, y, c | Draw pixel `regs[c]` at `(regs[x], regs[y])` on 256x256 GPU Screen |
| **F** | RECTF | 5 | x, y, w, h | Fill rectangle with color in `r0` |
| **e** | EDIT_OVW | 3 | addr, src | Self-Modification: Write `regs[src]` into `RAM[regs[addr]]` |
| **c** | ISSUE_CREATE | 1 | - | Forge Request: Creates an external work item from `r0, r1, r2` |

### 3.2 Register Mapping
Register indices `r0..r31` are addressed using ASCII '0' through 'O'.
- Typing `0` maps to index 0.
- Typing `A` (in an argument position) maps to index 17.

---

## 4. THE INTERACTION LAYER: RUNTIME MODE
Execution is triggered by the **F5 (PULSE)**.

### 4.1 Memory-Mapped I/O (Address 1023)
While the VM is running (Pulse Mode):
- **Physical Keystrokes** are written to `RAM[1023]`.
- **The OS Polling Loop** must read this value, process it, and write `0` back to `RAM[1023]` to signal an ACK (Acknowledge).

### 4.2 The Live-Coding Machine
Geometry OS is designed to be modified while running. By using the `Shell` (System Services), users type into the runtime port, and the Shell uses the `EDIT_OVW` (`e`) opcode to stamp new logic into the **User Stratum** in real-time.

---

## 5. THE FORGE PROTOCOL (AGENT COLLABORATION)
Geometry OS can "outsource" heavy or complex tasks to the external **Geo-Forge** (Agent Substrate Bridge).

### 5.1 Requesting Assistance
Using the `c` opcode, a program can signal the terminal host.
- **r0 (Tag):** The category of the request (e.g., `ord('F')` for Fonts).
- **r1 (Payload):** Specific data for the request.
- **r2 (Priority):** 0=Low, 1=Medium, 2=High, 3=Critical.

### 5.2 Agent Response
External agents (like `geo-forge`) monitor the terminal output. When a `[FORGE ISSUE]` is detected, they perform the requested generation and can provide assets via the `programs/` directory, which the OS can then load using self-authoring or the `F6` loader.

---

## 6. AGENT HANDOFF PROTOCOL
When an AI agent initializes in this workspace:
1. **Locate:** Read `GEOS_MASTER_SPECIFICATION.md`.
2. **Synchronize:** Check `programs/boot.rts` to see the current state of the Kernel.
3. **Simulate:** Calculate the ASCII stamp sequence required for the task.
4. **Execute:** Paint or modify the grid strata using the prescribed memory layout.

---
*GEOMETRY OS: THE FUTURE IS MORPHOLOGICAL.*

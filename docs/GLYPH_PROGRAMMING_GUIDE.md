# Glyph Programming Guide

## The Philosophy: "The Screen is the Hard Drive. The Font is the CPU."

Geometry OS introduces a fundamentally different approach to programming. Instead of writing symbolic code (Python, Rust, C) that gets compiled into opaque binaries, we program directly in **spatial assembly** where every instruction is a pixel on the GPU substrate.

---

## 1. What is a Glyph?

A **Glyph** is a single instruction encoded as an RGBA pixel:

| Channel | Purpose | Example |
|---------|---------|---------|
| **R (Red)** | Opcode (the "what") | `0xD0` = 208 = JMP |
| **G (Green)** | Stratum (the "where") | 0 = Substrate, 1 = Logic |
| **B (Blue)** | Parameter 1 | Destination register |
| **A (Alpha)** | Parameter 2 | Source/Immediate value |

A `.glyph` file is a **texture** where the program lives as a 2D image mapped via the **Hilbert Curve**.

---

## 2. The Memory Layout (Hilbert Space)

All memory in Geometry OS is addressed spatially via Hilbert curve indices:

```
┌─────────────────────────────────────────────────────┐
│ Address Range    │ Purpose                         │
├─────────────────────────────────────────────────────┤
│ 0x0000 - 0x00FF  │ Emulator State (PC, IR, temps)  │
│ 0x0100 - 0x013F  │ Guest Registers x0-x31 (64-bit) │
│ 0x0200 - 0x02FF  │ I/O Bridge (UART, Events)       │
│ 0x1000 - 0x10FF  │ MMIO Range (Device Registers)   │
│ 0x8000 - 0xFFFF  │ Guest RAM (RISC-V binary)       │
└─────────────────────────────────────────────────────┘
```

**Why Hilbert?** The curve preserves spatial locality - instructions that execute together live near each other in 2D space, optimizing GPU cache coherence.

---

## 3. The Opcode Map

### Logic Stratum (Core Operations)

| Opcode | Mnemonic | Description |
|--------|----------|-------------|
| 0 | NOP | No operation |
| 3 | LD | Load from memory |
| 4 | ST | Store to memory |
| 5 | ADD | Add |
| 6 | SUB | Subtract |
| 10 | JZ | Jump if zero |
| 11 | CALL | Call subroutine |
| 12 | RET | Return from subroutine |
| 13 | HALT | Stop execution |
| 204 | LDI | Load immediate |
| 205 | ST | Store |
| 206 | MOV | Move |
| 209 | JMP | Unconditional jump |
| 214 | CMP | Compare |
| 215 | DRAW | Render glyph |

### Bitwise Stratum (220-231) - For RISC-V Emulation

| Opcode | Mnemonic | Description |
|--------|----------|-------------|
| 220 | AND | Bitwise AND with immediate |
| 221 | OR | Bitwise OR with immediate |
| 222 | XOR | Bitwise XOR with immediate |
| 223 | NOT | Bitwise NOT |
| 224 | SHL | Shift left |
| 225 | SHR | Shift right (logical) |
| 226 | SAR | Shift right (arithmetic) |
| 227-231 | *_MEM | Memory-variant bitwise ops |

---

## 4. Writing a Glyph Program

### Example: Simple Counter

```assembly
// counter.glyph - A simple counter that increments forever

:boot
    MOV r1, 0          // Initialize counter to 0

:loop
    ADD r1, 1          // Increment counter
    ST r1, 0x0200      // Store to output buffer
    JMP loop           // Loop forever
```

### Example: UART Driver (Polling Pattern)

```assembly
// uart.glyph - Write a character to UART

.equ UART_THR 0x1000    // Transmit Holding Register
.equ UART_LSR 0x1005    // Line Status Register

:uart_putc
    // Wait for transmitter ready (bit 5 of LSR)
    LOAD r2, UART_LSR
    AND r2, 0x20        // Mask THRE bit
    JZ uart_putc        // Loop until ready

    STORE UART_THR, r1  // Write character
    RET
```

---

## 5. The RISC-V Emulator

The `qemu_riscv.glyph` file is a **Glyph-Native RISC-V CPU emulator** written entirely in Glyph assembly. It demonstrates how to build complex systems using only spatial instructions.

### How It Works

```
┌─────────────────────────────────────────────────────────────┐
│                    EMULATOR ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│   │   FETCH     │───▶│   DECODE    │───▶│   EXECUTE   │     │
│   │  (0x8000)   │    │  (bitwise)  │    │  (ALU/MEM)  │     │
│   └─────────────┘    └─────────────┘    └─────────────┘     │
│          │                                      │            │
│          ▼                                      ▼            │
│   ┌─────────────┐                       ┌─────────────┐     │
│   │  Guest RAM  │                       │   UART      │     │
│   │  (Ubuntu)   │                       │   MMIO      │     │
│   └─────────────┘                       └─────────────┘     │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

### Key Implementation: Opcode Decoding

```assembly
:decode
    LD r102, r101        // Load instruction register
    AND r102, 0x7F       // Extract opcode (lowest 7 bits)

    CMP r102, 0x33       // OP-REG?
    JZ handle_op_reg
    CMP r102, 0x13       // OP-IMM?
    JZ handle_op_imm
    CMP r102, 0x03       // LOAD?
    JZ handle_load
    CMP r102, 0x23       // STORE?
    JZ handle_store
    // ... more opcodes
```

### Key Implementation: MMIO Bridging

When the guest RISC-V program writes to UART address (0x1000), the emulator routes it to the Glyph substrate:

```assembly
:handle_store
    // ... calculate address in r2 ...

    CMP r2, 0x1000       // UART MMIO check
    JE handle_uart_tx_store

    // Normal RAM store
    STORE r2, r21
    JMP fetch

:handle_uart_tx_store
    ST r21, 0x0200       // Bridge to Glyph UART buffer
    JMP fetch
```

---

## 6. Compilation Workflow

### Step 1: Write Assembly

Create a `.glyph` file with your spatial assembly code.

### Step 2: Compile to Texture

```bash
python3 systems/glyph_stratum/programs/compile_glyph.py input.glyph output.rts.png
```

This converts your assembly into a PNG texture where each pixel is an instruction.

### Step 3: Load and Execute

**Option A: Visual Kernel (Linux)**
```bash
cargo run --release --bin visual_kernel -- --glyph output.rts.png
```

**Option B: Bare Metal (UEFI)**
Copy the `.rts.png` to the EFI partition alongside the bootloader.

---

## 7. Why Glyph-Native is Better for AI

### Zero Abstraction
Traditional: AI → Python → Compiler → Opaque Binary → CPU
Glyph-Native: AI → Spatial Assembly → Texture → GPU

The AI's output IS the machine state. No black-box compiler in between.

### Spatial Coherence
The AI can "see" the program as a 2D structure. Distance in Hilbert space correlates to execution locality. This aligns with the AI's internal attention mechanisms.

### Evolutionary Readiness
Glyphs are atomic tokens. The Evolution Daemon can mutate, swap, or optimize programs by simply painting on the texture. No fragile binary format to break.

---

## 8. The Boot Chain

```
UEFI Firmware
     │
     ▼
geometry_os.bootloader (EFI executable)
     │
     ├─ Load qemu_riscv.rts.png (Emulator)
     ├─ Load ubuntu_native.rts.png (Guest OS)
     ├─ Load AMD firmware textures
     │
     ▼
geometry_os.kernel (Bare metal)
     │
     ├─ Initialize AMDGPU via MMIO
     ├─ Copy Emulator to GPU VRAM (offset 0x0000)
     ├─ Copy Guest OS to GPU VRAM (offset 0x8000)
     │
     ▼
GPU Dispatch
     │
     └─ Glyph VM executes RISC-V emulator
        which executes Ubuntu kernel
```

---

## 9. Testing Your Programs

### Simulation (Python)

Before running on GPU, test in the Python simulator:

```bash
python3 systems/glyph_stratum/programs/test_riscv_emulator.py
```

### Expected Output

```
=== Starting RISC-V Emulator Simulation ===

  PC=0x8000  IR=0x000010B7  OP=0x37
    LUI x1, 0x1  ->  x1=0x1000
  PC=0x8001  IR=0x04700113  OP=0x13
    ADDI x2, x0, 71  ->  x2=0x47
  PC=0x8002  IR=0x0020A023  OP=0x23
    SW x2, 0(x1)  ->  UART OUT: 'G' (71)
  ...

=== Simulation Complete ===
UART output: GEOS

✓ SUCCESS: Output matches expected 'GEOS'
```

---

## 10. Live-Coding with Ouroboros Daemon

The **Ouroboros Daemon** is a persistent GPU environment that enables hot-swapping of programs during development. It runs continuously and accepts new code via HTTP API.

### Starting the Daemon

```bash
cargo run --release --bin gpu_dev_daemon
```

The daemon runs at 60 FPS and listens on `http://127.0.0.1:8769`.

### Hot-Swapping Glyphs

Load a compiled glyph image:

```bash
curl -X POST "http://127.0.0.1:8769/load" -d "/path/to/program.rts.png"
```

### Hot-Swapping Raw RISC-V Binaries

Load a raw binary at guest RAM offset (0x8000):

```bash
# First load the emulator
curl -X POST "http://127.0.0.1:8769/load" -d "systems/glyph_stratum/programs/qemu_riscv.rts.png"

# Then inject your RISC-V binary
curl -X POST "http://127.0.0.1:8769/load?binary=0x8000" -d "/tmp/hello_geos.riscv.bin"
```

The binary is automatically:
1. Converted to RGBA pixels (4 bytes per pixel)
2. Mapped to Hilbert space at the specified offset
3. Injected into live GPU memory
4. VM is reset to execute from the entry point

### The Live-Coding Loop

1. Write/modify your `.glyph` or RISC-V assembly
2. Compile: `python3 compile_glyph.py program.glyph`
3. Hot-swap: `curl -X POST ...`
4. Observe output in real-time
5. Iterate

No reboot. No reload. The GPU substrate is alive.

---

## 11. Resources

- **Opcode Reference**: `systems/infinite_map_rs/src/gpu/shaders/glyph_microcode.wgsl`
- **Compiler**: `systems/glyph_stratum/programs/compile_glyph.py`
- **Example Programs**: `systems/glyph_stratum/programs/*.glyph`
- **Philosophy**: `docs/GLYPH_STRATUM_PHILOSOPHY.md`
- **Ouroboros Daemon**: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

---

*"We have moved from 'telling the computer what to do' to 'being the computer.'"*

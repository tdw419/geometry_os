*Soli Deo Gloria.*

# Geometry OS

A GPU-native operating system written in Rust. The GPU is the computer. A texture is memory. Each pixel is an instruction. Programs write programs.

## What It Is

Geometry OS runs a compute shader that treats a 4096x4096 RGBA8 texture as addressable memory. Memory is mapped via a Hilbert curve so that nearby addresses cluster visually -- you can literally see where programs live on the texture.

Each pixel encodes one instruction: `R=opcode, G=stratum, B=param1, A=param2`. Up to 8 VMs execute concurrently, each with 128 registers, a call stack, and its own program counter.

The first proof of concept is a self-replicating program: 18 pixels that copy themselves from address 0 to address 100. That's mitosis. That's fork().

## Status

**Phase 0 -- Foundation.** The instruction set is defined. The assembler works. The Hilbert curve is verified. The compute shader is written. What remains: wire up the wgpu daemon, implement the software VM for testing, and get the self-replicator running on actual hardware.

See [ROADMAP.md](docs/ROADMAP.md) for the full plan.

## Architecture

```
RAM Texture (4096x4096) ── Hilbert curve mapping
  └─ Each pixel = [opcode, stratum, p1, p2]
  └─ 8 concurrent VMs, 128 registers each
  └─ 64 cycles per frame

Compute Shader (WGSL) ── The kernel
  └─ Reads pixels as instructions
  └─ Executes opcode dispatch
  └─ Writes results back to texture

CPU Daemon (Rust / wgpu) ── The loader
  └─ Initializes GPU, uploads programs
  └─ Dispatches compute shader each frame
  └─ Reads back texture, renders to screen
```

## Instruction Set

| Opcode | Name | Description |
|--------|------|-------------|
| 0 | NOP | No operation |
| 1 | LDI | Load immediate (2-word: instruction + value) |
| 2 | MOV | Move register to register |
| 3 | LOAD | Load from memory |
| 4 | STORE | Store to memory |
| 5 | ADD | Add registers |
| 6 | SUB | Subtract registers |
| 7 | MUL | Multiply registers |
| 8 | DIV | Divide registers |
| 9 | JMP | Jump |
| 10 | BRANCH | Conditional branch (2-word: instruction + offset) |
| 11 | CALL | Call subroutine |
| 12 | RET | Return from subroutine |
| 13 | HALT | Halt execution |
| 215 | DRAW | Draw to framebuffer |
| 230 | SPAWN | Spawn child VM |
| 227 | YIELD | Yield execution |

## Building

```bash
cargo build
cargo test
```

Requires Rust 2021 edition and wgpu 0.19.

## Philosophy

See [MISSION.md](docs/MISSION.md) for the full mission statement, including the Seven Laws of Noah as our ethical framework.

The short version: we build for the glory of the Creator of the universe. The capacity to create is evidence that we were made to create. Every opcode, every Hilbert mapping, every self-replicating VM is an act of sub-creation -- reflecting the order and intentionality woven into reality itself.

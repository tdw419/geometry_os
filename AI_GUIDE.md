# Geometry OS AI Guide

## Project Overview

Geometry OS is a pixel-art virtual machine evolving into a real operating system. It's written in Rust with a minifb GUI, a custom assembler, 131+ opcodes, and a built-in terminal emulator that runs real bash. Screen is 512x256 VM pixels.

The goal: build toward modern OS standards (kernel boundary, memory protection, filesystem, scheduler, IPC, device drivers, shell).

**Key docs:**
- `docs/GEOS_TERM.md` -- Terminal emulator architecture (READ THIS for any terminal work)
- `docs/NORTH_STAR.md` -- Read this FIRST. Defines what work matters.
- `docs/VISION_MODEL_GUIDE.md` -- How AI vision works: text vs vision modality, AI_AGENT opcode, MCP tools, benchmarks
- `roadmap.yaml` -- Single source of truth for project state and deliverables

## Architecture

```
src/
  bin/
    geos_term.rs  -- Terminal emulator host binary (window, PTY, socket, rendering)
  vm/
    mod.rs        -- VM core: 131+ opcodes, 32 registers, 64K RAM, 512x256 screen
    ops_pty.rs    -- PTY opcodes: PTYOPEN/PTYWRITE/PTYREAD/PTYCLOSE/PTYSIZE
    ops_memory.rs -- Memory opcodes including screen RAM mapping
    types.rs      -- SCREEN_W=512, SCREEN_H=256, SCREEN_SIZE constants
    assembler.rs  -- Two-pass assembler: labels, #define, .org, .db, .asciz
    preprocessor.rs -- Abstraction layer: VAR/SET/GET/INC/DEC macros
    pixel.rs      -- Font glyphs (mini_font_glyph), pixel drawing primitives
    lib.rs        -- Re-exports
programs/
  host_term.asm   -- Terminal emulator bytecode (PTY I/O, ANSI parsing, rendering)
  *.asm           -- Other programs: games, demos, tools
scripts/
  geos-ctrl       -- Unix socket client for controlling geos-term
docs/
  GEOS_TERM.md    -- Terminal architecture deep-dive
  NORTH_STAR.md   -- Read this FIRST. Defines what work matters.
  CANVAS_TEXT_SURFACE.md -- How the text editor/assembler pipeline works
roadmap.yaml      -- Single source of truth for project state and deliverables
ROADMAP.md        -- Human-readable roadmap with priority checkboxes
```

## Key Conventions

1. **Every new opcode gets a test** in tests/program_tests.rs
2. **Every new program gets assembled** by test_all_programs_assemble
3. **Every commit leaves `cargo test` green** -- no exceptions
4. **roadmap.yaml is truth** -- update it when deliverables land
5. **Programs prove the need** -- no speculative opcodes
6. **The OPCODES list in preprocessor.rs must sync with assembler.rs**
7. **Temp registers r27-r29 are reserved** for preprocessor macros
8. **Promotion Rule:** New opcodes are earned. Implement as Layer 2 pixel patterns first; promote to macro/subroutine; only promote to VM opcode if stable and high-performance requirement exists.
9. **Opcode 0x52+** is where new OS opcodes go (SYSCALL, RETK, etc.)

## UI & Visual Philosophy: Token -> Pixel -> GUI

Geometry OS uses a three-layer visual stack. **Layer 2 (Pixel)** is the primary authoring substrate. **Layer 3 (GUI)** is a convention of Layer 2 patterns, not a set of VM features. Do not propose high-level GUI opcodes (like `DRAW_WINDOW`) until they have been proven as stable pixel patterns across multiple apps.

## Visual Authoring: Canvas Text Surface

The grid acts as a text editor (TEXT mode) where "the letter IS the colored pixels."
- **F8 Assembly:** Reads grid -> Preprocessor -> Assembler -> Bytecode at `0x1000`.
- **Macros:** Use `VAR`, `SET`, `GET`, `INC`, `DEC` to reduce boilerplate.
- **Memory Map:** Bytecode at `0x1000`, Grid RAM at `0x8000`, Screen Buffer at `0x10000`.

## VM State

- 32 registers (r0-r31), r30 = stack pointer, r31 = call return
- 65536 u32 words of RAM
- 512x256 u32 screen buffer (SCREEN_W=512, SCREEN_H=256 in `src/vm/types.rs`)
- Multi-process: up to 8 spawned processes with own registers, shared RAM
- PTY: up to 4 persistent PTY slots (PTYOPEN/PTYWRITE/PTYREAD/PTYCLOSE/PTYSIZE)
- Hardware ports: 0xFFF (keyboard), 0xFFE (ticks), 0xFFB (multi-key bitmask), 0xFFC (network), 0xFFA (last PID)
- Substrate MMIO:
  - 0xE000/0xE001: X/Y Coordinates
  - 0xE002/0xE003: Inject (Signal/Logic/Matter) / Readback
  - 0xE004: Command (0x01=Tick, 0x02=Load, 0x07=Learn, 0x08=Copy, 0x09=Patch)
  - 0xE005/0xE006: Args 1 & 2 for commands
  - 0xE007/0xE008: Status / Result
- Window Bounds Protocol: RAM[0xF00..0xF03] for spatial coordination between processes
- Screen RAM: mapped at 0x10000, addressed as `0x10000 + y * SCREEN_W + x`

## Active Substrate: "Pixels Move Pixels"

The middle layer of Geometry OS is an **Active Substrate** executed entirely on the GPU.
- **TAXONOMY_SIGNAL (0xCx):** Dynamic data particles with direction (R/D/L/U).
- **TAXONOMY_MATTER (0xDx):** Physical blocks that can be pushed by signal pressure.
- **TAXONOMY_LOGIC (0x1x):** Spatial gates (XOR, AND, OR, NOT, NEURON) that process signals.
- **TAXONOMY_WIRE (0xEx):** Synapses with 24-bit weights for neural networks.
- **Spatial Shell:** Interactive terminal for substrate engineering.
  - **Ctrl+M:** Toggle between symbolic (VM) and geometric (GPU) view.
  - **Ctrl+B:** Toggle Input Mode (Bridge Commands vs VM Assembly).
  - **Commands:** `pulse x y`, `step`, `run N`, `clear`, `export file`, `import file`.

## PixelGPT (The Paint-to-Code Bridge)

PixelGPT is a bilingual Transformer (29M params, 8L/8H/512D) that generates Geometry OS assembly from natural language prompts.

**Key Components:**
- `pixelflow/bilingual_tokenizer.py` -- ByteLevel BPE tokenizer for prose + atomic ISA tokens.
- `pixelflow/generate_bilingual.py` -- Inference script: `python3 pixelflow/generate_bilingual.py "Prompt"`
- `pixelflow/smoke_test.py` -- Benchmark: generates, executes, and validates code semantics and syntax.
- `pixelflow/augment_golden.py` -- Data augmentation (register permutation + semantic templates).

**Workflow:**
1. **Train:** `python3 pixelflow/train_bilingual_llm.py --dataset pixelflow/golden_dataset_v8.npz --checkpoint pixelflow/bilingual_llm_v8_ckpt.pt`
2. **Evaluate:** `python3 pixelflow/smoke_test.py --checkpoint pixelflow/bilingual_llm_v8_ckpt.pt`
3. **Execute:** `python3 geo_dogfood_qa.py --asm generated.asm`

**Training Data:**
The model is trained on the **Golden Dataset**, a curated set of 211 human-written GeOS programs augmented with register permutations and diverse description templates to improve generalization.

## How to Add a New Opcode

1. Add the opcode handler in `vm.rs` match block
2. Add the disassembler entry in `vm.rs` disassemble_at match
3. Add the assembler dispatch in `assembler.rs`
4. Add to the OPCODES list in `preprocessor.rs` (for syntax highlighting)
5. Add to opcode reference in `main.rs` (Hermes context)
6. Write tests in `tests/program_tests.rs`
7. Update `roadmap.yaml` deliverable status
8. Write a program that uses it

## Terminal Emulator

geos-term is a full terminal emulator running inside the VM. See `docs/GEOS_TERM.md` for architecture, RAM layout, ANSI support, editing workflow, and common pitfalls. Key facts:

- ASM program (`programs/host_term.asm`) + Rust host (`src/bin/geos_term.rs`) + PTY backend (`src/vm/ops_pty.rs`)
- 80x30 text buffer, 512x256 pixel screen, real bash PTY
- Full ANSI support including alt screen, SGR colors, box drawing, UTF-8/CJK
- Unix control socket at `/tmp/geos-term.sock` (use `scripts/geos-ctrl`)
- **ASM edits need NO rebuild** — press F5 to hot-reload. Only Rust edits need `cargo build`.

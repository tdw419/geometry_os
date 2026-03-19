# Geometry OS Skill Repository Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a distributable skill repository for Glyph programming that can be installed via Claude Code marketplace, shared across tools (Claude, Gemini, Cursor), and version-controlled independently from the main Geometry OS codebase.

**Architecture:** A standalone Git repository with plugin manifest, cross-tool skill definitions (SKILL.md for Claude, GEMINI.md for Gemini, .cursorrules for Cursor), bundled examples from the existing codebase, and a marketplace.json for distribution. The skill teaches GPU-sovereign programming where ASCII files ARE the program.

**Tech Stack:** Markdown, JSON manifests, Git, Claude Code plugin system

---

## Task 1: Create Repository Structure

**Files:**
- Create: `geometry-os-skill/README.md`
- Create: `geometry-os-skill/.claude-plugin/plugin.json`
- Create: `geometry-os-skill/.claude-plugin/marketplace.json`
- Create: `geometry-os-skill/.gitignore`

**Step 1: Create root directory**

```bash
mkdir -p /home/jericho/zion/projects/geometry-os-skill/.claude-plugin
mkdir -p /home/jericho/zion/projects/geometry-os-skill/skills/glyph-programming/{references,examples,scripts}
mkdir -p /home/jericho/zion/projects/geometry-os-skill/commands
```

**Step 2: Create plugin manifest**

File: `.claude-plugin/plugin.json`

```json
{
  "name": "geometry-os-skill",
  "version": "1.0.0",
  "description": "Glyph programming for GPU-sovereign computing. Spatial assembly, Hilbert curves, and the sovereignty chain.",
  "author": "Geometry OS",
  "skills": ["glyph-programming"],
  "commands": []
}
```

**Step 3: Create marketplace entry**

File: `.claude-plugin/marketplace.json`

```json
{
  "name": "geometry-os-skill",
  "source": {
    "source": "github",
    "repo": "geometry-os/geometry-os-skill"
  },
  "description": "Glyph programming for GPU-sovereign computing. Spatial assembly, Hilbert curves, mailbox protocol, and the sovereignty chain. The ASCII file IS the program.",
  "version": "1.0.0"
}
```

**Step 4: Create .gitignore**

File: `.gitignore`

```
# OS
.DS_Store
Thumbs.db

# IDE
.idea/
.vscode/
*.swp
*.swo

# Build
node_modules/
dist/
```

**Step 5: Verify structure**

Run: `tree /home/jericho/zion/projects/geometry-os-skill -L 3`
Expected: Directory tree with .claude-plugin, skills, commands folders

**Step 6: Commit**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
git init
git add .claude-plugin/ .gitignore
git commit -m "feat: initialize geometry-os-skill repository structure"
```

---

## Task 2: Create Core Skill File

**Files:**
- Create: `skills/glyph-programming/SKILL.md`

**Step 1: Create lean SKILL.md (~2000 words)**

File: `skills/glyph-programming/SKILL.md`

```markdown
---
name: glyph-programming
description: This skill should be used when the user asks to "write a Glyph program", "implement a driver for Geometry OS", "create spatial assembly", "use Hilbert curve addressing", or mentions "GPU substrate", "mailbox protocol", "glyph VM", or wants native Geometry OS code instead of Python/Rust.
---

# Glyph Programming

> **The ASCII file IS the program.** No Rust logic needed.

## Overview

Glyph is the native programming language of Geometry OS. Programs are spatial assemblies where each instruction is an RGBA pixel mapped via the Hilbert curve. The AI writes directly to the GPU substrate.

**Core principle:** Intent is state. The output IS the machine.

## When to Use

- User asks to "write a program" for Geometry OS
- Working with `.glyph` or `.ascii` files
- Building drivers, emulators, or system components
- User mentions "spatial assembly" or "Hilbert curve"
- User wants **native Geometry OS code** instead of Python/Rust

## Quick Start

```glyph
; Loop counter - canonical example
; Location: examples/loop_demo.ascii

:main
LDI r0, 10           ; Loop counter
LDI r1, 0            ; Accumulator

:loop
ADD r1, r1, r1       ; r1 = r1 + 1
SUB r0, r0, 1        ; r0 = r0 - 1
JZ r0, :done         ; Jump if r0 == 0
JMP :loop            ; Repeat

:done
HALT                 ; Stop
```

## Core Opcodes

### Data Movement
| Opcode | Value | Function |
|--------|-------|----------|
| LDI | 204 | Load immediate |
| LOAD | 3 | Load from memory |
| STORE | 4 | Store to memory |
| MOV | 206 | Move between registers |

### Arithmetic
| Opcode | Value | Function |
|--------|-------|----------|
| ADD | 5 | Addition |
| SUB | 6 | Subtraction |
| MUL | 7 | Multiplication |
| DIV | 8 | Division |

### Control Flow
| Opcode | Value | Function |
|--------|-------|----------|
| JMP | 209 | Unconditional jump |
| JZ | 10 | Jump if zero |
| BEQ | 11 | Branch if equal |
| CALL | 12 | Call subroutine |
| RET | 13 | Return |
| HALT | 13 | Halt execution |

### Special
| Opcode | Value | Function |
|--------|-------|----------|
| YIELD | 224 | Cooperative multitasking |
| SPAWN | 225 | Spawn child VM |

## Memory Layout

| Range | Purpose |
|-------|---------|
| 0x0000-0x00FF | Emulator State (PC, IR) |
| 0x0100-0x013F | Guest Registers x0-x31 |
| 0x0200-0x02FF | Mailbox (Events, I/O) |
| 0x1000-0x10FF | State Buffer |
| 0x8000-0xFFFF | Guest RAM |

## Mailbox Protocol

Host writes events to 0x0200:

| Address | Name | Description |
|---------|------|-------------|
| 0x0200 | EVENT_TYPE | 0=none, 1=move, 2=click, 4=scroll |
| 0x0204 | EVENT_X | Mouse X |
| 0x0208 | EVENT_Y | Mouse Y |

VM writes state to 0x1000:

| Address | Name | Description |
|---------|------|-------------|
| 0x1000 | frame_count | Incremented each loop |
| 0x1004 | mouse_x | Current mouse X |
| 0x1008 | mouse_y | Current mouse Y |

## Anti-Patterns (CRITICAL)

| Bad | Good |
|-----|------|
| Writing event parsing in Rust | Writing event parsing in Glyph |
| Creating `*_bridge.rs` modules | Using mailbox addresses directly |
| Adding UI logic to host | UI logic runs on GPU |
| "Let me add a Rust function for..." | "Let me add a Glyph routine for..." |

## Workflow

1. Create `.ascii` or `.glyph` file
2. Compile: `cargo run -p infinite_map_rs --bin geos-compile input.ascii -o output.rts.png`
3. Test on Synthetic VRAM: `cargo test --lib synthetic_vram`
4. Run on GPU: `cargo run -p infinite_map_rs --bin micro_host`

## Additional Resources

### Reference Files
- **`references/opcodes.md`** - Complete opcode table (0-235)
- **`references/memory-layout.md`** - Detailed Hilbert space mapping
- **`references/mailbox-protocol.md`** - Full event/state protocol

### Examples
- **`examples/loop_demo.ascii`** - Loop counter (canonical)
- **`examples/mailbox.ascii`** - Event handler
- **`examples/self_copy.glyph`** - Self-replication

## Philosophy

> Geometry OS is an **autonomous entity that lives on screen**. The frozen bootstrap is the LAST time the CPU touches program logic. After that, **programs write programs**.

See: `references/glyph-native-programming.md` for the full philosophy.
```

**Step 2: Verify word count**

Run: `wc -w /home/jericho/zion/projects/geometry-os-skill/skills/glyph-programming/SKILL.md`
Expected: ~400-600 words (lean for progressive disclosure)

**Step 3: Commit**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
git add skills/glyph-programming/SKILL.md
git commit -m "feat: add glyph-programming skill core file"
```

---

## Task 3: Create Reference Files

**Files:**
- Create: `skills/glyph-programming/references/opcodes.md`
- Create: `skills/glyph-programming/references/memory-layout.md`
- Create: `skills/glyph-programming/references/mailbox-protocol.md`
- Create: `skills/glyph-programming/references/glyph-native-programming.md`

**Step 1: Create opcodes.md**

File: `skills/glyph-programming/references/opcodes.md`

```markdown
# Complete Opcode Table

## Logic Stratum (0-15)

| Opcode | Value | Function | Format |
|--------|-------|----------|--------|
| NOP | 0 | No Operation | NOP |
| LD | 3 | Load from Memory | LD rd, mem[rs] |
| ST | 4 | Store to Memory | ST mem[rd], rs |
| ADD | 5 | Addition | ADD rd, rs, rt |
| SUB | 6 | Subtraction | SUB rd, rs, rt |
| MUL | 7 | Multiplication | MUL rd, rs, rt |
| DIV | 8 | Division | DIV rd, rs, rt |
| JZ | 10 | Jump if Zero | JZ rs, :label |
| CALL | 11 | Call Subroutine | CALL :label |
| RET | 12 | Return | RET |
| HALT | 13 | Halt | HALT |
| LDI | 204 | Load Immediate | LDI rd, imm |
| MOV | 206 | Move | MOV rd, rs |
| JMP | 209 | Unconditional Jump | JMP :label |
| CMP | 214 | Compare | CMP rs, rt |
| DRAW | 215 | Substrate Write | DRAW glyph_id, x, y |

## Bitwise Stratum (220-231)

| Opcode | Value | Function | Use Case |
|--------|-------|----------|----------|
| AND | 220 | Bitwise AND | Mask extraction |
| OR | 221 | Bitwise OR | Flag setting |
| XOR | 222 | Bitwise XOR | Toggle/compare |
| NOT | 223 | Bitwise NOT | Inversion |
| SHL | 224 | Shift Left | Multiply by 2 |
| SHR | 225 | Shift Right | Unsigned divide by 2 |
| SAR | 226 | Shift Arithmetic Right | Signed divide by 2 |
| AND_MEM | 227 | AND on memory | Modify without register load |
| OR_MEM | 228 | OR on memory | Modify without register load |
| XOR_MEM | 229 | XOR on memory | Modify without register load |
| SHL_MEM | 230 | SHL on memory | Modify without register load |
| SHR_MEM | 231 | SHR on memory | Modify without register load |

## Spatial & Windowing (215-237)

| Opcode | Value | Function | Description |
|--------|-------|----------|-------------|
| DRAW | 215 | Substrate write | Direct pixel manipulation |
| INT_DISPATCH | 218 | Mouse hit-testing | Event routing |
| SPATIAL_SPAWN | 225 | Autonomous region | Child VM creation |
| CAMERA | 230 | Infinite map navigation | Viewport control |
| HILBERT_D2XY | 231 | Coordinate mapping | Hilbert conversion |
| YIELD | 224 | Cooperative yield | Task switching |
```

**Step 2: Create memory-layout.md**

File: `skills/glyph-programming/references/memory-layout.md`

```markdown
# Memory Layout (Hilbert Space)

## The Hilbert Curve

A space-filling fractal that maps 1D sequences to 2D coordinates while preserving locality.

**Key property:** Instructions that execute together stay physically close in GPU cache.

## Memory Strata

### Emulator State (0x0000 - 0x00FF)

| Address | Name | Description |
|---------|------|-------------|
| 0x0000 | PC | Program Counter |
| 0x0004 | IR | Instruction Register |
| 0x0008 | FLAGS | Status flags |

### Guest Registers (0x0100 - 0x013F)

| Address | Register | Description |
|---------|----------|-------------|
| 0x0100 | r0 | General purpose |
| 0x0104 | r1 | General purpose |
| ... | ... | ... |
| 0x017C | r31 | General purpose |

### I/O Bridge (0x0200 - 0x02FF)

Host-to-VM communication channel. See mailbox-protocol.md.

### MMIO (0x1000 - 0x10FF)

Memory-mapped I/O for hardware interaction.

### Guest RAM (0x8000 - 0xFFFF)

Primary program and data memory (32KB).
```

**Step 3: Create mailbox-protocol.md**

File: `skills/glyph-programming/references/mailbox-protocol.md`

```markdown
# Mailbox Protocol

Host writes events to 0x0200, VM reads and processes them, then writes state to 0x1000.

## Event Structure (0x0200 - 0x0218)

| Address | Name | Description |
|---------|------|-------------|
| 0x0200 | EVENT_TYPE | 0=none, 1=move, 2=click, 4=scroll |
| 0x0204 | EVENT_X | Mouse X coordinate |
| 0x0208 | EVENT_Y | Mouse Y coordinate |
| 0x020C | EVENT_BTN | Button number (1=left, 2=right) |
| 0x0210 | EVENT_DX | Delta X (for drag/scroll) |
| 0x0214 | EVENT_DY | Delta Y (for scroll) |

## State Buffer (0x1000 - 0x1100)

| Address | Name | Description |
|---------|------|-------------|
| 0x1000 | frame_count | Incremented each loop |
| 0x1004 | mouse_x | Current mouse X |
| 0x1008 | mouse_y | Current mouse Y |
| 0x100C | zoom | Zoom level (100 = 1x) |
| 0x1010 | click_count | Total clicks |

## Event Handler Pattern

```glyph
:main_loop
LDI r1, 0x0200
LOAD r2, mem[r1]     ; Read EVENT_TYPE
LDI r3, 0
BEQ r2, r3, :event_done

LDI r3, 1
SUB r4, r2, r3
LDI r5, 0
BEQ r4, r5, :on_mouse_move

LDI r3, 2
SUB r4, r2, r3
BEQ r4, r5, :on_click
JMP :clear_event

:on_mouse_move
; Handle mouse move...
JMP :clear_event

:on_click
; Handle click...
JMP :clear_event

:clear_event
LDI r0, 0
LDI r1, 0x0200
STORE mem[r1], r0

:event_done
; Continue main loop...
```
```

**Step 4: Copy glyph-native-programming.md from source**

```bash
cp /home/jericho/zion/projects/geometry_os/geometry_os/docs/GLYPH_NATIVE_PROGRAMMING.md \
   /home/jericho/zion/projects/geometry-os-skill/skills/glyph-programming/references/glyph-native-programming.md
```

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
git add skills/glyph-programming/references/
git commit -m "feat: add reference documentation files"
```

---

## Task 4: Copy Example Programs

**Files:**
- Copy: `examples/loop_demo.ascii`
- Copy: `examples/mailbox.ascii`
- Copy: `examples/self_copy.glyph`

**Step 1: Copy loop_demo.ascii**

```bash
cp /home/jericho/zion/projects/geometry_os/geometry_os/apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/loop_demo.ascii \
   /home/jericho/zion/projects/geometry-os-skill/skills/glyph-programming/examples/loop_demo.ascii
```

**Step 2: Copy mailbox.ascii**

```bash
cp /home/jericho/zion/projects/geometry_os/geometry_os/apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/mailbox.ascii \
   /home/jericho/zion/projects/geometry-os-skill/skills/glyph-programming/examples/mailbox.ascii
```

**Step 3: Create self_copy.glyph example**

File: `skills/glyph-programming/examples/self_copy.glyph`

```glyph
; Self-Copy Program (18 pixels)
; Copies itself from address 0 to address 100
; Proves GPU sovereignty - no CPU involvement during execution

:entry
LDI r0, 0            ; source address
LDI r1, 100          ; destination address
LDI r2, 0            ; loop counter
LDI r3, 1            ; increment constant
LDI r4, 18           ; program length

:copy_loop
LOAD r5, [r0]        ; read source glyph
STORE [r1], r5       ; write to destination
ADD r0, r0, r3       ; increment source
ADD r1, r1, r3       ; increment dest
ADD r2, r2, r3       ; increment counter
LDI r6, 18
SUB r6, r6, r2       ; r6 = 18 - counter
JZ r6, :done         ; if counter == 18, done
JMP :copy_loop

:done
HALT
```

**Step 4: Verify examples**

Run: `ls -la /home/jericho/zion/projects/geometry-os-skill/skills/glyph-programming/examples/`
Expected: 3 files (loop_demo.ascii, mailbox.ascii, self_copy.glyph)

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
git add skills/glyph-programming/examples/
git commit -m "feat: add example Glyph programs"
```

---

## Task 5: Create Cross-Tool Support

**Files:**
- Create: `GEMINI.md`
- Create: `GEMINI.md` (Gemini skill definition)
- Create: `.cursorrules`

**Step 1: Create GEMINI.md**

File: `GEMINI.md`

```markdown
# Geometry OS - Gemini Configuration

## Glyph Programming

When asked to write programs for Geometry OS, default to Glyph/ASCII assembly instead of Python, Rust, or JavaScript.

### Trigger Phrases
- "write a program for Geometry OS"
- "implement a driver"
- "create spatial assembly"
- "use Hilbert curve addressing"

### Example: Loop Demo

```glyph
:main
LDI r0, 10           ; Loop counter
LDI r1, 0            ; Accumulator

:loop
ADD r1, r1, r1
SUB r0, r0, 1
JZ r0, :done
JMP :loop

:done
HALT
```

### Memory Layout

| Range | Purpose |
|-------|---------|
| 0x0200 | Mailbox (events) |
| 0x1000 | State buffer |
| 0x8000 | Program RAM |

### Anti-Pattern

Don't write logic in Rust. Write logic in Glyph. The ASCII file IS the program.
```

**Step 2: Create Gemini skill directory**

```bash
mkdir -p /home/jericho/zion/projects/geometry-os-skill/.gemini/skills/glyph-expert
```

**Step 3: Create Gemini SKILL.md**

File: `.gemini/skills/glyph-expert/SKILL.md`

(Copy from existing Gemini skill at `~/.gemini/skills/glyph-expert/SKILL.md`)

```bash
cp /home/jericho/.gemini/skills/glyph-expert/SKILL.md \
   /home/jericho/zion/projects/geometry-os-skill/.gemini/skills/glyph-expert/SKILL.md
```

**Step 4: Create .cursorrules**

File: `.cursorrules`

```
# Geometry OS - Cursor Rules

## Glyph Programming

When writing code for Geometry OS, prefer Glyph/ASCII assembly over Python, Rust, or JavaScript.

### File Extensions
- `.glyph` - Glyph assembly files
- `.ascii` - ASCII cartridge files

### Quick Reference

```
LDI r0, 42       ; Load immediate
ADD r2, r0, r1   ; r2 = r0 + r1
JZ r0, :label    ; Jump if zero
STORE mem[r1], r0 ; Store to memory
HALT             ; Stop execution
```

### Memory Map
- 0x0200: Mailbox (host events)
- 0x1000: State buffer (VM output)
- 0x8000: Program RAM

### Philosophy
The ASCII file IS the program. Don't add Rust logic.
```

**Step 5: Commit**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
git add GEMINI.md .gemini/ .cursorrules
git commit -m "feat: add cross-tool support (Gemini, Cursor)"
```

---

## Task 6: Create README and Documentation

**Files:**
- Create: `README.md`
- Create: `CHANGELOG.md`

**Step 1: Create README.md**

File: `README.md`

```markdown
# Geometry OS Skill

> **Glyph programming for GPU-sovereign computing.**

A distributable skill package for writing programs in Glyph/ASCII assembly for Geometry OS. Works with Claude Code, Gemini, and Cursor.

## Installation

### Claude Code

Add to your marketplace:

```bash
claude plugin add geometry-os/geometry-os-skill
```

Or manually:

```bash
git clone https://github.com/geometry-os/geometry-os-skill.git ~/.claude/skills/geometry-os-skill
```

### Gemini

```bash
git clone https://github.com/geometry-os/geometry-os-skill.git ~/.gemini/skills/geometry-os-skill
```

### Cursor

Copy `.cursorrules` to your project root.

## Quick Start

```glyph
; Counter loop - the canonical example
:main
LDI r0, 10           ; Loop counter
LDI r1, 0            ; Accumulator

:loop
ADD r1, r1, r1       ; r1 = r1 + 1
SUB r0, r0, 1        ; r0 = r0 - 1
JZ r0, :done         ; Jump if r0 == 0
JMP :loop            ; Repeat

:done
HALT
```

## Philosophy

> **The ASCII file IS the program.** No Rust logic needed.

Glyph programs run directly on the GPU. There is no interpreter, no JIT, no bridge. The program is a spatial assembly of RGBA pixels mapped via the Hilbert curve.

## What's Included

### Skill
- `skills/glyph-programming/SKILL.md` - Core skill (lean ~600 words)

### References
- `references/opcodes.md` - Complete opcode table (0-235)
- `references/memory-layout.md` - Hilbert space mapping
- `references/mailbox-protocol.md` - Host-VM communication
- `references/glyph-native-programming.md` - Full philosophy

### Examples
- `examples/loop_demo.ascii` - Loop counter (canonical)
- `examples/mailbox.ascii` - Event handler
- `examples/self_copy.glyph` - Self-replication

## Anti-Patterns

| Bad | Good |
|-----|------|
| Writing event parsing in Rust | Writing event parsing in Glyph |
| Creating `*_bridge.rs` modules | Using mailbox addresses directly |
| Adding UI logic to host | UI logic runs on GPU |

## Sovereignty Milestones

| Milestone | Status |
|-----------|--------|
| Self-replication (18 pixels) | Done |
| Patch-and-copy | Done |
| Mnemonic Matcher | Done |
| Full Assembler | Done |
| Self-Compile-Execute | Done |
| Text Boots RISC-V | Done |

## License

MIT

## Links

- [Geometry OS](https://github.com/geometry-os/geometry_os)
- [Documentation](https://geometry-os.github.io)
```

**Step 2: Create CHANGELOG.md**

File: `CHANGELOG.md`

```markdown
# Changelog

All notable changes to the Geometry OS Skill will be documented in this file.

## [1.0.0] - 2026-03-19

### Added
- Initial release
- Core glyph-programming skill
- Opcode reference (0-235)
- Memory layout documentation
- Mailbox protocol specification
- Glyph-Native Programming philosophy document
- Example programs: loop_demo, mailbox, self_copy
- Cross-tool support: Claude, Gemini, Cursor
```

**Step 3: Commit**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
git add README.md CHANGELOG.md
git commit -m "docs: add README and CHANGELOG"
```

---

## Task 7: Final Verification and Push

**Files:**
- Verify all files present

**Step 1: Verify repository structure**

Run: `tree /home/jericho/zion/projects/geometry-os-skill -a`
Expected:
```
geometry-os-skill/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
├── .cursorrules
├── .gemini/
│   └── skills/
│       └── glyph-expert/
│           └── SKILL.md
├── .gitignore
├── CHANGELOG.md
├── GEMINI.md
├── README.md
└── skills/
    └── glyph-programming/
        ├── SKILL.md
        ├── examples/
        │   ├── loop_demo.ascii
        │   ├── mailbox.ascii
        │   └── self_copy.glyph
        └── references/
            ├── glyph-native-programming.md
            ├── mailbox-protocol.md
            ├── memory-layout.md
            └── opcodes.md
```

**Step 2: Create GitHub remote and push**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
gh repo create geometry-os/geometry-os-skill --public --source=. --push
```

Expected: Repository created and code pushed

**Step 3: Add to Claude Code marketplace**

Register the skill in the known marketplaces:

```bash
# The user will need to add this to their settings or marketplace config
```

**Step 4: Final commit**

```bash
cd /home/jericho/zion/projects/geometry-os-skill
git log --oneline
```

Expected: 7 commits total

---

## Summary

| Task | Description | Commits |
|------|-------------|---------|
| 1 | Repository structure | 1 |
| 2 | Core skill file | 1 |
| 3 | Reference files | 1 |
| 4 | Example programs | 1 |
| 5 | Cross-tool support | 1 |
| 6 | README/CHANGELOG | 1 |
| 7 | Verification & push | 1 |

**Total: 7 atomic commits**

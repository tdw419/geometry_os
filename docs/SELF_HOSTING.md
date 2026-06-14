# Self-Hosting in Geometry OS

Geometry OS can build, compile, and run software entirely within the VM.
You can write a program using the built-in editor, save it to the virtual
filesystem, and execute it from the shell -- without ever touching the host
machine's files.

This document explains the full self-hosting loop and the pieces that make
it work.

---

## The Loop

```
  Boot GeOS
     |
  init.asm (PID 1) runs
     |
  EXEC "shell"  ──→  shell.asm starts
     |
  User types "edit my_app"
     |
  EXEC "nano_editor"  ──→  nano_editor.asm starts
     |
  User writes code, saves to VFS (.geometry_os/fs/)
     |
  User exits editor, returns to shell
     |
  User types "my_app"
     |
  EXEC "my_app"  ──→  VM reads from VFS, assembles, spawns process
     |
  Program runs as a new child process
```

None of these steps require the host operating system.

---

## The Three Loading Mechanisms

Geometry OS has three distinct ways to load and run programs, each at a
different level of abstraction.

### 1. EXEC (0x66) -- The OS Loader

The primary mechanism. Combines `fork()` + `exec()` + `assemble()` into
a single instruction.

**How it works:**

1. A program writes a null-terminated filename string into RAM.
2. It calls `EXEC r_addr` where `r_addr` points to that string.
3. The VM reads the filename, appends `.asm` if missing.
4. It searches for the file in two locations (in order):
   - **Host `programs/` directory** (for pre-installed programs)
   - **VFS `.geometry_os/fs/` directory** (for programs created inside the VM)
5. If found, the VM runs the built-in assembler on the source.
6. If assembly succeeds, a new process is created with its own page tables,
   registers, and memory space.
7. The child PID is returned in `r0` (and `RAM[0xFFA]`).
8. If anything fails, `r0 = 0xFFFFFFFF`.

```asm
; Load a program by name
LDI r10, filename
EXEC r10

; Check for success
LDI r1, 0xFFFFFFFF
CMP r0, r1
JZ r0, load_failed

; r0 = child PID -- the program is now running
HALT

load_failed:
    ; Handle error (file not found, assembly error, too many processes)
    LDI r0, 0xFF0000
    FILL r0
    HALT

filename: .db "snake", 0
```

**Source:** `src/vm/ops_extended.rs` (opcode `0x66`)

### 2. ASMSELF (0x73) + RUNNEXT (0x74) -- Runtime Compilation

For programs that generate new code on the fly. A program writes assembly
source text into RAM, compiles it at runtime, and jumps into the result.

- **ASMSELF**: Reads canvas buffer as text, assembles it, writes bytecode
  to `0x1000`. Check `RAM[0xFFD]` for status (word count = success,
  `0xFFFFFFFF` = error).
- **RUNNEXT**: Sets `PC = 0x1000` and continues execution from the newly
  assembled code.

```asm
; Write code to canvas at 0x8000
LDI r1, 0x8000
LDI r2, 76      ; 'L'
STORE r1, r2
; ... (write full source text) ...

ASMSELF         ; compile canvas → bytecode at 0x1000
LDI r1, 0xFFD
LOAD r2, r1     ; check assembly status
LDI r3, 0xFFFFFFFF
CMP r2, r3
JZ r2, asm_error

RUNNEXT         ; jump to 0x1000 and execute the new code

asm_error:
    HALT
```

**Proven by:** `programs/self_host.asm` (Phase 70) -- writes a complete
gradient-drawing program character-by-character, assembles it, and runs it.

**Source:** `src/vm/ops_extended.rs` (opcodes `0x73`, `0x74`)
**Guide:** `docs/SELF_MODIFYING_GUIDE.md`

### 3. LOADPNG / LOADSRCIMG -- Pixel Boot

Load programs from PNG image files. Each pixel encodes data via the
pixelpack scheme. See `docs/CODE_PIXEL_EXECUTION.md` for the full
encoding details.

- **LOADPNG** (0xB1): Decodes a PNG containing pre-assembled bytecode,
  writes it directly to RAM.
- **LOADSRCIMG** (0xB2): Decodes a PNG containing assembly source text,
  writes it to the canvas, assembles it, and writes bytecode to `0x1000`.

Both now search the VFS directory as a fallback, so pixel-encoded programs
created inside the VM can be loaded without host filesystem access.

---

## The VFS Bridge

### The Problem

GeOS has two storage locations:

| Location | Path | Written by | Read by |
|----------|------|------------|---------|
| Host programs | `programs/` | External editor (neovim) | EXEC, LOADPNG, LOADSRCIMG |
| Virtual Filesystem | `.geometry_os/fs/` | VFS opcodes (OPEN/WRITE/CLOSE) from within VM | VFS opcodes (OPEN/READ/CLOSE) |

Before the VFS bridge, there was a gap: programs saved by the in-VM
editor went to `.geometry_os/fs/`, but EXEC only looked in `programs/`.
You could write code inside GeOS but couldn't run it.

### The Fix

EXEC, LOADPNG, and LOADSRCIMG now search both locations in order:

```
1. Try programs/<filename>        (host directory)
2. Try .geometry_os/fs/<filename>  (VFS directory)
3. Return error (0xFFFFFFFF) if neither exists
```

This means the development loop is fully closed:

1. Boot GeOS
2. Open nano_editor: type `edit my_app` at the shell
3. Write your code
4. Save it (nano_editor writes to `.geometry_os/fs/my_app.asm`)
5. Exit the editor
6. Run it: type `my_app` at the shell
7. EXEC finds it in VFS, assembles it, spawns a child process

**Commit:** `a14120d9` -- "feat: VFS fallback for EXEC, LOADPNG, LOADSRCIMG"

---

## Key Programs in the Loop

### init.asm (PID 1)

The first process. Runs automatically when GeOS boots. Clears the screen
and spawns the shell.

### shell.asm

A full interactive command shell (~3800 lines). Features:
- Command prompt with text input
- Built-in commands: `help`, `echo`, `ls`, `cat`, `ps`, `kill`, `rm`,
  `cp`, `grep`, `head`, `tail`, `wc`, `date`, `clear`, `export`
- Pipe operator: `cmd1 | cmd2`
- Redirection: `cmd > file`, `cmd >> file`, `cmd < file`
- **Program execution:** Any unrecognized command falls through to `EXEC`,
  which loads and runs the corresponding `.asm` file.
- In-VM assembler: `as` command assembles source text from RAM.
- In-VM runner: `run` command executes assembled bytecode.

### nano_editor.asm

A text editor written entirely in GeOS assembly (~3000 lines). Can open,
edit, and save files using the VFS opcodes. This is the "IDE" that lives
inside the VM.

### self_host.asm

Proof-of-concept for metacircular self-hosting. Generates assembly source
text in RAM, compiles it with ASMSELF, and executes it with RUNNEXT.
Proves the VM can invent and run new logic without touching the host.

---

## Building a Program Launcher

The EXEC opcode makes it straightforward to build graphical launchers.
Any program can spawn other programs:

```asm
; launcher.asm -- Click icons to launch programs
.org 0x000

    ; Draw icon for Snake
    LDI r1, 0x00FF00
    RECTF 10, 10, 60, 40, r1
    LDI r2, 10
    LDI r3, 15
    LDI r4, snake_label
    TEXT r2, r3, r4

    ; Draw icon for Clock
    LDI r1, 0x0000FF
    RECTF 80, 10, 130, 40, r1
    LDI r2, 80
    LDI r3, 15
    LDI r4, clock_label
    TEXT r2, r3, r4

main_loop:
    FRAME
    MOUSEQ r10
    JZ r12, main_loop       ; no click

    ; Check if click is in Snake icon region (10-60, 10-40)
    ; ... hit-test logic ...
    ; If hit:
    LDI r10, snake_str
    EXEC r10
    JMP main_loop

    ; If clock hit:
    LDI r10, clock_str
    EXEC r10
    JMP main_loop

snake_label: .db "Snake", 0
clock_label: .db "Clock", 0
snake_str:   .db "snake", 0
clock_str:   .db "clock", 0
```

Each EXEC call spawns an independent process. If the child crashes or
halts, the launcher keeps running.

---

## Self-Hosting Levels

| Level | Description | Status |
|-------|-------------|--------|
| **Level 1: Multi-process** | Shell spawns programs via EXEC | Done |
| **Level 2: In-VM editing** | Write and save code from inside the VM | Done |
| **Level 3: VFS bridge** | EXEC finds programs saved to VFS | Done (a14120d9) |
| **Level 4: Runtime compilation** | Programs generate and execute new code (ASMSELF) | Done |
| **Level 5: Assembler in assembly** | The assembler itself written in GeOS ASM | Future |

Levels 1-4 are complete. Level 5 would be the theoretical "strict
self-hosting" goal -- writing the assembler itself in GeOS assembly so
the system could bootstrap from nothing. This is a stunt, not a
practical necessity: the VM already treats the assembler as a primitive
accessible to every program via EXEC and ASMSELF.

---

## See Also

- `docs/ARCHITECTURE.md` -- Full opcode reference and system architecture
- `docs/SELF_MODIFYING_GUIDE.md` -- ASMSELF/RUNNEXT runtime code generation
- `docs/CODE_PIXEL_EXECUTION.md` -- Pixelpack PNG boot paths (LOADPNG/LOADSRCIMG)
- `docs/NORTH_STAR.md` -- Project direction and priorities
- `programs/README.md` -- Catalog of all available programs

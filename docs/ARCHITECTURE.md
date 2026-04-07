# Architecture Guide — Geometry OS

*For someone who has never seen the codebase. Read this, write a .gasm program, and run it.*

## The Big Idea

Geometry OS treats a **4096x4096 RGBA8 texture** as the entire address space of a computer. Each pixel is one 32-bit word of memory. The red channel is the opcode, green is the stratum (context), blue is param1, alpha is param2.

A compute shader runs on this texture every frame. It reads pixels as instructions, executes them, and writes results back. Programs literally live inside the texture — and can modify themselves.

## Memory Layout

```
0x0000_0000 .. 0x00DF_FFFF   Program code (user programs live here)
0x00E0_0000                  Message queue (IPC between VMs)
0x00E1_0000                  Event queue (system events)
0x00E2_0000                  Input state (mouse x, y, buttons)
0x00E3_0000                  Issue queue (64 slots, autonomous agent work)
0x00E4_0000                  Metrics
0x00F3_0000                  Screen buffer (256x256 pixels)
0x00F4_0000                  Dashboard
```

The texture is 4096x4096 = 16M pixels = 16M words = 64MB total.

## Virtual Machines

- **8 concurrent VMs**, each with its own program counter and register file
- **128 registers** per VM (r0 through r127)
- **Call stack** for CALL/RET
- States: `RUNNING`, `YIELDED`, `HALTED`
- 1024 cycles per frame (all VMs execute in parallel)

## Instruction Set

Each instruction is one pixel: `[opcode, stratum, param1, param2]`.

### Core Operations

| Opcode | Name    | Format              | Description                     |
|--------|---------|---------------------|---------------------------------|
| 0      | NOP     | NOP                 | No operation                    |
| 1      | LDI     | LDI rD, immediate   | Load immediate (2-word)         |
| 2      | MOV     | MOV rD, rS          | Copy register                   |
| 3      | LOAD    | LOAD rD, [rS]       | Read from memory                |
| 4      | STORE   | STORE [rD], rS      | Write to memory                 |
| 9      | JMP     | JMP label           | Unconditional jump (2-word)     |
| 10     | BRANCH  | BNE/BEQ rA, rB, lbl | Conditional branch (2-word)     |
| 11     | CALL    | CALL label          | Call subroutine (2-word)        |
| 12     | RET     | RET                 | Return from subroutine          |
| 13     | HALT    | HALT                | Stop execution                  |
| 14     | ENTRY   | ENTRY rD            | Read entry point into register  |

### Arithmetic & Logic

| Opcode | Name | Format        | Description          |
|--------|------|---------------|----------------------|
| 5      | ADD  | ADD rD, rS    | rD += rS             |
| 6      | SUB  | SUB rD, rS    | rD -= rS             |
| 7      | MUL  | MUL rD, rS    | rD *= rS             |
| 8      | DIV  | DIV rD, rS    | rD /= rS             |
| 25     | AND  | AND rD, rS    | rD &= rS             |
| 20     | OR   | OR rD, rS     | rD \|= rS             |
| 29     | XOR  | XOR rD, rS    | rD ^= rS             |
| 30     | NOT  | NOT rD        | rD = !rD             |
| 26     | SHL  | SHL rD, rS    | rD <<= rS            |
| 19     | SHR  | SHR rD, rS    | rD >>= rS            |
| 31     | MOD  | MOD rD, rS    | rD %= rS             |

### Graphics

| Opcode | Name     | Format                   | Description              |
|--------|----------|--------------------------|--------------------------|
| 23     | PSET     | PSET rX, rY, rColor      | Write pixel to screen    |
| 24     | PGET     | PGET rD, rX, rY          | Read pixel from screen   |
| 15     | CHAR     | CHAR rAscii, rTarget     | Blit character           |
| 34     | RECTF    | RECTF rX, rY, rParams    | Filled rectangle         |
| 35     | LINE     | LINE rX0, rY0, rParams   | Draw line                |
| 36     | TEXT_STR | TEXT_STR rAddr, rX, rY   | Draw null-term string    |
| 37     | CIRCLEF  | CIRCLEF rCX, rCY, rR     | Filled circle            |

### Concurrency & IPC

| Opcode | Name       | Format                     | Description              |
|--------|------------|----------------------------|--------------------------|
| 230    | SPAWN      | SPAWN rBase, rEntry        | Spawn a new child VM     |
| 227    | YIELD      | YIELD                      | Yield timeslice          |
| 17     | SEND       | SEND rTargetVM, rDataAddr  | Send IPC message (2-word)|
| 18     | RECV       | RECV rDestAddr, rStatus    | Receive IPC message      |
| 28     | WAIT_EVENT | WAIT_EVENT rType, rParam   | Block until event        |
| 27     | FRAME      | FRAME rTarget              | Jump to filmstrip frame  |

### Self-Modification & Agent System

| Opcode | Name            | Format                              | Description            |
|--------|-----------------|-------------------------------------|------------------------|
| 224    | GLYPH_MUTATE    | GLYPH_MUTATE rTargetAddr, rOpcode   | Self-modify code       |
| 225    | SPATIAL_SPAWN   | SPATIAL_SPAWN rDest, rSize, rSrc    | Copy code cluster      |
| 226    | SEMANTIC_MERGE  | SEMANTIC_MERGE rA, rB               | Merge code clusters    |
| 240    | ISSUE_CREATE    | ISSUE_CREATE rTitle, rPriority      | Create work item       |
| 241    | ISSUE_PICK      | ISSUE_PICK rOut, rFilter            | Claim next work item   |
| 242    | ISSUE_UPDATE    | ISSUE_UPDATE rIssueId, rStatus      | Update work item       |
| 243    | ISSUE_LIST      | ISSUE_LIST rOut, rFilter            | List work items        |

## How to Write a .gasm Program

A `.gasm` file is assembly text. Here's the minimal "Hello, World" — a self-replicator:

```gasm
; Copy 18 pixels from address 0 to address 100
LDI r0, 0          ; source start
LDI r1, 100        ; destination
LDI r2, 0          ; counter
LDI r3, 1          ; increment
LDI r4, 18         ; program length
loop:
    LOAD r5, r0    ; r5 = mem[r0]
    STORE r1, r5   ; mem[r1] = r5
    ADD r0, r3     ; r0 += 1
    ADD r1, r3     ; r1 += 1
    ADD r2, r3     ; r2 += 1
    BNE r2, r4, loop
HALT
```

### Filmstrip Programs

Programs can have multiple frames separated by `---`:

```gasm
.frame "Init"
LDI r0, 0
FRAME r1

---

.frame "Run"
; ... do work ...
FRAME r1        ; loop back to self

---

.frame "Done"
HALT
```

## VM Lifecycle

1. **Load** — Program pixels are written into the texture at a base address
2. **Spawn** — `spawn_vm(vm_id, entry_point)` creates a VM starting at that address
3. **Execute** — Each frame, all running VMs get 1024 cycles
4. **Yield/Halt** — VMs can YIELD (resume next frame) or HALT (done forever)
5. **IPC** — VMs communicate via SEND/RECV through the message queue

## Scheduler

The scheduler (`execute_frame`) runs all VMs in parallel each frame:
- VMs with `state == RUNNING` and `halted == 0` execute
- Each VM runs up to `CYCLES_PER_FRAME` (1024) instructions
- YIELD pauses a VM until the next frame
- HALT stops a VM permanently

## File Structure

```
geometry_os/
  src/
    lib.rs            — Constants (memory layout, sizes)
    assembler.rs      — Hand-written test programs, opcode definitions
    gasm.rs           — .gasm assembler (text → pixels)
    software_vm.rs    — CPU-based VM (exact replica of GPU shader)
    rv64/             — RISC-V 64-bit CPU emulator
  programs/           — Example .gasm programs
  docs/               — Specs and roadmap
  systems/            — GPU driver (infinite_map_rs)
```

## Running Tests

```bash
cargo test --workspace     # run everything
cargo test --lib           # just the core library
cargo test assemble_self   # run a specific test
```

All tests must pass. The test suite currently has 439 tests. Do not break them.

## The Hilbert Curve

Memory addresses map to 2D texture coordinates via a Hilbert curve. This means nearby memory addresses appear as nearby pixels on the texture. You can literally *see* programs — they form visual patterns. Self-replicating programs create fractal patterns on the texture.

## Your First Program

Try `programs/fibonacci.gasm` — it computes 20 Fibonacci numbers and stores them in memory. Or `programs/sierpinski.gasm` — it renders a Sierpinski triangle to the screen buffer using only AND and PSET.

To add your own: create a `.gasm` file in `programs/`, write a test in `src/gasm.rs` that assembles it, and verify it runs correctly in the software VM.

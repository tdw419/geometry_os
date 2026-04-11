# Geometry OS Roadmap

## Direction

See `NORTH_STAR.md`. Programs first. Write .gp, compile with pixelc, run on VM.
Extend the compiler and VM only when programs hit walls.

## How to Build Programs

1. Read `docs/PIXELC_GUIDE.md` -- the complete reference for writing .gp files
2. Write your program as `programs/YOUR_NAME.gp`
3. Compile: `python3 tools/pixelc programs/YOUR_NAME.gp -o programs/YOUR_NAME.asm`
4. Add a test in `tests/pixelc_tests.rs` using `compile_run("programs/YOUR_NAME.asm")`
5. Run tests: `cargo test pixelc_` to verify
6. Commit: the .gp source AND the compiled .asm

## Current State

- 8 visual programs + 1 shell: simple_add, diagonal, bounce, checkerboard, fib_spiral, gradient, life, rain, shell
- 9 pixelc tests passing (including shell and rain tests)
- All tests passing (373 lib + all integration)
- Compiler: variables, arithmetic, while/if/else, functions, memory ops, drawing, arbitrary expression depth
- **Pixel-native shell**: programs/shell.gasm runs inside the VM as a real OS shell
  - Terminal I/O (0xFFD8+) renders to VM screen via Vm::render_terminal()
  - Keyboard input via KEY_PORT (0xFFF) with YIELD-based polling
  - Commands implemented: CLS, HELP, VER, ECHO
  - Commands in header but NOT implemented: DIR, RUN

## Available Opcodes (quick reference for .gasm work)

```
LDI r, val    | LOAD r, addr  | STORE addr, r  | MOV dst, src
ADD dst, src  | SUB dst, src  | MUL dst, src   | DIV dst, src
MOD dst, src  | AND dst, src  | OR dst, src    | XOR dst, src
NOT dst       | SHL dst, amt  | SHR dst, amt
JMP addr      | CALL addr     | RET            | BRANCH cond, addr
PUSH r        | POP r         | YIELD          | HALT
PSET x, y, c  | LINE x1,y1,x2,y2 | RECTF x,y,w,h | CIRCLEF cx,cy,r
TEXT x, y, addr | BLIT dst, src, count
FORK          | EXIT          | GETPID         | SPAWN addr, arg
SEND          | RECV          | EXEC addr, arg
INT vector    | IRET          | STI vector, handler
LDB r, addr   | STB addr, r   | NOP
```

Branch conditions (packed u32): BEQ=0, BNE=1, BLT=2, BGE=3, BLTU=4, BGEU=5, BAL=15
BNE/BEQ/BGE/BLT are also available as pseudo-ops: `BNE r1, r2, label`

## I/O Register Map

```
0xFFD8  TERM_CHAR    Write: output char to terminal
0xFFDF  TERM_CLEAR   Write 1: clear terminal screen
0xFFF   KEY_PORT     Read: get keystroke (0 = none). Write 0 to acknowledge.
0xFFE0+ DEBUG_REGS   Read: VM debug registers (PC, registers, etc.)
0xFFB0  FS_CMD       Write: 1=SAVE, 2=LOAD, 3=DELETE, 4=EXISTS
0xFFB1  FS_NAME      Write: address of null-terminated filename
0xFFB2  FS_DATA      Write: address of data buffer
0xFFB3  FS_COUNT     Write: word count for SAVE. Read: words loaded after LOAD.
0xFFB4  FS_STATUS    Read: result of last FS operation (0=OK)
0xFFB5  FS_FILECOUNT Read: number of files on disk
0xFFC0-0xFFC3 AUDIO  Write: audio frequency
0xFFA0-0xFFA2 MOUSE  Read: mouse x, y, buttons
```

---

## Task Queue (chain picks the top unchecked item)

Pick the FIRST unchecked item below. Read the spec in the matching section.
Do NOT skip ahead. Do NOT attempt BLOCKED tasks.

### Sprint A: Visual Programs (.gp -- pure pixelc, NO Rust)

- [x] A1: sierpinski.gp -- Sierpinski triangle via chaos game (EASY)
- [x] A2: rain.gp -- falling pixel rain animation (EASY)
- [ ] A3: mandelbrot.gp -- Mandelbrot set visualization (MEDIUM)
- [ ] A4: maze.gp -- maze generation (MEDIUM)
- [ ] A5: fireworks.gp -- particle explosion animation (MEDIUM)
- [ ] A6: clock.gp -- real-time clock face (MEDIUM)

### Sprint B: Shell Commands (.gasm -- extend shell.gasm, NO Rust)

- [ ] B1: DIR command -- list programs in virtual filesystem (EASY-MEDIUM)
- [ ] B2: TYPE command -- view file contents in terminal (EASY-MEDIUM)
- [ ] B3: DEBUG command -- show registers and PC (MEDIUM)

### Sprint C: Architecture (BLOCKED -- needs Rust changes, do NOT attempt)

- [ ] C1: RUN command -- EXEC opcode wiring (BLOCKED: needs Rust)
- [ ] C2: Shell auto-start -- boot sequence loads shell (BLOCKED: needs Rust)
- [ ] C3: EDIT command -- inline text editor (BLOCKED: needs Rust)
- [ ] B4: Command history -- up/down arrow recall (HARD, defer)

### Phase 3 completed

- [x] simple_add -- basic arithmetic and memory store
- [x] diagonal -- linear drawing pattern
- [x] bounce -- animation with velocity (while loop)
- [x] checkerboard -- conditional drawing (if/else + modulo)
- [x] fib_spiral -- fibonacci with drawing
- [x] gradient.gp -- smooth color gradient across the screen
- [x] life.gp -- Conway's Game of Life (cellular automata, double-buffered grid)

---

## Task Specifications

### A1: sierpinski.gp

**What:** Sierpinski triangle using chaos game algorithm.
**Algorithm:**
1. Start at position (128, 128). Define 3 corners: (10,10), (246,10), (128,246).
2. Loop 5000 times:
   - Pick random corner (0, 1, or 2). Use simple PRNG: `seed = (seed * 1103515245 + 12345) & 0x7FFFFFFF`, corner = seed % 3
   - Move halfway to chosen corner: x = (x + corner_x) / 2, y = (y + corner_y) / 2
   - Plot pixel with color based on corner (e.g., 0x41, 0xE0, 0x1F for red/green/blue)
3. Halt after 5000 iterations.

**pixelc tips:**
- No division opcode -- use bit shift: / 2 is >> 1 (x >> 1)
- Use `ram[addr]` if you need lookup tables for corner coordinates
- Start with `seed = 42`

**Test:** `compile_run("programs/sierpinski.asm")` -- verify at least 100 pixels are non-zero.
**Verify:** `cargo test` passes.

### A2: rain.gp

**What:** Falling pixel rain animation.
**Algorithm:**
1. Initialize 20 drops. Store x, y, speed for each drop in RAM.
   - Layout: ram[0]=drop0_x, ram[1]=drop0_y, ram[2]=drop0_speed, ram[3]=drop1_x, ...
   - Random x (0-255), y=0, speed=1-3
2. Loop 500 frames:
   - For each drop:
     - Erase old pixel: pixel(x, y, 0)
     - y = y + speed
     - If y > 255: reset y=0, random x
     - Draw new pixel: pixel(x, y, color)
   - yield() at end of frame
3. Halt after 500 frames.

**pixelc tips:**
- Use `ram[base + offset]` for drop arrays
- Speed 1-3: use `seed % 3 + 1`
- Color: blue-ish (0x1F or 0x3F)

**Test:** `compile_run("programs/rain.asm")` -- verify it halts and has non-zero pixels.
**Verify:** `cargo test` passes.

### A3: mandelbrot.gp

**What:** Mandelbrot set visualization.
**Algorithm:**
1. For each pixel (px, py) where px=0..63, py=0..63 (quarter res for speed):
   - Map to complex plane: c_real = px * 4 / 64 - 2, c_imag = py * 4 / 64 - 2
   - Use integer fixed-point (scale by 256): c_r = (px * 1024) / 64 - 512, c_i = (py * 1024) / 64 - 512
   - Iterate: z_r = z_r + z_r - c_r... actually use the standard z = z^2 + c
   - If |z|^2 > 4*256*256 (overflow): escape, color = iteration count
   - Max 16 iterations
2. Plot pixel at (px*4, py*4) with color = iteration * 16 (or use RECTF for 4x4 blocks)
3. Halt when done.

**pixelc tips:**
- All math must be integer. Use bit shifts instead of division.
- z^2 = (z_r * z_r - z_i * z_i) + i*(2 * z_r * z_i) -- this is tricky in fixed point
- Keep scale factor small to avoid u32 overflow. Scale by 64 or 128, not 256.
- Start with a low-res version (64x64 pixels) to keep it fast.

**Test:** `compile_run("programs/mandelbrot.asm")` -- verify center pixel is in the set.
**Verify:** `cargo test` passes.

### A4: maze.gp

**What:** Simple maze generation.
**Algorithm:**
1. Fill screen with wall color (0x00 = black).
2. Grid of 16x16 cells, each 16x16 pixels.
3. Use recursive backtracker or simpler: for each cell, randomly open right or bottom wall.
4. Draw passages as white pixels (RECTF with 0xFF or 0x41).
5. Halt when maze is complete.

**pixelc tips:**
- Use nested while loops for grid traversal
- For each cell at (cx, cy): draw white rect at pixel (cx*16, cy*16) size 16x16
- Then randomly punch a hole right or down
- Simple version: just remove random walls without full backtracker

**Test:** `compile_run("programs/maze.asm")` -- verify both black and white pixels exist.
**Verify:** `cargo test` passes.

### A5: fireworks.gp

**What:** Particle explosion animation.
**Algorithm:**
1. Array of 30 particles. Each has: x, y, dx, dy, life.
2. Launch burst: set all particles to same origin (128, 200), random dx/dy, life=30.
3. Each frame:
   - For each particle: erase old pixel, x+=dx, y+=dy, dy+=1 (gravity), life--
   - Draw new pixel with color = life * 8 (fades out)
   - If life <= 0: skip
4. Every 40 frames: launch new burst from random x position.
5. Run for 200 frames. yield() each frame.

**pixelc tips:**
- Store particles in ram[] with stride 5 (x, y, dx, dy, life)
- Random dx: seed % 17 - 8 (range -8 to 8). Random dy: seed % 10 - 12 (mostly upward)
- Use `0 - dy` for negation since no negative literals
- Color: `life * 8` gives nice fade

**Test:** `compile_run("programs/fireworks.asm")` -- verify non-zero pixels.
**Verify:** `cargo test` passes.

### A6: clock.gp

**What:** Analog clock face with hands.
**Algorithm:**
1. Draw clock face: CIRCLEF(128, 128, 100, 0x20) for face, CIRCLEF(128, 128, 98, 0x00) to hollow it
   -- actually just use CIRCLEF for a filled circle as background.
2. Simulate time with a counter: frame 0 = 12:00:00, each frame advances 1 second.
3. Second hand: angle = seconds * 6 degrees. Length 90 pixels from center.
   - Use integer sin/cos approximation or simple lookup table in ram[]
   - Or simplify: 60 positions around circle, draw line from center to position
4. Minute hand: shorter, thicker (or just shorter line). Same calculation with minutes.
5. Hour hand: shortest line. Same with hours * 30 degrees.
6. yield() each frame. Run for 3600 frames (1 hour simulated).

**pixelc tips:**
- For hand positions without sin/cos: precompute x,y offsets for 60 positions and store in ram[]
  - x_offset[i] = cos(i * 6 degrees) * length / 256
  - y_offset[i] = sin(i * 6 degrees) * length / 256
  - Compute at start of program using integer approximation
- sin/cos approximation: use small angle or Taylor series (2-3 terms)
- Or hardcode a 12-point or 60-point lookup table in the .gp file using ram[] writes

**Test:** `compile_run("programs/clock.asm")` -- verify clock pixels exist.
**Verify:** `cargo test` passes.

### B1: DIR command

**What:** Add DIR command to shell.gasm that lists available programs.
**How:**
1. Open `programs/shell.gasm`
2. After the `try_echo` block (around line 603), add a `try_dir` block
3. Parse "DIR" (3 chars: D, I, R) same pattern as CLS
4. For listing: use `fs_filecount` from lib/fs.gasm (read 0xFFB5) to get file count
5. Or simpler approach: hardcode a .data section with program names and print them
6. Output each name to TERM_CHAR (r10 = 0xFFD8), newline (10) between each
7. Add "DIR" to HELP text output

**Pattern to follow (from CLS):**
```asm
try_dir:
    LDI r20, 'D'
    BNE r0, r20, try_type    ; if first char not D, skip
    ; check chars 1='I' and 2='R'
    ; if match, print file list
    JMP shell_loop
```

**Note:** The shell doesn't currently include lib/fs.gasm. For a simple first version,
just hardcode a list like "bounce\0checkerboard\0..." in a .data section and iterate.

**Test:** Add `test_shell_dir` to pixelc_tests.rs that types "DIR\n" and checks output.
**Verify:** `cargo test` passes.

### B2: TYPE command

**What:** Add TYPE command to view file contents.
**How:**
1. Parse "TYPE " then read filename from input buffer
2. Use FS_CMD=4 (EXISTS) to check if file exists
3. If exists, use FS_CMD=2 (LOAD) to load into a RAM buffer
4. Read words from buffer, output as chars to TERM_CHAR
5. Print "Not found" if status != 0

**Follow ECHO's pattern** for parsing arguments after the command name.

**Test:** Add test to pixelc_tests.rs.
**Verify:** `cargo test` passes.

### B3: DEBUG command

**What:** Show VM registers and PC in terminal.
**How:**
1. Read debug registers at 0xFFE0+
2. Convert register values to decimal or hex strings
3. Print "R0=NNNN R1=NNNN ..." to terminal
4. Number-to-string: divide by 10 repeatedly, get digits, reverse

**This requires a number-to-string subroutine in .gasm, which is moderately complex.**
Consider printing just the low byte of each register for simplicity.

**Test:** Add test to pixelc_tests.rs.
**Verify:** `cargo test` passes.

---

## Chain Instructions

When the dev chain picks up work:
1. Read this ROADMAP.md
2. Pick the FIRST unchecked `- [ ]` item
3. Read the spec for that task above
4. Read relevant docs: `docs/PIXELC_GUIDE.md` for .gp, `programs/shell.gasm` for shell commands
5. Write the code
6. Compile and test: `python3 tools/pixelc programs/X.gp -o programs/X.asm && cargo test`
7. If tests pass, commit both .gp and .asm
8. If tests fail, fix and retry. Do NOT skip the test step.
9. Do NOT attempt tasks marked BLOCKED.
10. If a task is too hard or you're stuck after 3 attempts, mark it `- [!]` and move on.

## Definition of Done

A task is done when:
1. The .gp/.gasm source is written and readable
2. The compiled .asm exists and matches the source (for .gp files)
3. A test in pixelc_tests.rs verifies behavior
4. `cargo test` passes (ALL tests, not just the new one)
5. Source files are committed

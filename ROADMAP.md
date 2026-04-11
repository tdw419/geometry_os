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

- 7 visual programs + 1 shell: simple_add, diagonal, bounce, checkerboard, fib_spiral, gradient, life, shell
- 8 pixelc tests passing (including shell test)
- 373 lib tests + all integration tests passing
- Compiler: variables, arithmetic, while/if/else, functions, memory ops, drawing, arbitrary expression depth
- **Pixel-native shell**: programs/shell.gasm runs inside the VM as a real OS shell
  - Terminal I/O (0xFFD8+) renders to VM screen via Vm::render_terminal()
  - Keyboard input via KEY_PORT (0xFFF) with YIELD-based polling
  - Commands: CLS, HELP, VER, ECHO

## Phase 1: Pixel-Native OS -- Shell Essentials (ACTIVE)

The OS IS the shell. Build the shell into a real operating system interface.

- [ ] DIR command -- list programs in virtual filesystem (lib/fs.gasm)
- [ ] RUN command -- load and execute programs from within the shell (EXEC opcode)
- [ ] Shell auto-start -- boot sequence loads shell.gasm on F5 instead of requiring manual assembly
- [ ] Command history -- up/down arrow to recall previous commands
- [ ] TYPE command -- view file contents in terminal
- [ ] EDIT command -- inline text editor (modify ram[] via terminal I/O)
- [ ] DEBUG command -- show registers, memory, PC (read debug registers 0xFFE0+)

## Phase 2: Pixel-Native OS -- Shell as Platform

- [ ] Compile command -- invoke pixelc from within the OS (self-hosting bridge)
- [ ] PS command -- list running processes (FORK'd children)
- [ ] KILL command -- terminate a child process
- [ ] BG command -- run a program in background (FORK + continue shell)
- [ ] Shell scripts -- batch command files
- [ ] Split screen -- shell on top half, program output on bottom half

## Phase 3: Visual Programs

Build programs that create interesting pixel patterns. Each program tests compiler features.

- [x] simple_add -- basic arithmetic and memory store
- [x] diagonal -- linear drawing pattern
- [x] bounce -- animation with velocity (while loop)
- [x] checkerboard -- conditional drawing (if/else + modulo)
- [x] fib_spiral -- fibonacci with drawing
- [x] gradient.gp -- smooth color gradient across the screen
- [x] life.gp -- Conway's Game of Life (cellular automata, double-buffered grid)
- [ ] sierpinski.gp -- Sierpinski triangle using chaos game
- [ ] mandelbrot.gp -- Mandelbrot set visualization (nested loops, arithmetic)
- [ ] rain.gp -- falling pixel rain (array of positions, animation)
- [ ] maze.gp -- maze generation (random walks or recursive division)
- [ ] fireworks.gp -- particle explosion animation
- [ ] clock.gp -- real-time clock face using timer registers

## Phase 4: Interactive Programs

Programs that respond to keyboard/mouse input. Uses memory-mapped I/O registers.

- [ ] etch.gp -- keyboard-driven drawing (arrow keys move cursor)
- [ ] pong.gp -- single-player pong (keyboard up/down, ball physics)
- [ ] paint.gp -- mouse-driven paint program (read mouse at 0xFFA0-0xFFA2)
- [ ] piano.gp -- keyboard piano (map keys to audio frequencies at 0xFFC0-0xFFC3)
- [ ] reaction.gp -- reaction time tester (wait for stimulus, measure response)

## Phase 5: Compiler Improvements (When Programs Hit Walls)

Extend pixelc based on what the programs need. Not speculative.

- [ ] Arrays: `data = array(10)` with `data[i]` read/write (needs indexed memory ops)
- [ ] For loops: `for i in range(10):` (sugar for while)
- [ ] String literals: `print("hello")` rendering text to screen
- [ ] Else-if chains: `elif` support (currently only if/else)
- [ ] Negative numbers: proper sign handling in immediates
- [ ] Multiple return values: functions returning tuples
- [ ] Constants: `const SIZE = 64` at top level

## Phase 6: The Standard Library

Reusable .gp modules that other programs can include.

- [ ] lib/graphics.gp -- circle, line, rectangle drawing functions
- [ ] lib/math.gp -- sin/cos/sqrt approximations
- [ ] lib/input.gp -- keyboard/mouse reading helpers
- [ ] lib/audio.gp -- note playing, simple melodies
- [ ] lib/text.gp -- number-to-string, text rendering

## Priority Order

The OS shell is the priority. Visual programs and interactive programs are picked up
when they're needed to test a feature or when there's a natural break.

```
Phase 1 (OS essentials) -> Phase 2 (OS platform) -> Phase 3 (visual) -> Phase 4 (interactive) -> Phase 5 (compiler) -> Phase 6 (stdlib)
```

## Definition of Done

A task is done when:
1. The .gp/.gasm source is written and readable
2. The compiled .asm exists and matches the source (for .gp files)
3. A test in pixelc_tests.rs verifies behavior
4. `cargo test` passes
5. Source files are committed

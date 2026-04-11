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

- 5 programs: simple_add, diagonal, bounce, checkerboard, fib_spiral
- 5 pixelc tests passing
- Compiler supports: variables, arithmetic, while/if/else, functions, memory ops, drawing

## Phase 1: Visual Programs (Proving the Compiler Works)

Build programs that create interesting pixel patterns. Each program tests compiler features.

- [x] simple_add -- basic arithmetic and memory store
- [x] diagonal -- linear drawing pattern
- [x] bounce -- animation with velocity (while loop)
- [x] checkerboard -- conditional drawing (if/else + modulo)
- [x] fib_spiral -- fibonacci with drawing
- [ ] gradient.gp -- smooth color gradient across the screen
- [ ] sierpinski.gp -- Sierpinski triangle using chaos game
- [ ] mandelbrot.gp -- Mandelbrot set visualization (nested loops, arithmetic)
- [ ] rain.gp -- falling pixel rain (array of positions, animation)
- [ ] life.gp -- Conway's Game of Life (cellular automata)
- [ ] maze.gp -- maze generation (random walks or recursive division)
- [ ] fireworks.gp -- particle explosion animation
- [ ] clock.gp -- real-time clock face using timer registers

## Phase 2: Interactive Programs

Programs that respond to keyboard/mouse input. Uses memory-mapped I/O registers.

- [ ] etch.gp -- keyboard-driven drawing (arrow keys move cursor)
- [ ] pong.gp -- single-player pong (keyboard up/down, ball physics)
- [ ] paint.gp -- mouse-driven paint program (read mouse at 0xFFA0-0xFFA2)
- [ ] piano.gp -- keyboard piano (map keys to audio frequencies at 0xFFC0-0xFFC3)
- [ ] reaction.gp -- reaction time tester (wait for stimulus, measure response)

## Phase 3: Compiler Improvements (When Programs Hit Walls)

Extend pixelc based on what the programs need. Not speculative.

- [ ] Arrays: `data = array(10)` with `data[i]` read/write (needs indexed memory ops)
- [ ] For loops: `for i in range(10):` (sugar for while)
- [ ] String literals: `print("hello")` rendering text to screen
- [ ] Else-if chains: `elif` support (currently only if/else)
- [ ] Negative numbers: proper sign handling in immediates
- [ ] Multiple return values: functions returning tuples
- [ ] Constants: `const SIZE = 64` at top level

## Phase 4: VM Extensions (When Compiler Needs More)

- [ ] Indexed addressing mode: `LDX r0, r1` (load from address in r1 + offset)
- [ ] More registers: expand beyond 28 if complex programs need them
- [ ] Timer interrupts: programs can set periodic callbacks
- [ ] Serial output: text rendering via TEXT opcode improvements

## Phase 5: The Standard Library

Reusable .gp modules that other programs can include.

- [ ] lib/graphics.gp -- circle, line, rectangle drawing functions
- [ ] lib/math.gp -- sin/cos/sqrt approximations
- [ ] lib/input.gp -- keyboard/mouse reading helpers
- [ ] lib/audio.gp -- note playing, simple melodies
- [ ] lib/text.gp -- number-to-string, text rendering

## Priority Order

Work through phases in order. Within each phase, pick the most interesting program first.
Every program must have a test. Every test must pass.

```
Phase 1 (visual programs) -> Phase 2 (interactive) -> Phase 3 (compiler) -> Phase 4 (VM) -> Phase 5 (stdlib)
```

If a program needs a feature from a later phase, implement that feature first, then write the program.
Log what features were missing so we know what to build next.

## Definition of Done

A task is done when:
1. The .gp source is written and readable
2. The compiled .asm exists and matches the source
3. A test in pixelc_tests.rs verifies behavior
4. `cargo test` passes
5. Both .gp and .asm are committed

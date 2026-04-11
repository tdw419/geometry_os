# Geometry OS: North Star

## The Vision

Geometry OS is an operating system built **for AIs, by AIs, and eventually for humans**.

An AI sits at the keyboard, types, and pixels appear. Those pixels are opcodes.
The programs run. The screen changes. The AI sees the result and types more.
This is the loop. It is the same loop a human will use later.

The end goal: a real operating system. Like Windows, Linux, or macOS -- but
born from a different lineage. Not built in C on x86. Built in pixels on a VM
where every keystroke is both data and instruction. An OS that an AI can
understand from the ground up because the AI built it from the ground up.

## What "Real OS" Means

We're not there yet. But every decision should move toward this:

- **Filesystem** -- save, load, organize programs and data
- **Shell / command line** -- run programs, manage processes, script tasks
- **Window manager** -- multiple programs visible, click between them
- **Applications** -- text editor, file browser, paint program, terminal
- **Device drivers** -- keyboard, mouse, audio, network (memory-mapped)
- **Multi-tasking** -- multiple programs running, scheduler, context switching
- **User accounts** -- separate spaces, permissions
- **Self-hosting** -- the OS compiles itself, assembles itself, boots itself

Every feature on that list should eventually be a .gasm program running
inside the VM, not Rust code in src/.

## The One Rule (Now)

**Everything must be programmable from the keyboard, through pixels.**

If the only way to do something is to edit Rust code in `src/`, we haven't
finished the OS yet. The goal is to sit down at the Geometry OS window,
type on the keyboard, and build programs that run on the screen.

## For AIs, By AIs

Why does this matter?

- AIs think in tokens. Geometry OS thinks in pixels. But pixels ARE bytes,
  and bytes ARE tokens. The mapping is 1:1. An AI doesn't need a compiler
  to write a program here -- it needs to place the right colored pixels in
  the right order. That's it.
- Every program in `programs/` and `lib/` was written by an AI. The micro-
  assembler was written by an AI. The demos were written by an AI. When the
  OS eventually compiles itself, an AI will write that too.
- The test for "is this ready for humans?" is simple: can a human sit down,
  press keys, and build something useful without reading the source code in
  `src/`? If yes, we're done with that layer.

## What This Means in Practice

### DO: Build inside the VM
- Write `.gasm` programs that demonstrate the keystroke-to-pixel pipeline
- Create demo programs (snake, paint, screensaver) written IN .gasm
- Expand `lib/*.gasm` standard library routines
- Write programs that use the keyboard port (0xFFF) for interactive input
- Build the mini-editor and mini-debugger as VM programs
- Build toward: shell, filesystem, windowed apps -- all in .gasm
- Test that programs can be entered via canvas painting (hex/normal mode)

### DON'T: Just add Rust features
- Adding opcodes in `vm.rs` is sometimes necessary -- new opcodes are like
  adding CPU instructions. But they should serve programs, not sit unused.
- Stack overflow protection, memory protection, timer interrupts -- these
  are host-side Rust code. Ship them only when a .gasm program hits the wall.
- The assembler should support what PROGRAMMERS need, not what the VM
  internals need.

## The Test

After any change, ask: "Can I now do something from the keyboard that I
couldn't do before?" If the answer is no, it might still be worth doing,
but it's not the priority.

## Priority Hierarchy

1. **Programs that run on the VM** (.gasm demos, games, tools, shell)
2. **Libraries that those programs use** (lib/*.gasm)
3. **Keystroke-to-pixel UX improvements** (better painting, better live decode)
4. **Assembler features that enable #1-3** (macros, includes, expressions)
5. **New opcodes** (only when a program needs something the VM can't do)
6. **VM hardening** (stack limits, memory protection) -- only when programs
   actually hit the limit

## The Long Arc

```
Where we are          Where we're going
─────────────         ─────────────────
.gasm programs        Full applications
Micro-assembler       Self-hosting compiler
Single process        Multi-tasking OS
Keyboard input        Mouse, audio, network
32x32 canvas          Full windowed desktop
AI-written demos      AI-written OS that humans use
```

## Anti-Pattern: The Rust Treadmill

It's easy to spend weeks adding features to the VM without ever writing a
program that runs on it. The ROADMAP has too many items like "stack overflow
protection" and not enough like "snake game." The snake game is more important
because it forces the system to actually work end-to-end.

A demo program that fails reveals what the VM actually needs. A VM feature
written "just in case" might never get used.

## Anti-Pattern: The Abstraction Trap

Don't build abstractions until two programs need the same thing. Write the
snake game first, THEN notice that snake and paint both need keyboard input,
THEN factor out lib/input.gasm. Building the library before the program that
uses it means you'll build the wrong library.

## Files That Matter

- `docs/KEYSTROKE_TO_PIXELS.md` -- the complete pipeline, the bible
- `docs/NORTH_STAR.md` -- this document, the compass
- `programs/*.asm` -- actual VM programs, the proof the system works
- `lib/*.gasm` -- standard library, what programmers have to work with
- `ROADMAP.md` -- task queue (but read this document first for direction)

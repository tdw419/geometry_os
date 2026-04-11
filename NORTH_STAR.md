# Geometry OS: North Star

An OS for AIs, by AIs, eventually for humans.

## What We're Building

A pixel-level operating system where programs are written in Python-like syntax (.gp), compiled by pixelc, assembled into bytecode, and executed on a custom VM. Every program is a visual artifact -- pixels on a grid.

**The OS IS the shell.** The shell (programs/shell.gasm) runs inside the VM as a regular program. It's not a Rust-side simulation -- it's a VM program using terminal I/O registers and keyboard input, rendering to the 256x256 screen. Every future feature builds on this foundation.

## The Method

**Programs first.** The pixelc compiler is the interface. Write .gp files, compile, run. The VM and assembler are the substrate -- they exist to run programs, not as ends in themselves.

**Rust only when programs need it.** Don't add VM features speculatively. Build programs, hit a wall, then extend the VM.

**The shell is the platform.** Every OS feature should be a shell command first. DIR, RUN, PS, KILL -- the shell IS the operating system. Self-hosting is the end goal.

## The Stack

```
.gp (Python-like source)
  |
pixelc (compiler: .gp -> .gasm)
  |
.gasm (assembly)
  |
assembler (assembler: .gasm -> pixel bytes)
  |
VM (executes pixel bytes, renders to 256x256 screen)
  |
shell.gasm (THE OS -- runs inside the VM)
```

## Current State

- pixelc compiler: variables, arithmetic, control flow, functions, memory ops, drawing
- 7 visual programs + 1 pixel-native shell
- 8 pixelc tests passing, 373+ lib tests, all integration tests green
- Full Rust build (VM + assembler + window manager + API)
- **Pixel-native shell** (programs/shell.gasm) running inside the VM
  - Terminal rendering to 256x256 screen (Vm::render_terminal)
  - Keyboard input via KEY_PORT with YIELD-based polling
  - Commands: CLS, HELP, VER, ECHO

## Success Metric

A self-hosting OS: the shell can compile and run new programs without touching Rust.
Every .gp file is both a test and a demo.

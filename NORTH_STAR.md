# Geometry OS: North Star

An OS for AIs, by AIs, eventually for humans.

## What We're Building

A pixel-level operating system where programs are written in Python-like syntax (.gp), compiled by pixelc, assembled into bytecode, and executed on a custom VM. Every program is a visual artifact -- pixels on a grid.

## The Method

**Programs first.** The pixelc compiler is the interface. Write .gp files, compile, run. The VM and assembler are the substrate -- they exist to run programs, not as ends in themselves.

**Rust only when programs need it.** Don't add VM features speculatively. Build programs, hit a wall, then extend the VM.

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
VM (executes pixel bytes, renders to 200x200 grid)
```

## Current State

- pixelc compiler: variables, arithmetic, control flow, functions, memory ops, drawing
- 5 example programs (simple_add, diagonal, bounce, checkerboard, fib_spiral)
- 51 test lines in pixelc_tests.rs, 5 tests passing
- Full Rust build (VM + assembler + window manager + API)

## Success Metric

A growing library of visual programs that prove the OS works. Every .gp file is both a test and a demo.

# Phase 44 Jit Profiler

## Summary

Track basic block execution counts in the GPU RISC-V interpreter to identify hot paths for SPIR-V JIT compilation.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

A shared memory buffer in the WGSL compute shader that counts executions per basic block (PC address), with periodic CPU readback to identify hot paths (>10k executions).

## Tech Stack

WGSL compute shaders, Rust/WGPU, shared atomics, Phase 42 template LUT for SPIR-V code generation.

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-05-phase-44-jit-profiler.md`

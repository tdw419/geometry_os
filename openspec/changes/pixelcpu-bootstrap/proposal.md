# Pixelcpu Bootstrap

## Summary

Enable "The Map Programs The Map" - edit Pixel assembly code on the infinite map, press Ctrl+Enter, and execute on GPU.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

A GPU-based virtual machine where RAM is a 256×256 storage texture, instructions are 32-bit RGBA pixels, and execution happens via WGSL compute shaders dispatched from Rust.

## Tech Stack

WGSL compute shaders, wgpu-rs, Rust async/await, existing infinite_map_rs codebase

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-05-pixelcpu-bootstrap.md`

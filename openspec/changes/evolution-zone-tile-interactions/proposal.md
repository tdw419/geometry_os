# Evolution Zone Tile Interactions

## Summary

Enable clicking on cartridge tiles to boot them into runnable VM instances.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

- Extend the existing click handling in `InfiniteMapApp` to detect cartridge tile clicks

## Tech Stack

Rust, WGPU, Smithay input handling, RISC-V executor, PixelRTS v2 format

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-09-evolution-zone-tile-interactions.md`

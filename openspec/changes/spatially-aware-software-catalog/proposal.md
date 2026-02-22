# Spatially Aware Software Catalog

## Summary

Build the foundational "PixelCore" utilities that make Geometry OS a spatially-aware operating system where software exists as visible texture on an infinite map.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

We implement spatially-aware versions of core Unix utilities as WASM modules (.rts.png files) that can read/write pixels on the infinite map. Each utility follows the ACE Agent ABI with `think()` as the entry point. The "Screen is the Hard Drive" philosophy means:

## Tech Stack

Rust (wasm32 target), Wasmtime runtime, ACE Runtime, PixelRTS v2 encoding

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-09-spatially-aware-software-catalog.md`

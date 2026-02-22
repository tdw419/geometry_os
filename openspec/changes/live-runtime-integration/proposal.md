# Live Runtime Integration

## Summary

Connect the spatial_cli.py to the actual pixelrts_runtime to execute WASM agents (.rts.png files) live via the ACE runtime, replacing the current Python stubs with real WASM execution.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

1. Create a Rust CLI binary (`pixelrts_runtime`) that loads and executes WASM agents

## Tech Stack

- Rust (Wasmtime runtime, image processing)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-09-live-runtime-integration.md`

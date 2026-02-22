# Evolution Zone Texture Loading

## Summary

Load actual .rts.png cartridge textures and render them as map tiles instead of placeholder windows.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

- Create a `CartridgeTextureManager` similar to `VmTextureManager` and `MemoryTextureManager`

## Tech Stack

Rust, WGPU, image crate, serde

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-09-evolution-zone-texture-loading.md`

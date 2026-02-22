# Shader Execution Zone

## Summary

Enable users to drag WGSL .rts.png shader tiles onto the infinite map, creating live GPU execution zones that compile and run shaders in real-time.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Drag-and-drop system that detects .rts.png tiles, extracts WGSL source from alpha channel, creates WebGPU compute pipelines, renders results to map textures as interactive zones.

## Tech Stack

Rust, WGPU, WebGPU, TypeScript, existing infinite_map_rs compositor

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-06-shader-execution-zone.md`

# Wgsl Shader I64 Compatibility Fix

## Summary

Fix the WGSL shader to remove i64/u64 usage and enable RISC-V GPU VM execution.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

The RISC-V VM shader uses i64/u64 casts for MULH/MULHSU/MULHU instructions to get the upper 32 bits of a 64-bit multiplication result. Since WGSL doesn't support i64, we'll implement 64-bit multiplication using 32-bit operations with manual carry handling.

## Tech Stack

WGSL (WebGPU Shading Language), WGPU 0.19.4, Rust testing infrastructure

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-08-wgsl-shader-i64-compatibility-fix.md`

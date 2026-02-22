# Wasm Swarm Executor Impl

## Summary

Implement 1024-agent parallel WASM execution on GPU via workgroup-per-instance dispatch.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Single GPU dispatch runs N workgroups, each executing one WASM agent with isolated 64KB memory slice from a 64MB pool. Shared bytecode buffer, slab-allocated agent memory, host-side SwarmManager API.

## Tech Stack

Python 3.12, wgpu-py, WGSL compute shaders, NumPy

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-wasm-swarm-executor-impl.md`

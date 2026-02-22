# Phase N Ide Tools Design

## Summary

Enable AI agents to autonomously write, test, debug, and deploy code through WebMCP tools.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Hybrid runtime - browser for WGSL/JS/tests, WebSocket bridge for Python/debug. Four focused tools that leverage existing builder infrastructure.

## Tech Stack

WebMCP, WASM, WGSL shaders, WebSocket bridge, PixiJS

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-phase-n-ide-tools-design.md`

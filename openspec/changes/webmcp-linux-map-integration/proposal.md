# Webmcp Linux Map Integration

## Summary

Enable Linux VM execution results to be visualized as tiles on the PixiJS Infinite Map, with bidirectional input and session health overlays.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Create a `LinuxTileBridge` class that associates Linux sessions with map positions, renders execution output as tiles, and provides WebMCP tools for booting Linux at specific coordinates. Leverage existing patterns from `PyodideTileBridge` and `PixelCPUIntegration`.

## Tech Stack

Python WebSocket bridge, PixiJS v8, WebMCP tools, QEMU/KVM

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-webmcp-linux-map-integration.md`

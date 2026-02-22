# Webmcp Linux Bridge Implementation

## Summary

Enable AI agents to operate Linux via WebMCP by bridging the existing QEMU Alpine instance through a WebSocket server.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Python WebSocket server (`webmcp_linux_bridge.py`) spawns QEMU process, manages serial console I/O, and exposes Linux operations to the JavaScript WebMCP bridge. Single persistent session, command execution with prompt detection.

## Tech Stack

Python 3 (asyncio, websockets), QEMU serial console, JavaScript WebMCP tools

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-13-webmcp-linux-bridge-implementation.md`

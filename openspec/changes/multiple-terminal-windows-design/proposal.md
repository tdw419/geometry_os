# Multiple Terminal Windows Design

## Summary

Enable multiple independent terminal windows on the Geometry OS map with proper focus management.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Refactor map_terminal.py to introduce a TerminalManager that coordinates multiple MapTerminal instances. A single InputServer WebSocket routes keystrokes to the active terminal. Browser-side terminalRegistry mirrors state and handles hit-testing for click-to-focus.

## Tech Stack

Python asyncio, WebSocket, Chrome DevTools Protocol, PixiJS

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-multiple-terminal-windows-design.md`

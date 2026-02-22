# Keyboard Input Capture

## Summary

Enable direct keyboard input to the on-map terminal via click-to-focus interaction model.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Python runs a WebSocket server (port 8765) alongside the CDP client. Browser JavaScript connects to this server to send keystrokes. Click detection on the terminal window toggles focus state. When focused, all key events are forwarded to Python for processing.

## Tech Stack

Python websockets (server), JavaScript WebSocket client, PixiJS hit testing

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-keyboard-input-capture.md`

# Parallel Swarm Demo

## Summary

Create a visual demo showing two AI agents (Researcher + Producer) working in parallel on separate VMs, coordinated via A2A Router, with live visual tiles displayed in the Visual Shell.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Two QEMU VMs running Ubuntu desktop - VM1 runs Firefox for research tasks, VM2 runs Shotcut for video production. Each VM has a Vision Bridge pushing real-time GUI state via WebSocket. A2A Router coordinates agents via broadcast messaging. Visual Shell displays both VMs as draggable VMMonitorTiles with semantic overlays.

## Tech Stack

Python async/await, WebSocket (websockets library), VNC (vncdo), PixiJS, QEMU/KVM, Vision Bridge (Qwen3-VL-8B)

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-18-parallel-swarm-demo.md`

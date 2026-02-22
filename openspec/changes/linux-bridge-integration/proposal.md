# Linux Bridge Integration

## Summary

Connect the on-map terminal to a Linux VM (QEMU or WGPU) instead of running commands on the host.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Create a unified `VMLinuxBridge` interface with multiple backends. The `QEMUBridge` connects to `linux_bridge.py` via WebSocket (:8767) which manages QEMU instances. The `WGPUBridge` connects to `wgpu_linux_hypervisor.js` via Chrome DevTools Protocol.

## Tech Stack

Python websockets, Chrome DevTools Protocol, QEMU serial console, WGPU Linux Hypervisor

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-linux-bridge-integration.md`

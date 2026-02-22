# A2A Coordination Tools

## Summary

Add 4 WebMCP tools for distributed coordination: `a2a_acquire_lock`, `a2a_release_lock`, `a2a_barrier_enter`, `a2a_barrier_wait`.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend webmcp_bridge.js with 4 new tools that communicate with the existing A2A Router backend via WebSocket. The backend already implements lock and barrier primitives in `a2a_router.py`. We just need frontend tools to expose them.

## Tech Stack

JavaScript (WebMCP Bridge), Python (A2A Router), WebSocket, JSON messaging

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-13-a2a-coordination-tools.md`

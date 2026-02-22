# A2A Area Agent Integration

## Summary

Integrate A2A Router with spawned area agents so they can discover peers, send messages, and coordinate via the A2A protocol.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend the existing `spawn_area_agent` WebMCP tool to initialize an A2A client for each spawned agent. The agent will auto-register with the A2A Router backend, enabling peer-to-peer communication with other spawned agents.

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

- Source Plan: `docs/plans/2026-02-13-a2a-area-agent-integration.md`

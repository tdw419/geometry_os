# Webmcp Phase B Implementation

## Summary

Add 4 new WebMCP tools (query_hilbert_address, trigger_evolution, send_llm_prompt, spawn_area_agent) to enable AI agents to access Hilbert spatial data, evolution cycles, LLM communication, and agent spawning.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend existing `webmcp_bridge.js` with hybrid connectivity — pure JS for Hilbert, WebSocket for evolution/agents, HTTP for LLM. Graceful degradation with helpful error messages when backends unavailable.

## Tech Stack

JavaScript (ES6+), WebMCP API (Chrome 146+), HilbertLUT, WebSocket, fetch API

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-12-webmcp-phase-b-implementation.md`

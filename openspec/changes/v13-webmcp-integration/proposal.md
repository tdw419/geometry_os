# V13 Webmcp Integration

## Summary

Connect Evolution Daemon V13 safety pipeline to WebMCP so AI agents can monitor and heal RTS files remotely.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

EvolutionSafetyBridge.js connects browser to Python HTTP server (port 31338), exposing 5 safety tools via WebMCP. AdaptiveRateLimiter already exists in webmcp_bridge.js and reads from `window.EvolutionSafetyBridge`.

## Tech Stack

JavaScript (ES6), FastAPI/uvicorn, fetch API, WebMCP navigator.modelContext

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-16-v13-webmcp-integration.md`

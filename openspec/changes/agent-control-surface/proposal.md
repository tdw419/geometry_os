# Agent Control Surface

## Summary

Create a structured API for AI agents to interact with Geometry OS terminals and file browser through both WebMCP tools and Python APIs.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Layered design with WebMCP tools as thin wrappers calling rich Python APIs exposed via Pyodide. All business logic lives in Python. New `agent_control_surface.py` module handles Pyodide registration.

## Tech Stack

Python (asyncio, dataclasses), JavaScript (WebMCP), Pyodide, Chrome DevTools Protocol

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-agent-control-surface.md`

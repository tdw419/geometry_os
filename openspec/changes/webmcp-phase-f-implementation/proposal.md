# Webmcp Phase F Implementation

## Summary

Enable AI agents to build Geometry OS visually through 6 new WebMCP tools that control the BuilderPanel UI.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Wire WebMCP tool handlers to existing BuilderPanel methods. The BuilderPanel already has placeTile, loadShader, assembleCartridge, preview, getState, undo, clear, and save. We need to add evolveShader, then register all 6 tools in webmcp_bridge.js.

## Tech Stack

JavaScript (ES6+), WebMCP protocol, existing BuilderPanel class

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-webmcp-phase-f-implementation.md`

# Neural Ide Visual Builder

## Summary

Enable AI agents to assemble a functional Neural IDE on the Infinite Map using WebMCP builder tools.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend BuilderPanel with IDE-specific tile types (code_editor, file_browser, terminal, debugger), add a TileConnectionManager for semantic links between components, and create WebMCP tool `builder_connect_tiles` for AI-driven assembly.

## Tech Stack

JavaScript (ES6+), PixiJS v8, WebMCP, WGSL shaders, HTML5

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-neural-ide-visual-builder.md`

# Pyodide Pixijs Integration

## Summary

Enable direct Python script execution in the browser via Pyodide WASM runtime, with output rendered as tiles on the PixiJS Infinite Map.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Pyodide (Python compiled to WebAssembly) runs directly in the browser. A new `PyodideExecutor` class manages the runtime lifecycle, Python code execution, and stdout/stderr capture. WebMCP tools expose Python execution to AI agents. Output can be routed to tile placement on the Infinite Map via the existing `PythonTransmutationLoader` pattern.

## Tech Stack

Pyodide 0.25+, WebMCP API, PixiJS v8, ES6 modules

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-pyodide-pixijs-integration.md`

# Phase N Ide Tools Plan

## Summary

Add 4 WebMCP tools (ide_compile, ide_test, ide_debug, ide_deploy) for AI-assisted development with hybrid runtime support.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

ES module (ide_tools.js) with mock fallbacks, integrated into WebMCP bridge v2.1.0. Browser handles WGSL/JS, bridge handles Python/debug.

## Tech Stack

WebMCP, JavaScript ES6+, WASM mock runners, WebSocket bridge

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-phase-n-ide-tools-plan.md`

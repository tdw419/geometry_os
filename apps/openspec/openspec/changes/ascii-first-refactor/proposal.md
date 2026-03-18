# ASCII-First Architecture Refactor

## Summary

Refactor Session Analyzer to use ASCII as the primary interface with GUI as an optional mirror. This inverts the current architecture where GUI is primary and ASCII is secondary.

## Problem

The current architecture has GUI as the source of truth, with ASCII bolted on as an afterthought. This creates:
- Duplicated state management logic
- Complex synchronization between GUI and ASCII views
- Difficulty for AI agents to control the application
- Tight coupling between presentation and business logic

## Solution

Implement ASCII-First Architecture:
1. **Core Separation**: Extract business logic to `src/core/` (providers, scanner, scheduler, config, LLM)
2. **ASCII State Machine**: Central `AsciiStateStore` with subscription model
3. **Template-Driven Rendering**: ASCII templates in `src/ascii/states/` with Mustache-style variables
4. **API Layer**: `/view` and `/control` endpoints read from ASCII store
5. **GUI Integration**: GUI subscribes to ASCII store and mirrors state
6. **MCP Bridge**: Updated to work with new API

## Benefits

- Single source of truth (ASCII state)
- AI agents can control app via simple `/control {"label": "X"}` endpoint
- GUI becomes optional - app works without it
- Cleaner separation of concerns
- Easier testing (test ASCII output, not GUI pixels)

## Impact

- **Files Modified**: ~15 files
- **Files Created**: ~10 new files
- **Estimated Time**: 10 hours
- **Breaking Changes**: None (API endpoints remain backward compatible)

## References

- Implementation Plan: `/home/jericho/zion/projects/ai_auto_development/ai_auto_development/apps/session-analyzer-app/docs/plans/2026-03-18-ascii-first-refactor.md`
- ASCII-First Pattern: `/home/jericho/zion/projects/ascii_interface/ascii_interface/apps/ascii-ref-app/ASCII-FIRST_PATTERN.md`
- Existing Team: `ascii-interface-instrumentation-team.yaml` (initial ASCII implementation)

## Approval

- [ ] Architecture review
- [ ] Implementation plan approved
- [ ] Team assigned

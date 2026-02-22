# Multi Agent Collaboration Demo

## Summary

Build a working demo where 3 agents collaborate using locks, barriers, and task delegation to scan and process regions of an infinite map.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Browser-based simulation with 3 agent workers (Scanner, Processor, Coordinator). Each agent connects to the A2A Router via WebSocket, uses coordination primitives for synchronization, and displays real-time progress in a visual dashboard.

## Tech Stack

JavaScript (Web Workers), WebSocket, A2A Router (Python), HTML/CSS for UI

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-14-multi-agent-collaboration-demo.md`

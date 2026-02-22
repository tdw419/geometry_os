# Autonomous Improvement Daemon

## Summary

Create a background daemon that autonomously detects failing tests, generates fixes, validates them, and commits successful fixes without human intervention.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

A polling daemon monitors test suite output. When failures are detected, it analyzes the failing test and code, generates a fix using the existing WebMCP ide_compile/ide_test tools, validates the fix passes all tests, then commits the change. All operations are scoped to a configurable "safe" directory to prevent touching core infrastructure.

## Tech Stack

Python 3.12+, pytest, subprocess, WebMCP Bridge, existing ide_* tools

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-autonomous-improvement-daemon.md`

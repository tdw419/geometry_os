# Visual File Browser Design

## Summary

Create a spatial file browser where files are first-class objects on the infinite map.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Python script (`file_browser.py`) uses VMLinuxBridge to execute `ls -la`, parses output into FileInfo objects, calculates spatial positions via layout engine, and renders color-coded tiles via CDP to PixiJS.

## Tech Stack

Python asyncio, VMLinuxBridge, Chrome DevTools Protocol, PixiJS

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-visual-file-browser-design.md`

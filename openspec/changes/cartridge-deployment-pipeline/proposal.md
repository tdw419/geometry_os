# Cartridge Deployment Pipeline

## Summary

Enable automatic creation of `.rts.png` cartridges from code changes via `ide_deploy` WebMCP tool.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Extend `ide_deploy` from mock to real implementation. Connect to PixelRTS v2 core library for Hilbert encoding, add a Python backend bridge for file collection and cartridge assembly, and integrate with the BuilderPanel UI for visual feedback.

## Tech Stack

JavaScript (WebMCP), Python (PixelRTS v2 Core), WebSocket bridge, PNG encoding

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-cartridge-deployment-pipeline.md`

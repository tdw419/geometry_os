# Ai Pm Cartridge Integration

## Summary

Connect AI PM analysis to automatic cartridge creation, enabling an autonomous improvement loop where the system identifies code improvements, validates them, and deploys as .rts.png cartridges.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

Create a new WebMCP tool `pm_analyze_and_deploy` that bridges the existing ContinuousImprovementModule to the new cartridge deployment pipeline. The tool analyzes code/telemetry, generates recommendations, compiles changes via ide_compile, validates via ide_test, and deploys via ide_deploy.

## Tech Stack

JavaScript (WebMCP), Python (AI PM), HTTP bridge, CartridgeAssembler

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-15-ai-pm-cartridge-integration.md`

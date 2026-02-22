# V13 Metabolism Dashboard

## Summary

Create a real-time visual dashboard in the Visual Shell to monitor Geometry OS "metabolism" (CPU/MEM/Throttle) and RTS health prognostics using the existing V13 EvolutionSafetyBridge.

## Motivation

This change implements the architecture described below, enabling spec-driven development
and verification of the implementation.

## Architecture

MetabolismDashboard.js inherits UI patterns from PerformanceDashboard.js. It polls `window.EvolutionSafetyBridge` every 3 seconds for CPU/MEM/throttle data and displays: circular metabolism meters, throttle status indicator (green/yellow/red), and a prognostics feed showing recent RTS health predictions.

## Tech Stack

PixiJS v8.1.0, ES6 Classes, EvolutionSafetyBridge (port 31338), CSS-in-JS styling patterns

## Files

| File | Purpose |
|------|---------|
| (See tasks.md for detailed file list) | |

## Success Criteria

- [ ] All tasks in tasks.md are completed
- [ ] Tests pass
- [ ] Documentation updated

## Related

- Source Plan: `docs/plans/2026-02-17-v13-metabolism-dashboard.md`

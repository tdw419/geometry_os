# Proposal: Geometry Development Kit (GDK)

## Problem
Currently, creating a new "Glass App" requires copying ~200 lines of WebSocket logic, window management, and PixiJS setup. This prohibits rapid self-replication. Additionally, visual styles are hardcoded, leading to inconsistency.

## Solution
Formalize a designated **Geometry Development Kit (GDK)** (`@geometry-os/sdk`) as a monorepo of packages:
- `@geometry-os/core`: Pure logic, networking, FS.
- `@geometry-os/ui`: Visual Shell components (GlassPanel, Buttons).
- `@geometry-os/kernel`: App lifecycle and sandboxing.
- `@geometry-os/cli`: Tooling for scaffolding and building.

## Impact
- **Architecture**: Enforces the "Geometry OS Aesthetic" globally.
- **Velocity**: Reduces app bootstrap time by 90%.
- **Phase 19 Target**: Provides a standard library for the Distributed Build System.
- **PAS Score**: Improves Symmetry by structuring ad-hoc frontend code.

## Risks
- Early abstraction might be leaky.
- Migration of existing apps (`system_monitor`) requires effort.

# Proposal: Phase 40.4 - Self-Hosted Builder

## Problem
Currently, the "Source City" (the visual representation of the codebase as 3D pillars) is generated offline using `source_loader.py` and then loaded via a JSON file passed as a command-line argument to the compositor. To achieve full self-hosting and the "Screen is the Hard Drive" vision, the OS must be able to trigger its own rebuilding process from within the infinite map.

## Solution
Integrate the `source_loader.py` logic into the live execution environment. We will use the existing `infinite_builder.py` daemon as the backend executor. A specialized "Builder Tile" will be added to the map. When interacted with (e.g., Right Click or dragging the codebase onto it), it will trigger a background job to scan the current project directory and regenerate the `city.json` manifest, effectively "refreshing" the world the user is standing in.

## Impact
- **Self-Hosting**: The OS can now evolve and visualize its own evolution without leaving the map.
- **Improved Workflow**: No need to drop to the terminal to see code changes reflected as pillars.
- **Recursive Growth**: The OS can now programmatically trigger builds based on its own internal state.

# Phase 20: Self-Evolution (The First Recursive Build)

## Objective
Use the **Phase 19 Distributed Build System** to compile the **Geometry Development Kit (GDK)** based "New Shell". This validates the "closed loop" where the OS builds its own next version.

## The Workload
We are not just verifying a parser; we are verifying the **Hardware Abstraction Layer**.
1. **Source**: `systems/visual_shell/next_gen/*` (v8 Native)
2. **Build Tool**: `vite build` (running inside the ephemeral build container)
3. **Artifact**: `dist/index.html` + assets
4. **Target**: `index.v8.html` (to be served alongside v7)

## The Job Manifest
We will submit a `JobManifest` to the `BuildOrchestrator` containing:
- **Job 1**: Install Dependencies (`npm ci`)
- **Job 2**: Build GDK (`vite build systems/sdk`) - *Simulated for now via direct file copy or simple concatenation if npm is heavy*
- **Job 3**: Build Shell (`vite build systems/visual_shell/next_gen`)

## Constraints & Tuning
- **9p msize**: 512,000 bytes (Confirmed)
- **OverlayFS**: Active on `/mnt/host_shared` inside the worker.
- **Timeout**: 600s (Initial install might be slow)

## Success Criteria
- `orchestrator.py` reports `Job Status: COMPLETED`
- `dist/index.html` exists in `systems/visual_shell/next_gen/dist`
- The "New Shell" can be opened and renders a black screen (or basic v8 context) without crashing.

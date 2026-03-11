# Proposal: Distributed Build System (Phase 19)

## 1. Context
Phase 18 successfully implemented "The Nursery," proving that a single `ubuntu.rts.png` visual container can compile code injected from the host. This establishes the recursive loop. The next logical step, Phase 19, is to scale this horizontally.

## 2. Objective
Create a **Distributed Build System** that orchestrates multiple visual containers (Build Workers) to compile distinct components of Geometry OS in parallel.

## 3. Scope
- **Orchestrator**: A host-side Python system to manage a pool of Worker VMs.
- **Job Dispatch**: Mechanism to split a build target (e.g., a crate or module list) into unit jobs.
- **Worker Management**: Spawning, monitoring, and terminating `qemu` instances for each worker.
- **Result Aggregation**: Collecting binaries and logs from all workers into a final build artifact.
- **Visualization**: Representing the "Build Farm" on the Infinite Desktop (e.g., a grid of glowing, active nodes).

## 4. Implementation Strategy
- **Base Artifact**: Reuse `ubuntu.rts.png` (proven in Phase 18).
- **Communication**: Parallel 9p mounts (e.g., `/tmp/geometry_os/build/worker_01`, `/tmp/geometry_os/build/worker_02`).
- **Concurrency**: Use Python `asyncio` to manage QEMU subprocesses non-blocking.
- **Visual Integration**: The `BuildOrchestrator` should report status to `HarmonicHub` or `InfiniteDesktopServer` so the UI can verify the swarm.

## 5. Success Criteria
- [ ] At least 3 concurrent worker VMs spwaned.
- [ ] Distinct compilation jobs assigned to each.
- [ ] All jobs complete and artifacts aggregated.
- [ ] Visual UI shows the status of each worker.
- [ ] Total build time < Sequential build time (demonstrated).

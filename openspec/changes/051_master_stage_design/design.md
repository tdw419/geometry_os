# OpenSpec 051: Master Stage - Visual Self-Evolution (V14)

## 1. Executive Summary
The **Master Stage** represents the transition from AI verifying external code changes (**Journeyman Stage**) to the AI modifying its own core visual capabilities. This completes the recursive self-improvement loop for the visual shell and perception systems. V14 introduces the **Mirror Validation** phase to ensure safety during self-modification.

## 2. Motivation
In the Journeyman Stage, the AI is a "verifier". In the Master Stage, the AI becomes an "architect"—it can modify its own `VisualVerificationService` to improve its perception logic. This requires a "Mirror Neuron" approach where the AI can "see itself seeing" before committing changes.

## 3. Technical Design

### A. Capability Evolution Strategies
The AI targets four primary "Capability Tracks":
1.  **Verification Criteria**: Heuristics for UI element classification (e.g., what makes a "critical" element).
2.  **Rendering Logic**: How the `evolution_daemon` places and renders tiles on the infinite map.
3.  **Shader Parameters**: Real-time adjustment of WGSL shaders for performance/visual clarity.
4.  **Spatial Heuristics**: Global rules for layout and "biological" tile placement.

### B. Recursive Safety Pipeline (V14)
We extend the existing 8-phase pipeline to **9 phases** by inserting **MIRROR_VALIDATE** after SANDBOX.

**The 9-Phase Pipeline:**
1.  **ORIGINATE**: Proposal creation.
2.  **SANDBOX**: Static/Unit test validation (Subprocess).
3.  **MIRROR_VALIDATE (NEW Phase 3)**: Perception Benchmark validation (Subprocess).
4.  **GUARDIAN**: AI-powered code & safety review.
5.  **TIER**: Risk classification.
6.  **COMMIT**: Atomic persistence to Git.
7.  **VISUAL_VERIFY**: Real-world verification of the *intended* change.
8.  **MONITOR**: Post-commit health tracking.
9.  **RECOVER**: Automated rollback on regression.

### C. Mirror Validation Details
Implemented via `SubprocessMirrorBridge`. It spawns an isolated "Shadow" process that:
1.  Loads a temporary "Phantom" copy of the modified perception code.
2.  Runs the `perception_benchmark.py` suite.
3.  Compares "Old Eyes" vs "New Eyes" performance using the **Balanced Validation Matrix**.

**Balanced Validation Matrix:**
- **Safety (Immortality)**: MUST still find the Terminal and core UI Anchors. (MANDATORY)
- **Accuracy**: Detection rate and spatial logic must not regress. (MANDATORY)
- **Precision**: Pixel-delta improvements. (ADVISORY)
- **Performance**: Latency and RAM overhead. (ADVISORY)

### D. Phantom Tile UI Integration
During Phase 3, a **Cyan Debug Overlay** is rendered on the Infinite Map via WebMCP:
- Split-pane comparison (Red = Old Eyes, Green = New Eyes).
- Stability Meter showing real-time PAS (Phase Alignment Stability).

## 4. Rollback & Recovery
1.  **Genetic Snapshot**: Before a Master Stage evolution, a snapshot of `visual_verification_service.py` is taken.
2.  **Primordial Rollback**: If MIRROR_VALIDATE fails Immortality checks, the mutation is discarded immediately.
3.  **Post-Commit Recovery**: If Phase 9 (RECOVER) is triggered, the system restores the Genetic Snapshot.

## 5. Implementation Roadmap
- [x] Phase 1: Foundation (`MasterStage` class, `CapabilityType`, `VisualCapabilityProposal`)
- [x] Phase 2: Mirror Bridge (`SubprocessMirrorBridge`, `shadow_perception_runner.py`)
- [x] Phase 3: Pipeline Integration (9-phase `safe_evolve` with MIRROR_VALIDATE)
- [ ] Phase 4: Visual Feedback (WebMCP Cyan Overlay) - Optional enhancement

## 6. Success Criteria
- AI successfully proposes and applies a modification to `visual_verification_service.py`.
- 100% pass rate on "Immortality Benchmarks" after modification.
- Automated rollback successfully handles a "Lethal Mutation" (broken perception).

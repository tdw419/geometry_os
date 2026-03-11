# Tasks: manual-phase_42__robustness___safety__safe_exploration_

- [x] **Task 1**: **Goal**: Phase 42: Robustness & Safety (Safe Exploration)

**Description**: *Problem**: Random exploration in an OS is dangerous (e.g., `rm -rf /`). *Solution**: Constrain the action space based on safety rules.

**Key Deliverables**:
- **Task 1: Action Masking**
- Implement a `SafetyLayer` that outputs a binary mask for valid actions.
- Filter out dangerous clicks or commands before they reach the environment.
- **Task 2: Curiosity-Driven Exploration**
- Implement Intrinsic Curiosity Module (ICM).
- Reward agent for finding *novel states* rather than just random actions.
- Prevents getting stuck in "TV Trap" (staring at changing numbers) vs useful exploration.
  - **Acceptance Criteria**:
    - All requirements for 'Phase 42: Robustness & Safety (Safe Exploration)' are implemented and functional.
  - **Estimated Effort**: Medium


## Summary
- **Total Tasks**: 1
- **Estimated Complexity**: Medium
- **Dependencies**: None

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-phase_42__robustness___safety__safe_exploration_*
*Last Updated: 2026-02-05T10:47:43.827861*

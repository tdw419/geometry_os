# Geometry OS: Project Goal

## Objective
Implement and verify the **Ouroboros Spine** (Phase 56) and **Dreaming Kernel** (Phase 57) integration, focusing on fixing the 66 test collection errors and achieving 60 FPS on the infinite map compositor.

## Current Phase
- [ ] Fix 66 test collection errors (run `pytest --collect-only` to identify).
- [ ] Verify `sisyphus_v4.py` brain mutations are correctly tracked in `evolution_daemon_v8.py`.
- [ ] Integrate `infinite_map_rs` WGPU rendering with the PixiJS visual shell.

## Success Criteria
- [ ] 0 test collection errors.
- [ ] `make test` passes with >80% coverage.
- [ ] `python3 sisyphus_v4.py --brain` runs for 100 rounds without failure.

## Constraints
- **Performance:** Maintain <200MB memory for the compositor.
- **Safety:** Do not allow brain mutations to escape the `evolution_daemon` sandbox.

## Completion Signal
When all criteria are met, end your response with: TASK COMPLETE

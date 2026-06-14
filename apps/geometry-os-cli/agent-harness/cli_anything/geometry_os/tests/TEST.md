# Test Plan: Geometry OS CLI

## Test Inventory Plan
- `test_core.py`: 4 unit tests planned
- `test_full_e2e.py`: 2 E2E tests planned

## Unit Test Plan
- `GeosBackend`: Test path resolution and command building.
- `CLI`: Test help and command parsing.

## E2E Test Plan
- Crystallization Workflow: `vmlinux` -> `.rts.png`
- Map Workflow: Launching the compositor.

## Realistic Workflow Scenarios
### Workflow: Linux-to-Map
1. `geo crystallize geometric vmlinux out.png`
2. `geo map --brick out.png`
3. Verified: `out.png` exists and `geo map` returns a PID.

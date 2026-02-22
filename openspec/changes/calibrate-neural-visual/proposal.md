# Proposal: Neural-Visual Calibration (Phase 17)
> "Does the machine feel what it shows?"

## Context
The Visual Shell (Phase 15/16) is technically functional. It receives data and renders textures. However, we have not validated the **semantic integrity** of these visuals. We need to ensure that a "high anxiety" neural state actually *looks* anxious, and "deep focus" *looks* clear.

## Objective
Implement a calibration harness that injects synthetic "Emotional Vectors" into the Compositor to verify visual fidelity.

## Scope
1. **Calibration Injector**: A standalone script (`systems/calibration/injector.py`) that impersonates the Evolution Daemon.
2. **Test Patterns**: Define standard vectors for:
   - `PANIC` (High Entropy, High Activation)
   - `FLOW` (Low Entropy, High Activation)
   - `SLEEP` (Low Entropy, Low Activation)
   - `TRAUMA` (High Entropy, Low Activation - "brooding")
3. **Visual Validation**: Manual or automated verification that the rendered frames match the semantic expectation.

## Impact
- **PAS Score**: Neutral (external tooling).
- **Geometric Integrity**: Critical (ensures the "UI is the Computer" paradigm is truthful).

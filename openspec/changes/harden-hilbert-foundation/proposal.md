# Proposal: Harden Hilbert Foundation (Bit-Perfect Storage Proof)

## Summary
Implement a rigorous integration test suite for the PixelRTS v2 format to prove 100% bit-perfect data integrity across the `Binary -> RTS.PNG -> Binary` transformation. This establishes the "Ground Truth" foundation required for all other Geometry OS systems.

## Motivation
The "Screen is the Hard Drive" paradigm relies on the visual substrate being a reliable storage medium. Any corruption in the Hilbert mapping or PNG encoding/decoding pipeline renders the entire OS unstable. By hardening this layer first, we ensure that:
1. Autonomous repair (Ouroboros) operates on valid data.
2. GPU-native execution (Golden Path) uses exact kernel bytes.
3. The spatial filesystem (Infinite Map) is trustworthy.

## Architecture
- **Tooling**: Utilize `pixelrts_v2_converter.py` and `pixelrts_v2_extractor.py`.
- **Validation**: SHA256 hashing of source and extracted binaries.
- **Coverage**: 
    - Small payloads (1KB)
    - Kernel-sized payloads (10MB+)
    - Edge cases (Empty, single-byte, power-of-2 boundaries)
    - Locality verification (Visual check of Hilbert clustering)

## Success Criteria
- [ ] SHA256 matches exactly for all payload sizes.
- [ ] Zero metadata drift in `.rts.meta.json`.
- [ ] Hilbert locality preserved (visually verified via generated thumbnails).
- [ ] Test suite integrated into CI.

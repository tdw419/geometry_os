# Tasks: Crystallize Antigravity Agent

- [x] **Refine Converter**
    - [x] Update `antigravity_rts_converter.py` to support full configuration injection.
    - [x] Implement `inject_logic_kernel()` with actual `VisualOSAgent` rules.
    - [x] Ensure Hilbert Curve mapping is consistent with `MemoryTextureManager`.

- [x] **Update PixelRTS Specification**
    - [x] Add `Logic_Kernel` metadata field to `PIXELRTS_FORMAT_SPEC.md` or equivalent spec.
    - [x] Define the interface between the Brain Texture and the Compute Kernel.

- [x] **Integrate with Daemons**
    - [x] Create `systems/vectorland/antigravity_bridge.py` to load and interact with the `.rts` agent.
    - [x] Modify `unified_cognitive_daemon.py` to optionally offload reasoning to the `.rts` agent.

- [x] **Verify & Validate**
    - [x] Generate `antigravity.pixelrts.png`.
    - [x] Verify metadata integrity using `pixelrts_extractor.py` (if available, or creating a checker).
    - [x] Validate visual integrity (PAS check).

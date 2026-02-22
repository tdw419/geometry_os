# Implementation Tasks: RTS Asset Pipeline

## Phase 1: The Asset Injector (Python)
- [x] Create `systems/vectorland/rts_injector.py`.
    - [x] Implement `inject_rts_metadata(image_path, script_content, output_path)`.
    - [x] Implement `render_text_overlay(image, text_map)`.
    - [x] Add `iTXt` chunk support using `Pillow.PngInfo`.
    - [x] Add CRC/Integrity helper verification (optional but recommended).

## Phase 2: Spec Formalization
- [x] Update `openspec/changes/add-rts-asset-pipeline/specs/rts-ecosystem/spec.md`.

## Phase 3: Validation
- [x] Create a test script `test_rts_pipeline.py` to:
    - [x] Generate a dummy `.rts.png`.
    - [x] Read it back and verify metadata exists.
    - [x] Verify visual text rendering.

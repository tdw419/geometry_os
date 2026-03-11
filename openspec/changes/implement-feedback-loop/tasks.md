# Implementation Tasks: Neural-Visual Feedback Loop

## 1. Daemon Infrastructure
- [x] Create `systems/neural_cortex/vision.py` for decoding RLE/Base64.
- [x] Update `systems/calibration/injector.py` to import `vision.py`.
- [x] Add `VisualThoughtReady` handler to `injector.py`.

## 2. Vision Logic
- [x] Implement `decode_feedback(data) -> Image`.
- [x] Implement `analyze_frame(image) -> dict` (brightness, dominance).

## 3. Reflex Implementation (Homeostasis)
- [x] Implement "Bright Flash" dampening in `injector.py` state machine.
- [x] Implement "Void Stare" stimulation.

## 4. Verification
- [x] Run `run_calibration.sh` and verify injector logs "I SEE RED".
- [x] Verify that sending "PANIC" (High brightness) triggers a dampening response.

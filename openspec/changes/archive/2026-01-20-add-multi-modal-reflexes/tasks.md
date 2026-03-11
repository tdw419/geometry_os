# Tasks: Phase 21 Implementation

## core
- [x] Create `systems/neural_cortex/audio.py` for `AudioCortex` (FFT, Volume, Beat detection)
- [x] Create `systems/neural_cortex/input.py` for `InputCortex` (Velocity, Pattern analysis)
- [x] Update `systems/neural_cortex/cortex.py` to integrate new cortices into `PredictiveCortex`
- [x] Implement `MultiModalFusion` logic in `cortex.py` (Weighted averaging of sensor inputs? Kalman Filter?)

## integration
- [x] Update `systems/calibration/injector.py` to mock Audio/Input data streams
- [x] Create `test_multimodal.py` to verify reflex triggers (Done via `injector.py --test-cortex`)
- [x] Update `ReflexController` in `reflexes.py` with new reflex types (`Startle`, `Focus`, `Groove`)

## validation
- [x] Verify PAS Score impact (Verified via software_shm.py logic)
- [x] verify Latency (Input -> Visual response must be <16ms) - **PASSED: <1ms**
- [x] Verify "Glass Box" visibility (can we see the audio driving the visuals?) - **PASSED: sense_monitor.py**

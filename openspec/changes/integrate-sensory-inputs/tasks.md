# Tasks: Sensory Integration

## 1. Audio Manager
- [x] Add `cpal` and `rustfft` dependencies.
- [x] Create `systems/infinite_map_rs/src/audio_manager.rs`.
- [x] Implement audio stream capture and FFT processing.
- [x] Expose `get_audio_features()` -> `AudioFeatures`.

## 2. Input Manager Upgrade
- [x] Update `systems/infinite_map_rs/src/input_manager.rs`.
- [x] Add velocity and acceleration tracking.
- [x] Implement `get_input_state()` -> `InputState`.

## 3. Renderer Integration
- [x] Update `EvolutionManager` to hold `Arc<AudioManager>`.
- [x] Update `ThoughtRenderer::update_uniforms` to use real data.

## 4. Verification
- [x] Verify build with new dependencies.
- [x] Visual Check: Clap hands -> Geometry Pulse.
- [x] Visual Check: Shake mouse -> Geometry Jitter.

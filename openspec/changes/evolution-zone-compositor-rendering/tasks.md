# Evolution Zone Compositor Rendering - Tasks

## 1. Python - Emit CARTRIDGE_CREATED Resonance

- [ ] Modify ``evolution_daemon_v8.py:1040-1070` (_process_evolved_genome method)`

## 2. Rust - Create CartridgeRegistry Module

- [ ] Create ``systems/infinite_map_rs/src/cartridge_registry.rs``

## 3. Rust - Poll Resonances in EvolutionManager

- [ ] Modify ``systems/infinite_map_rs/src/evolution_manager.rs:22-41` (struct definition)`

## 4. Rust - Render Cartridges in Compositor

- [ ] Modify ``systems/infinite_map_rs/src/app.rs:3300-3400` (infinite map rendering)`

## 5. End-to-End Integration Test

- [ ] Create ``tests/integration/test_evolution_zone_full_flow.py``

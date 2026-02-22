# Rts Amp Geometry Os Integration - Tasks

## 1. Research .rts.png Format and Model Conversion

- [ ] Read: `systems/pixel_converter/pixelrts_converter_v2.py` (reference implementation)

## 2. Create BF16-Aware Model Exporter

- [ ] Create ``systems/pixel_compiler/amp_rts_exporter.py``

## 3. Create Model Importer for Round-Trip Testing

- [ ] Create ``systems/pixel_compiler/amp_rts_importer.py``

## 4. Create Training Pipeline with Auto-Export

- [ ] Create ``systems/pixel_compiler/amp_rts_training_pipeline.py``

## 5. Create Demo Script for End-to-End Workflow

- [ ] Create ``systems/pixel_compiler/demo_amp_to_riscv.py``

## 6. Create Documentation

- [ ] Create ``systems/pixel_compiler/docs/amp_geometry_os_integration_guide.md``

## 7. Integration Testing with RISC-V GPU VM

- [ ] Create ``systems/infinite_map_rs/tests/amp_model_integration_test.rs``

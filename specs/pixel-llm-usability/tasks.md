# Tasks

## Phase 1: Beam Search Decoder

- [x] 1.1 Create decoding module directory
  - **Do**: Create `geometry_os/systems/pixel_llm/decoding/` directory
  - **Files**: geometry_os/systems/pixel_llm/decoding/
  - **Done when**: Directory exists
  - **Verify**: ls -la geometry_os/systems/pixel_llm/decoding/
  - **Commit**: chore(pixel-llm): create decoding module directory

- [x] 1.2 Create beam search decoder
  - **Do**:
    - Create `geometry_os/systems/pixel_llm/decoding/beam_search.py` with BeamSearchDecoder class
    - Extract and refactor beam search logic from inference.py
    - Implement decode() method returning (tokens, scores)
    - Support early stopping, length penalty, repetition penalty
  - **Files**: geometry_os/systems/pixel_llm/decoding/beam_search.py
  - **Done when**: BeamSearchDecoder class exists with decode method
  - **Verify**: grep -q "class BeamSearchDecoder" geometry_os/systems/pixel_llm/decoding/beam_search.py
  - **Commit**: feat(pixel-llm): add beam search decoder module

- [x] 1.3 Create greedy decoder (fallback)
  - **Do**:
    - Create `geometry_os/systems/pixel_llm/decoding/greedy.py` with GreedyDecoder class
    - Extract and refactor greedy decoding logic from inference.py
    - Implement decode() method returning (tokens, scores)
    - Support temperature sampling, top-k, top-p
  - **Files**: geometry_os/systems/pixel_llm/decoding/greedy.py
  - **Done when**: GreedyDecoder class exists with decode method
  - **Verify**: grep -q "class GreedyDecoder" geometry_os/systems/pixel_llm/decoding/greedy.py
  - **Commit**: feat(pixel-llm): add greedy decoder module

- [x] 1.4 Create decoding package init
  - **Do**:
    - Create `geometry_os/systems/pixel_llm/decoding/__init__.py`
    - Export BeamSearchDecoder, GreedyDecoder classes
    - Export GenerationConfig, BeamCandidate types
    - Add utility functions for decoder selection
  - **Files**: geometry_os/systems/pixel_llm/decoding/__init__.py
  - **Done when**: __init__.py exports decoder classes
  - **Verify**: grep -q "BeamSearchDecoder\|GreedyDecoder" geometry_os/systems/pixel_llm/decoding/__init__.py
  - **Commit**: feat(pixel-llm): add decoding package exports

## Phase 3: Compositor Integration

- [x] 3.1 Create compositor module directory
  - **Do**: Create `systems/pixel_llm/compositor/` directory
  - **Files**: systems/pixel_llm/compositor/
  - **Done when**: Directory exists
  - **Verify**: ls -la systems/pixel_llm/compositor/
  - **Commit**: chore(pixel-llm): create compositor module directory

- [x] 3.2 Create simple integration API
  - **Do**:
    - Create `systems/pixel_llm/compositor/api.py` with CompositorIntegrator class
    - Implement CompositorConfig dataclass for configuration
    - Add quick_caption() convenience function
    - Support async frame captioning, batch processing, and caching
  - **Files**: systems/pixel_llm/compositor/api.py
  - **Done when**: api.py exports CompositorIntegrator, CompositorConfig, quick_caption
  - **Verify**: grep -q "class CompositorIntegrator" systems/pixel_llm/compositor/api.py
  - **Commit**: feat(pixel-llm): add compositor integration API

- [x] 3.3 Create compositor package init
  - **Do**:
    - Create `systems/pixel_llm/compositor/__init__.py`
    - Export CompositorIntegrator, CompositorConfig, quick_caption
    - Add module documentation and quick start guide
  - **Files**: systems/pixel_llm/compositor/__init__.py
  - **Done when**: __init__.py exports compositor classes
  - **Verify**: grep -q "CompositorIntegrator\|CompositorConfig" systems/pixel_llm/compositor/__init__.py
  - **Commit**: feat(pixel-llm): add compositor package exports

- [x] 3.4 Create compositor example
  - **Do**:
    - Create `systems/pixel_llm/compositor/example.py` with usage examples
    - Include quick_caption, integrator basic usage, batch captioning examples
    - Add real-time webcam captioning example (optional)
    - Add file batch processing example
  - **Files**: systems/pixel_llm/compositor/example.py
  - **Done when**: example.py contains multiple usage examples
  - **Verify**: grep -q "example_1_quick_caption\|example_2_integrator_basic" systems/pixel_llm/compositor/example.py
  - **Commit**: feat(pixel-llm): add compositor integration examples

## Phase 6: Documentation

- [x] 6.1 Create webcam demo documentation
  - **Do**:
    - Create `systems/pixel_llm/docs/webcam_demo_guide.md` with comprehensive webcam demo guide
    - Include installation instructions, usage examples, troubleshooting
    - Document command-line options and programmatic usage
    - Add performance tuning tips
  - **Files**: systems/pixel_llm/docs/webcam_demo_guide.md
  - **Done when**: webcam_demo_guide.md exists with complete documentation
  - **Verify**: grep -q "Webcam Demo Guide" systems/pixel_llm/docs/webcam_demo_guide.md
  - **Commit**: docs(pixel-llm): add webcam demo documentation

- [x] 6.2 Create compositor integration guide
  - **Do**:
    - Create `systems/pixel_llm/docs/compositor_integration_guide.md` with integration guide
    - Document quick_caption function and CompositorIntegrator class
    - Include configuration options, encoder types, and usage patterns
    - Add examples for real-time captioning, batch processing, and API endpoints
  - **Files**: systems/pixel_llm/docs/compositor_integration_guide.md
  - **Done when**: compositor_integration_guide.md exists with complete documentation
  - **Verify**: grep -q "Compositor Integration Guide" systems/pixel_llm/docs/compositor_integration_guide.md
  - **Commit**: docs(pixel-llm): add compositor integration documentation

- [x] 6.3 Create custom training guide
  - **Do**:
    - Create `systems/pixel_llm/docs/custom_training_guide.md` with training guide
    - Document dataset preparation (text and JSON formats)
    - Include training loop examples, checkpoint management, and best practices
    - Add complete training script example
  - **Files**: systems/pixel_llm/docs/custom_training_guide.md
  - **Done when**: custom_training_guide.md exists with complete documentation
  - **Verify**: grep -q "Custom Training Guide" systems/pixel_llm/docs/custom_training_guide.md
  - **Commit**: docs(pixel-llm): add custom training documentation

## Phase 7: Verification

- [x] 7.1 [VERIFY] End-to-end webcam demo
  - **Do**:
    - Verify webcam_demo.py script exists and is runnable
    - Check that all required dependencies are installed
    - Verify the script can import required modules
    - Test basic functionality without camera (syntax/import check)
  - **Files**: systems/pixel_llm/examples/webcam_demo.py
  - **Done when**: Webcam demo script verified working
  - **Verify**: python3 -m py_compile systems/pixel_llm/examples/webcam_demo.py && python3 -c "import sys; sys.path.insert(0, 'systems/pixel_llm'); from examples import webcam_demo; print('Import OK')"
  - **Commit**: test(pixel-llm): verify webcam demo end-to-end

- [x] 7.2 [VERIFY] Integration example works
  - **Do**:
    - Verify compositor/example.py script exists and is runnable
    - Check that all required dependencies are installed
    - Verify the script can import required modules
    - Test basic functionality (syntax/import check)
  - **Files**: systems/pixel_llm/compositor/example.py
  - **Done when**: Integration example script verified working
  - **Verify**: python3 -m py_compile systems/pixel_llm/compositor/example.py && python3 -c "import sys; sys.path.insert(0, 'systems/pixel_llm'); from compositor import example; print('Import OK')"
  - **Commit**: test(pixel-llm): verify integration example

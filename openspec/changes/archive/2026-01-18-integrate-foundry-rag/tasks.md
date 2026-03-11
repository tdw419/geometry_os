# Tasks: Integrate Foundry RAG

- [x] **Task 1**: Verify `foundry_daemon.py` handles missing RAG dependencies gracefully (ImportError checks).
- [x] **Task 2**: Create a dummy `test_sky.intent` file in `systems/infinite_map_rs/src/intents/`.
- [x] **Task 3**: Run `foundry_daemon.py` and verify it detects the intent.
- [x] **Task 4**: Verify it generates `test_sky.wgsl` in `systems/infinite_map_rs/src/shaders/` (or configured output).
- [x] **Task 5**: Verify logs show "Searching Knowledge Base" (if RAG deps present) or graceful skip.
- [x] **Task 6**: Ensure generated WGSL is valid (basic check).

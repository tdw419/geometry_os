# Tasks: Implement Optical Python Scripting

## Phase 1: Foundry Upgrade
- [x] Create `systems/infinite_map_rs/src/scripts/` directory.
- [x] Update `foundry_daemon.py` to watch `.py` files in `src/scripts` and output to `assets/scripts`.
- [x] Verify `tensor_fold.py` correctly handles `.py` files (auto-detect format).

## Phase 2: Optical Script Loader (Rust)
- [x] Modify `systems/infinite_map_rs/src/python_runtime.rs` to expose `execute_script` publicly if not already.
- [x] Create `systems/infinite_map_rs/src/foundry/script_loader.rs`:
    - Logic to load `.brick` -> String (using `OpticalShaderLoader` logic or shared code).
    - Logic to pass String -> `python_context.execute_script()`.
- [x] Integrate into `main.rs` or `app.rs` to load scripts at startup.

## Phase 3: Hot Reloading
- [x] Implement hot-reload watcher for `.brick` scripts in `app.rs` (similar to shader hot-reload).
- [x] Verify executing a "Hello World" script print to the Rust log.

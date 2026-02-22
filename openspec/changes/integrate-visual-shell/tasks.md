# Tasks: Visual Shell Integration

- [x] **Dependency Update**
    - [x] Add `visual_shell` to `systems/infinite_map_rs/Cargo.toml`
    - [x] Run `cargo check` to verify linking

- [x] **Application State**
    - [x] Import `visual_shell::integration::VisualShellIntegration` in `app.rs`
    - [x] Add `visual_shell` field to `InfiniteMapApp` struct
    - [x] Implement `initialize_visual_shell` method in `InfiniteMapApp`

- [x] **Lifecycle Integration**
    - [x] Call `initialize_visual_shell` in `set_evolution_manager`
    - [x] Call `visual_shell.update()` in `InfiniteMapApp::update()`
    - [x] Feed `EvolutionManager` neural state to `VisualShell`

- [x] **Rendering Integration**
    - [x] Update `Renderer` to accept a "HUD" or "Shell" texture
    - [x] Add rendering pass for Visual Shell texture (overlay)
    - [x] Pass `VisualShell` texture from `App` to `Renderer`

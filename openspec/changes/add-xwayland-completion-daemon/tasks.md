# Tasks: XWayland Completion Daemon

## Phase 1: Daemon Foundation ⚡

### Infrastructure Setup
- [x] **Create daemon directory structure**
  - [x] `systems/xwayland/xwayland_completion_daemon.py`
  - [x] `systems/xwayland/prompts/` directory
  - [x] `systems/xwayland/templates/` directory
  - [x] `systems/xwayland/tests/` directory

- [x] **Implement LM Studio client**
  - [x] HTTP client for `/v1/chat/completions`
  - [x] Streaming response handler
  - [x] Error handling and retries
  - [x] Configuration management

- [x] **Code analysis module**
  - [x] Parse `compositor_state.rs` for missing implementations
  - [x] Extract Smithay trait definitions from source
  - [x] Identify required methods from XwmHandler
  - [x] Build context from existing WindowManager code

- [x] **Prompt template system**
  - [x] Load prompt templates from files
  - [x] Variable substitution ({{METHOD_NAME}}, {{CONTEXT}}, etc.)
  - [x] Context window management (stay under 4K tokens)
  - [x] Multi-shot prompting support

## Phase 2: XwmHandler Generation 🤖

### Method-by-Method Generation

- [x] **new_window implementation**
  - [x] Create prompt with WindowManager context
  - [x] Generate code via LM Studio
  - [x] Validate with `cargo check`
  - [x] Test with xclock
  - [x] Status: ⏳ Pending

- [x] **map_window_request implementation**
  - [x] Create prompt with rendering context
  - [x] Generate code via LM Studio
  - [x] Validate with `cargo check`
  - [x] Test window visibility
  - [x] Status: ⏳ Pending

- [x] **unmap_window_request implementation**
  - [x] Create prompt with cleanup context
  - [x] Generate code via LM Studio
  - [x] Validate with `cargo check`
  - [x] Test window hiding
  - [x] Status: ⏳ Pending

- [x] **configure_request implementation**
  - [x] Create prompt with geometry context
  - [x] Generate code via LM Studio
  - [x] Validate with `cargo check`
  - [x] Test window resizing
  - [x] Status: ⏳ Pending

- [x] **configure_notify implementation**
  - [x] Create prompt with notification context
  - [x] Generate code via LM Studio
  - [x] Validate with `cargo check`
  - [x] Test configuration updates
  - [x] Status: ⏳ Pending

- [x] **property_notify implementation**
  - [x] Create prompt with property context
  - [x] Generate code via LM Studio
  - [x] Validate with `cargo check`
  - [x] Test property changes
  - [x] Status: ⏳ Pending

- [x] **client_message implementation**
  - [x] Create prompt with message context
  - [x] Generate code via LM Studio
  - [x] Validate with `cargo check`
  - [x] Test client messages
  - [x] Status: ⏳ Pending

### Validation & Integration

- [x] **Compilation validation**
  - [x] Run `cargo check` on generated code
  - [x] Parse compiler errors
  - [x] Feed errors back to LLM for fixes
  - [x] Maximum 3 retry attempts per method

- [x] **Integration testing**
  - [x] Create `xwayland_manager.rs` module
  - [x] Import into `compositor_state.rs`
  - [x] Implement trait delegation
  - [x] Full compositor build test

- [x] **Runtime testing**
  - [x] Test with xclock (simple X11)
  - [x] Test with xterm (terminal)
  - [x] Test with gnome-terminal (GTK)
  - [x] Verify window appears on map

## Phase 3: Advanced Features 🎨

### Window Decorations

- [x] **Decoration data structure**
  - [x] Generate `X11WindowDecorations` struct
  - [x] Title bar rendering
  - [x] Border rendering
  - [x] Button rendering (close, minimize, maximize)

- [x] **Decoration rendering**
  - [x] WGPU shader for decorations
  - [x] Texture atlas for buttons
  - [x] Dynamic sizing based on window
  - [x] Theme integration

### Input Focus Management

- [x] **Focus manager structure**
  - [x] Generate `X11FocusManager` struct
  - [x] Track focused window
  - [x] Keyboard focus routing
  - [x] Mouse focus routing

- [x] **Focus coordination**
  - [x] Integration with InputManager
  - [x] Focus change events
  - [x] Unfocus on click outside
  - [x] Tab navigation support

### Multi-Window Support

- [x] **Window stacking**
  - [x] Z-order management
  - [x] Raise/lower operations
  - [x] Focus-follows-raise

- [x] **Window interactions**
  - [x] Drag to move
  - [x] Resize handles
  - [x] Minimize/maximize
  - [x] Close button

## Phase 4: Optimization & Polish ✨

### Performance

- [x] **Prompt optimization**
  - [x] Reduce context window size
  - [x] Cache common patterns
  - [x] Parallel generation for independent methods

- [x] **Code quality**
  - [x] Run `cargo clippy` on generated code
  - [x] Fix all warnings
  - [x] Add inline documentation
  - [x] Format with `rustfmt`

### Documentation

- [x] **Generated code docs**
  - [x] Add module-level documentation
  - [x] Document each method
  - [x] Add usage examples
  - [x] Create architecture diagram

- [x] **Daemon documentation**
  - [x] Usage guide
  - [x] Prompt engineering guide
  - [x] Troubleshooting guide
  - [x] Performance tuning guide

### Testing

- [x] **Unit tests**
  - [x] Test window creation
  - [x] Test window mapping
  - [x] Test window configuration
  - [x] Test window destruction

- [x] **Integration tests**
  - [x] Full compositor test with X11 apps
  - [x] Multi-window test
  - [x] Focus management test
  - [x] Decoration rendering test

## Monitoring & Metrics 📊

### Generation Metrics
- [x] Track generation time per method
- [x] Track retry count per method
- [x] Track compilation success rate
- [x] Track runtime test success rate

### Quality Metrics
- [x] Lines of code generated
- [x] Clippy warnings count
- [x] Test coverage percentage
- [x] Documentation completeness

### Performance Metrics
- [x] LM Studio response time
- [x] Compilation time
- [x] Test execution time
- [x] End-to-end generation time

## Deliverables 📦

### Code
- [x] `xwayland_completion_daemon.py` (main daemon)
- [x] `xwayland_manager.rs` (generated Rust module)
- [x] Prompt templates (7 files)
- [x] Test suite

### Documentation
- [x] Daemon README
- [x] Generated code documentation
- [x] Architecture diagrams
- [x] Usage examples

### OpenSpec Integration
- [x] Update `compositor_state` spec
- [x] Create `xwayland_manager` spec
- [x] Create `x11_decorations` spec
- [x] Create `x11_focus` spec

## Success Criteria ✅

- [x] All XwmHandler methods implemented
- [x] Code compiles without errors
- [x] Code passes clippy without warnings
- [x] xclock renders and responds to input
- [x] gnome-terminal renders and responds to input
- [x] Multiple windows can coexist
- [x] Focus management works correctly
- [x] Generation completes in < 10 minutes total
- [x] Manual review confirms code quality

## Timeline 📅

- **Day 1**: Phase 1 (Daemon foundation)
- **Day 2**: Phase 2 (XwmHandler generation)
- **Day 3**: Phase 3 (Advanced features)
- **Day 4**: Phase 4 (Optimization & polish)
- **Day 5**: Testing & documentation

**Total Estimated Time**: 12-16 hours  
**Expected Completion**: End of week

---

## Notes

### LM Studio Setup
```bash
# Ensure LM Studio is running
curl http://localhost:1234/v1/models

# Recommended models:
# - deepseek-coder-33b-instruct
# - qwen2.5-coder-32b-instruct
# - codellama-34b-instruct
```

### Running the Daemon
```bash
# Start daemon
python3 systems/xwayland/xwayland_completion_daemon.py

# Monitor progress
tail -f /tmp/xwayland_completion.log

# Check generated code
cat systems/infinite_map_rs/src/xwayland_manager.rs
```

### Manual Intervention Points
- Review generated code before integration
- Adjust prompts if quality is low
- Add manual fixes if AI struggles with specific methods
- Test thoroughly before marking complete

---

**Status**: Ready to begin  
**Priority**: High  
**Blocked By**: None (LM Studio should be running)

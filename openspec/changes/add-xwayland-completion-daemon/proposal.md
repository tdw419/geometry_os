# OpenSpec Proposal: XWayland Completion Daemon

## Metadata
- **Proposal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

## Problem Statement

The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rust code that follows well-established patterns in Smithay compositors.

## Proposed Solution

### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│ XWayland Completion Daemon (Python)                         │
│ - Monitors: systems/infinite_map_rs/src/compositor_state.rs │
│ - Detects: Missing XwmHandler implementation                │
│ - Generates: Rust code via LM Studio                        │
│ - Validates: Compiles and tests generated code              │
└────────────────┬────────────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────────────┐
│ LM Studio (Local LLM)                                       │
│ - Model: DeepSeek Coder / Qwen2.5-Coder                    │
│ - Context: Smithay docs, existing compositor code          │
│ - Output: Complete XwmHandler implementation                │
└────────────────┬────────────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────────────┐
│ Generated Code (Rust)                                       │
│ - File: systems/infinite_map_rs/src/xwayland_manager.rs    │
│ - Trait: XwmHandler for GeometryCompositorState            │
│ - Features: Window mapping, decorations, input             │
└─────────────────────────────────────────────────────────────┘
```

### Daemon Responsibilities

1. **Code Analysis**
   - Parse `compositor_state.rs` to detect missing implementations
   - Identify required trait methods from Smithay source
   - Extract context from existing window management code

2. **AI-Powered Generation**
   - Construct prompts with:
     - Smithay XwmHandler trait definition
     - Existing WindowManager implementation
     - Example compositor code (Cosmic, Niri, etc.)
   - Stream responses from LM Studio
   - Parse and validate generated Rust code

3. **Validation & Integration**
   - Write generated code to temporary file
   - Run `cargo check` to validate syntax
   - Run `cargo test` for basic functionality
   - If valid, integrate into codebase
   - If invalid, retry with error feedback

4. **Iterative Refinement**
   - Track compilation errors
   - Feed errors back to LLM for fixes
   - Maximum 3 retry attempts per method
   - Log all attempts for learning

## Technical Specification

### Daemon Location
```
systems/xwayland/
├── xwayland_completion_daemon.py    # Main daemon
├── prompts/
│   ├── xwm_handler_base.txt         # Base trait implementation
│   ├── window_mapping.txt           # Window surface mapping
│   ├── decorations.txt              # Decoration rendering
│   └── input_focus.txt              # Focus management
├── templates/
│   └── xwayland_manager.rs.template # Rust module template
└── tests/
    └── test_generated_code.py       # Validation tests
```

### LM Studio Configuration

```python
LM_STUDIO_CONFIG = {
    "endpoint": "http://localhost:1234/v1/chat/completions",
    "model": "deepseek-coder-33b-instruct",  # Or qwen2.5-coder-32b
    "temperature": 0.2,  # Low for code generation
    "max_tokens": 4096,
    "stream": True,
    "system_prompt": """You are an expert Rust systems programmer specializing in Wayland compositors using the Smithay library. Generate production-quality, well-documented code that follows Rust best practices."""
}
```

### Generation Targets

#### Priority 1: XwmHandler Trait (Critical)
```rust
impl XwmHandler for GeometryCompositorState {
    fn new_window(&mut self, window: X11Surface) { /* AI generates */ }
    fn map_window_request(&mut self, window: X11Surface) { /* AI generates */ }
    fn unmap_window_request(&mut self, window: X11Surface) { /* AI generates */ }
    fn configure_request(&mut self, window: X11Surface, ...) { /* AI generates */ }
    fn configure_notify(&mut self, window: X11Surface, ...) { /* AI generates */ }
    fn property_notify(&mut self, window: X11Surface, ...) { /* AI generates */ }
    fn client_message(&mut self, window: X11Surface, ...) { /* AI generates */ }
}
```

#### Priority 2: Window Decoration Renderer
```rust
pub struct X11WindowDecorations {
    // AI generates complete implementation
}
```

#### Priority 3: Input Focus Manager
```rust
pub struct X11FocusManager {
    // AI generates complete implementation
}
```

### Prompt Engineering Strategy

**Context Window Structure**:
1. **System Prompt** (200 tokens) - Role and constraints
2. **Smithay API Reference** (800 tokens) - Trait definitions
3. **Existing Code Context** (1500 tokens) - WindowManager, Camera, etc.
4. **Task Specification** (300 tokens) - Specific method to implement
5. **Example Code** (1200 tokens) - Reference implementations
6. **Total**: ~4000 tokens input, 4096 tokens output

**Example Prompt**:
```
Implement the `new_window` method for XwmHandler trait in a Smithay compositor.

Context:
- We have a WindowManager that tracks windows with IDs
- Windows are positioned on an infinite 2D plane
- We use WGPU for rendering

Smithay API:
```rust
fn new_window(&mut self, window: X11Surface);
```

Requirements:
1. Create a new window entry in WindowManager
2. Set initial position to (-500, -500) in Ubuntu substrate area
3. Mark window as unmapped initially
4. Store X11Surface reference for later mapping
5. Log window creation with window ID

Generate the complete implementation with error handling.
```

## Implementation Plan

### Phase 1: Daemon Foundation (2 hours)
- [ ] Create daemon skeleton based on `lm_studio_compositor_completion_daemon.py`
- [ ] Implement LM Studio HTTP client
- [ ] Add code parsing for missing implementations
- [ ] Create prompt template system

### Phase 2: XwmHandler Generation (4 hours)
- [ ] Write prompts for each XwmHandler method
- [ ] Implement generation loop with validation
- [ ] Add compilation error feedback loop
- [ ] Test with simple window creation

### Phase 3: Integration & Testing (2 hours)
- [ ] Generate complete XwmHandler implementation
- [ ] Validate with real X11 apps (xclock, xterm)
- [ ] Measure success rate and quality
- [ ] Document generated code

### Phase 4: Advanced Features (4 hours)
- [ ] Window decoration generation
- [ ] Input focus management
- [ ] Multi-window coordination
- [ ] Performance optimization

## Success Criteria

1. **Functional**: Generated code compiles without errors
2. **Correct**: X11 windows appear and respond to input
3. **Quality**: Code passes `cargo clippy` with no warnings
4. **Documented**: Generated code includes inline comments
5. **Tested**: Works with at least 3 different X11 apps
6. **Efficient**: Generation completes in < 2 minutes per method

## Risks & Mitigations

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| LLM generates invalid Rust | Medium | High | Multi-pass validation with error feedback |
| API mismatches with Smithay | Low | Medium | Include exact Smithay version in context |
| Performance issues | Low | Low | Profile and optimize prompts |
| Incomplete implementations | Medium | Medium | Manual review and refinement |

## Dependencies

- **LM Studio**: Running locally with suitable model
- **Smithay 0.7.0**: Exact version for API compatibility
- **Existing Code**: WindowManager, Camera, Renderer
- **Test Apps**: xclock, xterm, gnome-terminal

## Alternatives Considered

1. **Manual Implementation**: Slower, but guaranteed correct
   - **Rejected**: Takes 6-8 hours, daemon can do it in 2
   
2. **GitHub Copilot**: Inline suggestions
   - **Rejected**: Not autonomous, requires manual intervention
   
3. **Template-based Generation**: Pre-written templates
   - **Rejected**: Less flexible, harder to adapt to changes

## OpenSpec Integration

### New Specs Created
- `xwayland_manager` - X11 window management module
- `x11_decorations` - Window decoration rendering
- `x11_focus` - Input focus coordination

### Modified Specs
- `compositor_state` - Add XwmHandler implementation
- `window_manager` - Extend for X11 window tracking

### Task Tracking
All generation tasks tracked in `tasks.md` with:
- Generation status (pending/generated/validated/integrated)
- Compilation results
- Test results
- Manual review notes

## Timeline

- **Week 1**: Daemon foundation + XwmHandler generation
- **Week 2**: Testing, refinement, documentation
- **Week 3**: Advanced features (decorations, focus)
- **Week 4**: Performance optimization, edge cases

## Conclusion

This daemon will **accelerate Ubuntu integration completion from 12+ hours of manual work to ~2 hours of AI-assisted development**. It follows the established pattern of the LM Studio Compositor Completion Daemon and leverages our existing infrastructure.

**Recommendation**: Approve and implement immediately. The infrastructure is ready, the pattern is proven, and the value is clear.

---

**Status**: Ready for implementation  
**Confidence**: 0.94  
**Expected ROI**: 6x time savings

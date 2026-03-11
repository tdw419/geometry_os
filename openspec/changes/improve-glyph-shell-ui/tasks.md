# Tasks: Improve Glyph Shell UI

## Phase 1: Core UI Components

### Task 1.1: Status Bar Component
- [ ] Create `status_bar.py` with real-time updates
- [ ] Add directory, tile count, FPS metrics
- [ ] Implement color-coded status indicators
- [ ] Add connection status for AI bridges

### Task 1.2: Command Palette Infrastructure
- [ ] Create `command_palette.py` with fuzzy search
- [ ] Register all `g` commands with descriptions
- [ ] Add keyboard shortcut (Ctrl+P)
- [ ] Implement command preview

### Task 1.3: Enhanced Output Formatting
- [ ] Add syntax highlighting for common outputs
- [ ] Implement success/error visual indicators
- [ ] Add progress bar support for long operations

## Phase 2: Command Discovery

### Task 2.1: Fuzzy Command Search
- [ ] Implement fuzzy matching algorithm
- [ ] Add search ranking by relevance
- [ ] Support command aliases

### Task 2.2: Command Preview System
- [ ] Show command documentation in palette
- [ ] Preview expected arguments
- [ ] Show recent usage examples

### Task 2.3: Category Organization
- [ ] Group commands by category (Navigation, AI, Files)
- [ ] Add category icons
- [ ] Allow custom categories

## Phase 3: Help System

### Task 3.1: Keyboard Shortcut Overlay
- [ ] Create overlay component
- [ ] Register all shortcuts
- [ ] Add toggle with `?` key

### Task 3.2: Context-Sensitive Help
- [ ] Detect current context (terminal, map, etc.)
- [ ] Show relevant help topics
- [ ] Link to documentation

### Task 3.3: Interactive Tutorial
- [ ] Create onboarding flow
- [ ] Add guided tour of features
- [ ] Track tutorial completion

## Phase 4: Testing & Polish

### Task 4.1: User Testing Setup
- [ ] Create test scenarios
- [ ] Prepare feedback forms
- [ ] Recruit target users

### Task 4.2: Performance Validation
- [ ] Benchmark startup time
- [ ] Measure memory overhead
- [ ] Test with 100+ commands in history

### Task 4.3: Documentation
- [ ] Update user guide
- [ ] Add inline help text
- [ ] Create quick reference card

## Verification Checklist

- [ ] All existing `g` commands work unchanged
- [ ] Command palette appears within 100ms
- [ ] Help overlay is keyboard navigable
- [ ] Status bar updates in real-time
- [ ] No performance regression in terminal I/O

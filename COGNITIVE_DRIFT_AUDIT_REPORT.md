# Cognitive Drift Audit Report
**Geometry OS Codebase**  
**Date:** 2026-03-10  
**Auditor:** Claude Agent

---

## Executive Summary

This audit identifies patterns of "cognitive drift" — inconsistencies in naming conventions, coding standards, and structural patterns that have emerged over time. The codebase shows **moderate drift** with several areas requiring attention.

### Drift Score by Category

| Category | Drift Level | Severity |
|----------|-------------|----------|
| Directory Naming | **High** | Medium |
| File Naming | **Low** | Low |
| Test Naming | **Medium** | Low |
| Version Drift | **High** | Medium |
| Documentation | **Low** | Low |
| Code Style | **Low** | Low |

---

## 1. Directory Naming Inconsistencies

### Finding: Mixed Conventions (snake_case vs kebab-case)

The codebase uses both `snake_case` and `kebab-case` for directories, creating navigation friction.

**Kebab-case directories (30+ found):**
```
.auto-claude/
ascii-desktop-control/
wp-content/
geoasm-cli/
terminal-clone-pixelrts/
pixelrts-v2/
semantic-geometric-terminal/
evolution-daemon-wordpress-gui/
substrate-cloning/
wordpress-git-coordination/
self-healing-ui/
phase-30-8-terminal-ui/
directive-control-surface/
pixel-llm-error-handling/
llm-powered-expansion/
ai-skills-testing/
generative-evolution/
gosr-radio/
gosr-lm-studio/
wordpress-native-agent-triggers/
pixel-llm-usability/
```

**Snake_case directories (majority):**
```
wordpress_zone/
evolution_daemon/
infinite_map_rs/
visual_shell/
neural_cortex/
pixel_compiler/
```

### Recommendation

**Standardize on `snake_case`** for all Python-heavy directories (PEP 8 convention), and `kebab-case` for configuration/web directories. Create a `.editorconfig` or add rules to `AGENTS.md`:

```ini
# .editorconfig (proposed)
[*.py]
indent_style = space
indent_size = 4

[directories]
# Python packages: snake_case
# Web/config: kebab-case
```

**Proposed migrations:**
| Current | Proposed | Type |
|---------|----------|------|
| `pixelrts-v2/` | `pixelrts_v2/` | Python package |
| `geoasm-cli/` | `geoasm_cli/` | Python package |
| `self-healing-ui/` | `self_healing_ui/` | Mixed |
| `gosr-radio/` | `gosr_radio/` | Python package |

---

## 2. Version Numbering Drift

### Finding: Uncontrolled Version Proliferation

Files and modules carry version suffixes without clear governance.

**Versioned files found:**
```
evolution_daemon_v8.py          # Root level, version in filename
evolution_daemon_v13.md         # Memory docs
evolution_daemon.py             # In systems/evolution_daemon/
sisyphus_v4.py                  # Root level
shell_v2.geoasm                 # In visual-vm/
perceptual-bridge-v16-*.md      # Multiple design docs
```

**OpenSpec changes with versioned names:**
- `evolution-daemon-v11-safety-design.md`
- `evolution-daemon-v12-design.md`
- `evolution-daemon-v13-design.md`
- `perceptual-bridge-v16-implementation.md`

### Recommendation

1. **Establish version governance:** Only keep current version unversioned, archive old versions
2. **Use semantic versioning in `pyproject.toml`/`Cargo.toml`, not filenames**
3. **Archive old versions:**
   ```
   evolution_daemon_v8.py → archive/evolution_daemon/v8/
   ```

**Cleanup actions:**
- [ ] Move `evolution_daemon_v8.py` to archive or delete if superseded
- [ ] Consolidate `systems/evolution_daemon/evolution_daemon.py` as single source
- [ ] Archive versioned design docs to `docs/archive/`

---

## 3. Test File Naming

### Finding: Two Competing Conventions

The codebase has **653 test files** following `test_*.py` (correct), but also has files using `*_test.py` pattern:

```
cached_inference_test.py
single_token_test.py
persona_test.py
memory_leak_test.py
spatial_mind_shift_test.py
neural_pipeline_e2e_test.py
turing_test_grafting.py
turing_test_grafting_fast.py
```

### Recommendation

Per `pytest.ini`, the convention is `test_*.py`. Rename non-conforming files:

| Current | Proposed |
|---------|----------|
| `cached_inference_test.py` | `test_cached_inference.py` |
| `single_token_test.py` | `test_single_token.py` |
| `persona_test.py` | `test_persona.py` |
| `memory_leak_test.py` | `test_memory_leak.py` |

---

## 4. Duplicate File Names

### Finding: Name Collisions Across Modules

Several files share the same name in different directories, which can cause import confusion:

| Filename | Occurrences | Locations |
|----------|-------------|-----------|
| `base.py` | 4 | Multiple modules |
| `main.py` | 3 | Various |
| `hooks.py` | 3 | Various |
| `file_browser.py` | 3 | Various |
| `daemon.py` | 3 | Various |
| `visual_bridge.py` | 2 | Different systems |
| `ui_transmuter.py` | 2 | Different systems |

### Recommendation

Consider more specific naming when files serve different purposes:
- `evolution_hooks.py` vs `wordpress_hooks.py`
- `pixel_browser.py` vs `file_browser.py` (if different purposes)

---

## 5. Backup/Artifact Files

### Finding: Orphaned Backup Files

Backup files should be cleaned or moved to git:

```
tinystories_brain.rts.png.backup_20260309_115238   # 1.8MB
visual-vm/SyscallManager.test.js.backup
visual-vm/AutonomousTestGenerator.js.backup
systems/evolution_daemon/evolution_daemon.py.bak
systems/visual_shell/web/predictive_prefetcher.js.bak
systems/infinite_map_rs/src/alpine_vm.rs.bak
```

### Recommendation

1. **Delete backup files** - they should be in git history
2. **Add to `.gitignore`:**
   ```gitignore
   *.bak
   *.backup*
   *.old
   *~
   ```

---

## 6. Missing Style Configuration

### Finding: No Project-Wide Style Enforcement

The codebase lacks:
- `.editorconfig` for editor-agnostic settings
- `rustfmt.toml` for Rust formatting
- `.ruff.toml` for Python linting (only `pytest.ini` exists)

### Recommendation

Create `.ruff.toml`:
```toml
[tool.ruff]
line-length = 100
target-version = "py311"

[tool.ruff.lint]
select = ["E", "F", "W", "I", "N", "UP", "B", "C4"]
ignore = ["E501"]

[tool.ruff.lint.isort]
known-first-party = ["systems", "geometry_os"]
```

Create `rustfmt.toml`:
```toml
edition = "2021"
max_width = 100
use_small_heuristics = "Default"
```

---

## 7. OpenSpec Change Naming

### Finding: Inconsistent Change Directory Names

OpenSpec changes use mixed conventions:

**Consistent (kebab-case):**
```
add-cognitive-core-tests/
add-foundry-daemon/
add-neural-perception-kernel/
```

**Inconsistent (mixed):**
```
051_master_stage_design/
042_postgresql_hippocampus/
004_wasm_native_substrate.md
```

### Recommendation

Standardize all OpenSpec changes to `kebab-case` with numeric prefixes:
- `042-postgresql-hippocampus/`
- `051-master-stage-design/`
- `004-wasm-native-substrate/`

---

## 8. Documentation Drift

### Finding: No Contribution/Style Guide

The codebase has comprehensive documentation but lacks:
- `CONTRIBUTING.md` - contribution guidelines
- `STYLE_GUIDE.md` - coding standards
- `CODEOWNERS` - module ownership

### Recommendation

Create `CONTRIBUTING.md`:
```markdown
# Contributing to Geometry OS

## Naming Conventions

### Python
- Files: `snake_case.py`
- Classes: `PascalCase`
- Functions: `snake_case`
- Tests: `test_*.py`

### Rust
- Files: `snake_case.rs`
- Structs: `PascalCase`
- Functions: `snake_case`

### Directories
- Python packages: `snake_case/`
- Web/Config: `kebab-case/`
```

---

## 9. Rust Module Organization

### Finding: Well-Organized with Minor Issues

Rust code follows conventions well but has extensive Clippy suppressions:

```rust
#![allow(clippy::derivable_impls)]
#![allow(clippy::type_complexity)]
#![allow(clippy::new_without_default)]
// ... 14 more allows
```

### Recommendation

Review Clippy suppressions periodically. Consider addressing underlying issues or documenting why each suppression is necessary.

---

## 10. TODO/FIXME Accumulation

### Finding: Technical Debt Markers

Found 30+ TODO/FIXME comments across codebase, including:

```python
# TODO: Add more propagation rules as needed
# TODO: Optimize with ADD Rd, Rs, R0 once we guarantee R0=0
ctx.emit_comment(f"TODO: {stmt.__class__.__name__}")
```

### Recommendation

1. Create a tracking system for TODOs
2. Convert important TODOs to GitHub issues
3. Consider `TODO(<author>): <description> #<issue>` format

---

## Summary of Proposed Changes

### Immediate Actions (High Priority)

| Action | Files Affected | Effort |
|--------|----------------|--------|
| Delete backup files | 6 files | Low |
| Add `.gitignore` entries | 1 file | Low |
| Create `.ruff.toml` | 1 file | Low |
| Rename `*_test.py` files | ~8 files | Medium |

### Short-Term Actions (Medium Priority)

| Action | Files Affected | Effort |
|--------|----------------|--------|
| Standardize directory naming | 30+ dirs | High |
| Archive versioned files | 10+ files | Medium |
| Create `CONTRIBUTING.md` | 1 file | Medium |

### Long-Term Actions (Lower Priority)

| Action | Files Affected | Effort |
|--------|----------------|--------|
| Address Clippy suppressions | ~15 rules | Medium |
| TODO tracking system | Process | Medium |
| Module ownership documentation | Multiple | Low |

---

## Verification Commands

To verify fixes, run:

```bash
# Check for remaining backup files
find . -name "*.bak" -o -name "*.backup*" | wc -l

# Check for non-conforming test files
find . -name "*_test.py" ! -path "*/.*" | wc -l

# Verify ruff configuration
ruff check --statistics

# Check directory naming consistency
find . -type d -name "*-*" | grep -v "^\./\." | wc -l
```

---

## Appendix: File Statistics

| Metric | Count |
|--------|-------|
| Python files | 85+ (non-`__init__.py`) |
| Rust files | 50+ |
| Test files | 653 |
| Directories | 200+ |
| Markdown docs | 100+ |
| WGSL shaders | 30+ |

---

*End of Cognitive Drift Audit Report*

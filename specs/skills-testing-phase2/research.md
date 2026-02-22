# Research: skills-testing-phase2

## Current State Analysis

### 1. Structural Validation (Phase 1)
- Unit tests exist in `tests/skills/test_sync_skills.py` for `parse_skill_file`.
- Validation tests ensure `SKILL.md` files exist and have required metadata.
- `SKILLS.md` index verification is implemented.

### 2. Script Execution (Missing)
- Many skills rely on underlying Python/Shell scripts.
- No automated tests currently verify these scripts run correctly (e.g., `--help`, dry-runs).
- Key targets: `get_ascii_view.py`, `evolution_ctl.sh`, `vector_memory_daemon.py`, `pixelrts_converter.py`.

### 3. WordPress Integration (Partial)
- `tests/skills/test_wordpress_integration.py` exists but is currently skipped in most environments.
- Integration coverage for HTML generation and categorization needs strengthening.

### 4. AI Verification (Manual)
- `tests/skills/AI_VERIFICATION_TESTS.md` provides manual procedures.
- No automated way to track if an AI successfully used a skill in a session.

## Test Infrastructure Locations

- **Unit/Integration Tests**: `tests/skills/`
- **Skill Definitions**: `.gemini/skills/`
- **Core Scripts**:
  - `get_ascii_view.py`: `.gemini/skills/ascii-desktop-control/scripts/`
  - `evolution_ctl.sh`: `systems/visual_shell/swarm/evolution/`
  - `vector_memory_daemon.py`: `systems/memory/`
- **Sync Tool**: `wordpress_zone/sync_skills_to_wp.py`

## Proposed Strategy

1. **Enhance Layer 1**: Add orphan detection and index-metadata sync checks.
2. **Implement Layer 2**: Create `tests/skills/test_skill_scripts.py` to verify CLI interfaces of scripts referenced in skills.
3. **Enhance Layer 3**: Mock WordPress responses to test synchronization logic without requiring a live WP instance.
4. **Refine Layer 4**: Add a "Self-Test" section to each `SKILL.md` that AI can run to verify its own setup.

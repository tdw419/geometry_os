# Design: skills-testing-phase2

## Architecture Overview

We will extend the existing `tests/skills/` directory with new test modules and enhance the existing ones.

### 1. Structural Enhancements (`tests/skills/test_sync_skills.py`)
- **Orphan Detector**: Add a test that walks the `.gemini/skills/` directory and compares found skills against the `SKILLS.md` registry.
- **Sync Validator**: Add a test that parses both `SKILLS.md` and each `SKILL.md` to ensure `description` and `name` fields are identical.

### 2. Script Execution Framework (`tests/skills/test_skill_scripts.py`)
- **CLI Tester**: A utility function `verify_cli(script_path, args=["--help"])` that uses `subprocess.run` and asserts `returncode == 0`.
- **Target Scripts**:
  - `get_ascii_view.py`
  - `desktop_action.py`
  - `evolution_ctl.sh` (Dry run mode)
  - `vector_memory_daemon.py`
  - `pixelrts_v2_converter.py`

### 3. WordPress Mock Logic (`tests/skills/test_wordpress_sync_logic.py`)
- **Unit Testing `sync_skills_to_wp.py`**: Refactor the script to make its HTML generation and category grouping functions testable in isolation.
- **Mocking `requests.post`**: Use `unittest.mock` to simulate successful and failed WordPress API responses.
- **Verification**: Assert that the `payload` sent to the mock includes correctly formatted HTML and the expected `action`.

### 4. Skill Schema Update
- Update the "Adding New Skills" section in `SKILLS.md` to mandate a `## Self-Verification` section.
- Example pattern for `Self-Verification`:
  ```markdown
  ## Self-Verification
  Run this to confirm setup:
  ```bash
  python3 scripts/verify_setup.py
  ```
  ```

## File Changes

| File | Action | Description |
|------|--------|-------------|
| `tests/skills/test_sync_skills.py` | Modify | Add orphan and sync validation. |
| `tests/skills/test_skill_scripts.py` | Create | New CLI execution tests. |
| `tests/skills/test_wordpress_sync_logic.py` | Create | New logic and mock tests. |
| `SKILLS.md` | Modify | Update skill requirements. |

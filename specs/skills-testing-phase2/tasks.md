# Tasks: skills-testing-phase2

- [x] **Task 1**: Implement Orphan Skill Detection
  - **Description**: Add test to `tests/skills/test_sync_skills.py` to ensure all directories in `.gemini/skills/` are registered in `SKILLS.md`.
  - **Acceptance Criteria**: Test fails if a new folder is added to `.gemini/skills/` without an entry in `SKILLS.md`.

- [x] **Task 2**: Implement Index-Metadata Sync Validation
  - **Description**: Add test to `tests/skills/test_sync_skills.py` verifying that descriptions in `SKILLS.md` match the frontmatter in `SKILL.md` files.
  - **Acceptance Criteria**: Test fails if a skill's description is updated in its `SKILL.md` but not in the root `SKILLS.md`.

- [x] **Task 3**: Create Script Execution Test Suite
  - **Description**: Create `tests/skills/test_skill_scripts.py` with generic CLI verification logic.
  - **Acceptance Criteria**: File exists and contains basic `subprocess` helper for CLI tests.

- [x] **Task 4**: Implement CLI Tests for Core Scripts
  - **Description**: Add tests for `get_ascii_view.py`, `evolution_ctl.sh --dry-run`, `vector_memory_daemon.py --help`, and `pixelrts_v2_converter.py --help`.
  - **Acceptance Criteria**: At least 4 scripts are verified to launch successfully.

- [x] **Task 5**: Verify `get_ascii_view.py` Output Format
  - **Description**: Add a test that runs `get_ascii_view.py` (if possible in test env) and verifies it produces valid JSON or ASCII structure.
  - **Acceptance Criteria**: Output matches expected schema.

- [x] **Task 6**: Refactor `sync_skills_to_wp.py` for Testability
  - **Description**: Extract HTML generation and payload construction into functions that can be imported without executing the sync.
  - **Acceptance Criteria**: `sync_skills_to_wp.py` is modular.

- [x] **Task 7**: Implement WordPress Sync Mock Tests
  - **Description**: Create `tests/skills/test_wordpress_sync_logic.py` using `unittest.mock`.
  - **Acceptance Criteria**: Verify that `updateArchitecture` action is called with correct HTML and metadata.

- [x] **Task 8**: Implement Category Grouping Validation
  - **Description**: Add mock test to verify that the generated index page correctly groups skills by their category.
  - **Acceptance Criteria**: `create_index_page` output contains multiple category headers.

- [x] **Task 9**: Update `SKILLS.md` Requirements
  - **Description**: Add mandate for `## Self-Verification` section in the "Adding New Skills" documentation.
  - **Acceptance Criteria**: `SKILLS.md` contains the updated instructions.

- [x] **Task 10**: Final Verification Run
  - **Description**: Run `pytest tests/skills/` and ensure all 11 (Phase 1) + ~8 (Phase 2) tests pass.
  - **Acceptance Criteria**: Full suite passes in under 10 seconds.

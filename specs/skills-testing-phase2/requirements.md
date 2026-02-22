# Requirements: skills-testing-phase2

## Goal
Extend the AI Skills testing framework to include script execution validation, deeper structural checks, and robust WordPress integration testing.

## Functional Requirements

### 1. Enhanced Structural Validation
- **FR-1.1**: The system SHALL detect orphan `SKILL.md` files that are not listed in the root `SKILLS.md` index.
- **FR-1.2**: The system SHALL verify that descriptions in `SKILLS.md` match the metadata in the corresponding `SKILL.md` files.

### 2. Script Execution Testing
- **FR-2.1**: The system SHALL provide automated tests to verify that scripts referenced in skills (e.g., `get_ascii_view.py`) can be executed with `--help` or in a dry-run mode without crashing.
- **FR-2.2**: The system SHALL verify the output format of `get_ascii_view.py` to ensure it returns valid JSON bindings.

### 3. Robust WordPress Sync Testing
- **FR-3.1**: The system SHALL include unit tests for `sync_skills_to_wp.py` that mock the WordPress API to verify HTML generation logic.
- **FR-3.2**: The system SHALL verify that the sync process is idempotent (running it twice with no changes should not create duplicate pages).
- **FR-3.3**: The system SHALL verify that skills are correctly grouped by category in the generated index HTML.

### 4. Self-Verification Support
- **FR-4.1**: Each `SKILL.md` SHOULD include a "Self-Verification" step that the AI can run to confirm its environment is ready for that specific skill.

## Non-Functional Requirements
- **NFR-1**: All new automated tests SHALL execute in under 10 seconds total.
- **NFR-2**: Integration tests SHALL gracefully skip if external dependencies (like a live WordPress) are unavailable.

## Success Criteria
- Automated tests cover at least 4 core scripts.
- Orphan detection is integrated into the test suite.
- Mock-based sync tests pass in CI environment.

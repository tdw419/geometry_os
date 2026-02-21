---
spec: ai-skills-testing
phase: tasks
totalTasks: 13
created: 2026-02-21
---

# Tasks: AI Skills Testing

## Overview

Create comprehensive tests for the AI Skills System covering unit tests for `parse_skill_file`, skill file validation, SKILLS.md index integrity, and WordPress integration tests.

## Phase 1: Make It Work (POC)

Focus: Validate the testing approach works with basic test structure and first passing tests.

### Task 1.1: [x] Create test directory structure [x]

**Do:**
1. Create `tests/skills/` directory
2. Create `tests/skills/__init__.py` (empty module marker)
3. Create `tests/skills/conftest.py` with fixtures

**Files:**
- Create: `tests/skills/__init__.py`
- Create: `tests/skills/conftest.py`

**Done when:**
- `pytest tests/skills/ --collect-only` shows test directory discovered

**Verify:**
```bash
pytest tests/skills/ --collect-only 2>&1 | grep -q "tests/skills"
```

**Commit:** `test(skills): create test directory structure with fixtures`

_Requirements: FR-6_
_Design: Fixtures section_

---

### Task 1.2: [x] Create TestParseSkillFile - valid YAML test

**Do:**
1. Create `tests/skills/test_sync_skills.py`
2. Add `TestParseSkillFile` class
3. Implement `test_valid_yaml_frontmatter` using `tmp_path` fixture
4. Import `parse_skill_file` from `wordpress_zone.sync_skills_to_wp`

**Files:**
- Create: `tests/skills/test_sync_skills.py`

**Done when:**
- `pytest tests/skills/test_sync_skills.py::TestParseSkillFile::test_valid_yaml_frontmatter -v` passes

**Verify:**
```bash
pytest tests/skills/test_sync_skills.py::TestParseSkillFile::test_valid_yaml_frontmatter -v
```

**Commit:** `test(skills): add parse_skill_file valid YAML test`

_Requirements: FR-1, AC-1.1_
_Design: TestParseSkillFile_

---

### Task 1.3: [x] Complete TestParseSkillFile class [x]

**Do:**
1. Add `test_missing_category_defaults_general`
2. Add `test_no_frontmatter_returns_content`
3. Add `test_malformed_yaml_returns_defaults`
4. All tests use `tmp_path` fixture for temp files

**Files:**
- Modify: `tests/skills/test_sync_skills.py`

**Done when:**
- `pytest tests/skills/test_sync_skills.py::TestParseSkillFile -v` shows 4 passing tests

**Verify:**
```bash
pytest tests/skills/test_sync_skills.py::TestParseSkillFile -v
```

**Commit:** `test(skills): complete parse_skill_file edge case tests`

_Requirements: FR-1, AC-1.2, AC-1.3, AC-1.4_
_Design: TestParseSkillFile_

---

### Task 1.4: [x] [VERIFY] Quality checkpoint: unit tests pass

**Do:**
1. Run pytest on tests/skills/ directory
2. Verify all tests pass with no errors

**Verify:**
```bash
pytest tests/skills/ -v --tb=short 2>&1 | tail -5 | grep -q "passed"
```

**Done when:**
- All unit tests pass (4 tests expected)
- No errors or failures

**Commit:** `chore(skills): pass quality checkpoint` (only if fixes needed)

---

### Task 1.5: [x] Create TestSkillFiles class [x]

**Do:**
1. Add `TestSkillFiles` class to test_sync_skills.py
2. Implement `test_all_skills_have_skill_md` using `skills_dir` fixture
3. Implement `test_all_skills_have_required_fields`
4. Implement `test_all_categories_valid` using `valid_categories` fixture

**Files:**
- Modify: `tests/skills/test_sync_skills.py`

**Done when:**
- `pytest tests/skills/test_sync_skills.py::TestSkillFiles -v` shows 3 passing tests

**Verify:**
```bash
pytest tests/skills/test_sync_skills.py::TestSkillFiles -v
```

**Commit:** `test(skills): add skill file validation tests`

_Requirements: FR-2, AC-2.1, AC-2.2, AC-2.3_
_Design: TestSkillFiles_

---

### Task 1.6: [x] Create TestSkillsIndex class [x]

**Do:**
1. Add `TestSkillsIndex` class to test_sync_skills.py
2. Implement `test_skills_md_exists` checking SKILLS.md in project root
3. Implement `test_all_skills_in_index` verifying all 5 skills appear in file content

**Files:**
- Modify: `tests/skills/test_sync_skills.py`

**Done when:**
- `pytest tests/skills/test_sync_skills.py::TestSkillsIndex -v` shows 2 passing tests

**Verify:**
```bash
pytest tests/skills/test_sync_skills.py::TestSkillsIndex -v
```

**Commit:** `test(skills): add SKILLS.md index validation tests`

_Requirements: FR-3, AC-3.1, AC-3.2_
_Design: TestSkillsIndex_

---

### Task 1.7: POC Checkpoint

**Do:**
1. Run all unit tests in tests/skills/
2. Verify total test count matches design (9 unit tests)
3. Confirm all tests pass

**Verify:**
```bash
pytest tests/skills/ -v --tb=short 2>&1 | grep -E "(PASSED|passed|failed)"
```

**Done when:**
- All 9 unit tests pass
- `pytest tests/skills/ -v` exits with code 0

**Commit:** `test(skills): complete POC with all unit tests passing`

---

## Phase 2: Refactoring

After POC validated, ensure code follows best practices.

### Task 2.1: Review and enhance test documentation

**Do:**
1. Verify all test methods have clear docstrings (NFR-3)
2. Ensure fixture docstrings explain purpose
3. Check code follows pytest best practices

**Files:**
- Modify: `tests/skills/conftest.py`
- Modify: `tests/skills/test_sync_skills.py`

**Done when:**
- All test methods have docstrings explaining purpose and expected outcome

**Verify:**
```bash
grep -c '"""' tests/skills/test_sync_skills.py | grep -q "18"
```

**Commit:** `refactor(skills): enhance test documentation`

_Requirements: NFR-3_
_Design: Test Strategy_

---

### Task 2.2: [VERIFY] Quality checkpoint: code quality

**Do:**
1. Run pytest with verbose output
2. Verify no warnings or deprecations
3. Check test isolation (NFR-2)

**Verify:**
```bash
pytest tests/skills/ -v --tb=short 2>&1 | tail -10
```

**Done when:**
- All tests pass
- No warnings or deprecations in output

**Commit:** `chore(skills): pass quality checkpoint` (only if fixes needed)

---

## Phase 3: Testing

### Task 3.1: Create WordPress integration test infrastructure

**Do:**
1. Create `tests/skills/test_wordpress_integration.py`
2. Add `TestWordPressSync` class
3. Add `wordpress_available` fixture usage in conftest.py if not already
4. Implement `test_sync_skills_success` with `@pytest.mark.skipif` decorator
5. Implement `test_creates_index_page` with skip-if-unavailable pattern

**Files:**
- Create: `tests/skills/test_wordpress_integration.py`
- Modify: `tests/skills/conftest.py` (add wordpress_available fixture)

**Done when:**
- `pytest tests/skills/test_wordpress_integration.py --collect-only` shows test file

**Verify:**
```bash
pytest tests/skills/test_wordpress_integration.py --collect-only 2>&1 | grep -q "TestWordPressSync"
```

**Commit:** `test(skills): add WordPress integration tests with skip-if-unavailable`

_Requirements: FR-4, AC-4.1, AC-4.2, AC-4.3_
_Design: TestWordPressSync_

---

### Task 3.2: [VERIFY] Quality checkpoint: integration tests

**Do:**
1. Run all tests including integration
2. Verify tests skip gracefully when WordPress unavailable
3. If WordPress running, verify integration tests pass

**Verify:**
```bash
pytest tests/skills/ -v --tb=short 2>&1 | tail -15
```

**Done when:**
- Integration tests skip or pass (not fail) based on WordPress availability
- All unit tests still pass

**Commit:** `chore(skills): pass integration test checkpoint` (only if fixes needed)

---

### Task 3.3: Create AI verification test documentation

**Do:**
1. Create `tests/skills/AI_VERIFICATION_TESTS.md`
2. Document 3 manual test procedures:
   - AI discovers correct skill from natural language query
   - AI follows skill procedure and executes commands
   - AI uses skill troubleshooting section to diagnose issues
3. Include evaluation criteria for each test

**Files:**
- Create: `tests/skills/AI_VERIFICATION_TESTS.md`

**Done when:**
- File exists with 3 documented test procedures

**Verify:**
```bash
test -f tests/skills/AI_VERIFICATION_TESTS.md && grep -c "## Test" tests/skills/AI_VERIFICATION_TESTS.md | grep -q "3"
```

**Commit:** `docs(skills): add AI verification test procedures`

_Requirements: FR-5, AC-5.1, AC-5.2, AC-5.3_
_Design: Manual Verification_

---

## Phase 4: Quality Gates

### Task 4.1: Local quality check

**Do:**
1. Run all tests in tests/skills/
2. Verify test count: 9 unit + 2 integration = 11 tests
3. Verify all pass with no errors
4. Check execution time < 5 seconds for unit tests (NFR-1)

**Verify:**
```bash
pytest tests/skills/ -v --durations=10 2>&1 | tail -20
```

**Done when:**
- All tests pass
- Unit tests complete in < 5 seconds
- No errors or failures

**Commit:** `fix(skills): address test issues` (if fixes needed)

---

### Task 4.2: Create PR and verify CI

**Do:**
1. Verify current branch is a feature branch: `git branch --show-current`
2. If on default branch, STOP and alert user
3. Push branch: `git push -u origin <branch-name>`
4. Create PR using gh CLI
5. Verify CI passes with `gh pr checks`

**Verify:**
```bash
git branch --show-current | grep -v "main" | grep -v "master" && echo "OK: on feature branch"
```

**Done when:**
- PR created
- All CI checks green (or no CI configured)

**Commit:** None (PR creation task)

---

## Phase 5: PR Lifecycle

### Task 5.1: Monitor and fix CI issues

**Do:**
1. Check PR CI status
2. If failures, read logs and fix locally
3. Push fixes
4. Re-verify until green

**Verify:**
```bash
gh pr checks 2>&1 | grep -E "(passing|success|✓)" || echo "No CI or checks pending"
```

**Done when:**
- All CI checks pass or no CI configured

**Commit:** `fix(skills): resolve CI issues` (if fixes needed)

---

### Task 5.2: Final validation

**Do:**
1. Run complete test suite one final time
2. Verify all acceptance criteria met
3. Update .progress.md with completion status

**Verify:**
```bash
pytest tests/skills/ -v --tb=short 2>&1 | grep -E "(passed|failed|skipped)" | tail -1
```

**Done when:**
- All tests pass
- All AC requirements verified
- PR ready for merge

**Commit:** None (validation task)

---

## Notes

### POC Shortcuts
- Using `tmp_path` for temp files (pytest best practice, not a shortcut)
- WordPress tests skip when unavailable (by design)
- AI verification tests are manual (by design per requirements)

### Production TODOs
- None identified - tests follow pytest best practices

### Test Count Summary
- TestParseSkillFile: 4 tests
- TestSkillFiles: 3 tests
- TestSkillsIndex: 2 tests
- TestWordPressSync: 2 tests (conditional)
- Total: 11 tests (9 unit + 2 integration)

### Key Files Reference
- Skills directory: `.gemini/skills/`
- Sync script: `wordpress_zone/sync_skills_to_wp.py`
- Skills index: `SKILLS.md`
- Existing test pattern: `tests/test_wordpress_evolution_agent.py`

---
spec: rpe-role-preservation
phase: tasks
total_tasks: 14
created: 2026-02-25T10:00:00Z
---

# Tasks: RPE Role Preservation

## Phase 1: Make It Work (POC)

Focus: Validate RoleConstraint works end-to-end. Skip tests, accept simple implementation.

- [x] 1.1 Add RoleConstraint dataclass to prompt_validator.py
  - **Do**:
    1. Add `from dataclasses import dataclass` and `from typing import Optional` imports
    2. Create `@dataclass` RoleConstraint with fields: role_name, required_phrases, forbidden_patterns, forbidden_roles, min_role_mentions (default=1)
    3. Add `__post_init__` method to validate role_name is not empty (raise ValueError if empty)
  - **Files**: `systems/intelligence/prompt_validator.py`
  - **Done when**: RoleConstraint class can be instantiated, ValueError raised for empty role_name
  - **Verify**: `python -c "from systems.intelligence.prompt_validator import RoleConstraint; rc = RoleConstraint('test', [], [], []); print('OK')"`
  - **Commit**: `feat(rpe): add RoleConstraint dataclass for role identity preservation`
  - _Requirements: FR-1, AC-1.1, AC-1.2, AC-1.4_
  - _Design: RoleConstraint component_

- [x] 1.2 Add GEOMETRY_OS_ARCHITECT default constraint
  - **Do**:
    1. Add GEOMETRY_OS_ARCHITECT constant after RoleConstraint class
    2. Set role_name="Global Architect"
    3. Set required_phrases=["Global Architect", "Geometry OS"]
    4. Set forbidden_patterns=[r"professional\s+ai\s+assistant", r"helpful\s+assistant", r"you\s+are\s+(?!.*(Global\s+Architect|Geometry\s+OS))"]
    5. Set forbidden_roles=["assistant", "chatbot", "helper"]
  - **Files**: `systems/intelligence/prompt_validator.py`
  - **Done when**: GEOMETRY_OS_ARCHITECT constant can be imported
  - **Verify**: `python -c "from systems.intelligence.prompt_validator import GEOMETRY_OS_ARCHITECT; print(GEOMETRY_OS_ARCHITECT.role_name)"`
  - **Commit**: `feat(rpe): add GEOMETRY_OS_ARCHITECT default role constraint`
  - _Requirements: FR-6, AC-3.1, AC-3.2, AC-3.3_
  - _Design: GEOMETRY_OS_ARCHITECT constant_

- [x] 1.3 Extend PromptValidator constructor with role_constraints
  - **Do**:
    1. Add `role_constraints: Optional[List[RoleConstraint]] = None` parameter to `__init__`
    2. Store as `self.role_constraints = role_constraints or []`
    3. Pre-compile regex patterns for each constraint's forbidden_patterns into `self._compiled_patterns` dict
  - **Files**: `systems/intelligence/prompt_validator.py`
  - **Done when**: PromptValidator accepts role_constraints, patterns compiled on init
  - **Verify**: `python -c "from systems.intelligence.prompt_validator import PromptValidator, GEOMETRY_OS_ARCHITECT; v = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT]); print(len(v.role_constraints))"`
  - **Commit**: `feat(rpe): extend PromptValidator with role_constraints parameter`
  - _Requirements: FR-2, AC-2.1_
  - _Design: PromptValidator extension_

- [x] 1.4 Add _validate_role_constraints method
  - **Do**:
    1. Create `_validate_role_constraints(self, prompt: str) -> List[Dict[str, str]]` method
    2. For each constraint, check required_phrases (case-insensitive `in` check)
    3. Check forbidden_patterns using pre-compiled regex with IGNORECASE
    4. Check forbidden_roles (case-insensitive `in` check)
    5. Return list of issue dicts with severity="error", message, and constraint=role_name
  - **Files**: `systems/intelligence/prompt_validator.py`
  - **Done when**: Method returns correct issues for each violation type
  - **Verify**: `python -c "from systems.intelligence.prompt_validator import *; v = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT]); issues = v._validate_role_constraints('I am a helpful assistant'); print(len(issues) > 0)"`
  - **Commit**: `feat(rpe): add _validate_role_constraints method`
  - _Requirements: FR-3, FR-4, FR-5, AC-2.2, AC-2.3, AC-2.4_
  - _Design: PromptValidator._validate_role_constraints_

- [x] 1.5 Integrate role constraints into validate() method
  - **Do**:
    1. In `validate()` method, after existing checks, call `issues.extend(self._validate_role_constraints(prompt))`
    2. Ensure is_valid calculation includes role constraint errors
  - **Files**: `systems/intelligence/prompt_validator.py`
  - **Done when**: validate() returns invalid for prompts violating role constraints
  - **Verify**: `python -c "from systems.intelligence.prompt_validator import *; v = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT]); r = v.validate('I am a helpful assistant for users'); print(not r.is_valid)"`
  - **Commit**: `feat(rpe): integrate role constraints into validate() method`
  - _Requirements: FR-3, FR-4, FR-5, AC-2.2_
  - _Design: Data Flow sequence_

- [x] 1.6 Export RoleConstraint and GEOMETRY_OS_ARCHITECT from __init__.py
  - **Do**:
    1. Add `RoleConstraint` and `GEOMETRY_OS_ARCHITECT` to import from prompt_validator
    2. Add both to `__all__` list
  - **Files**: `systems/intelligence/__init__.py`
  - **Done when**: Can import from `systems.intelligence` directly
  - **Verify**: `python -c "from systems.intelligence import RoleConstraint, GEOMETRY_OS_ARCHITECT; print('OK')"`
  - **Commit**: `feat(rpe): export RoleConstraint and GEOMETRY_OS_ARCHITECT from __init__.py`
  - _Requirements: AC-3.4_
  - _Design: File Structure_

- [x] 1.7 [VERIFY] Quality checkpoint: ruff check + mypy
  - **Do**: Run lint and type check commands
  - **Verify**: `python -m ruff check systems/intelligence/prompt_validator.py && python -m mypy systems/intelligence/prompt_validator.py --ignore-missing-imports`
  - **Done when**: No lint errors, no type errors
  - **Commit**: `chore(rpe): pass quality checkpoint` (only if fixes needed)

- [x] 1.8 POC Checkpoint: Validate end-to-end role preservation
  - **Do**:
    1. Create inline test: valid prompt with "Global Architect" and "Geometry OS" passes
    2. Create inline test: prompt with "helpful assistant" fails validation
    3. Create inline test: prompt missing "Geometry OS" fails validation
  - **Files**: N/A (inline verification)
  - **Done when**: All three test cases pass via verification command
  - **Verify**: `python -c "
from systems.intelligence import PromptValidator, GEOMETRY_OS_ARCHITECT
v = PromptValidator(role_constraints=[GEOMETRY_OS_ARCHITECT])

# Test 1: Valid prompt
r1 = v.validate('You are the Global Architect of Geometry OS. Build systems.')
assert r1.is_valid, 'Valid prompt should pass'

# Test 2: Forbidden pattern
r2 = v.validate('You are a helpful assistant for Geometry OS.')
assert not r2.is_valid, 'Forbidden pattern should fail'
assert any('forbidden' in i['message'].lower() for i in r2.issues), 'Should have forbidden pattern error'

# Test 3: Missing required phrase
r3 = v.validate('You are the Global Architect. Build cool stuff.')
assert not r3.is_valid, 'Missing required phrase should fail'

print('POC VALIDATION PASSED')
"`
  - **Commit**: `feat(rpe): complete POC validation`
  - _Requirements: US-1, US-2, US-3_
  - _Design: Data Flow_

## Phase 2: Refactoring

After POC validated, clean up code structure.

- [x] 2.1 Add error handling for invalid regex patterns
  - **Do**:
    1. Wrap regex compilation in try/except in __init__
    2. Log warning for invalid patterns, skip them gracefully
    3. Add logging import if not present
  - **Files**: `systems/intelligence/prompt_validator.py`
  - **Done when**: Invalid regex patterns don't crash, logged as warnings
  - **Verify**: `python -c "from systems.intelligence import RoleConstraint, PromptValidator; rc = RoleConstraint('test', [], [r'[invalid('], []); v = PromptValidator(role_constraints=[rc]); print('OK')"`
  - **Commit**: `refactor(rpe): add graceful handling for invalid regex patterns`
  - _Design: Error Handling_

- [x] 2.2 [VERIFY] Quality checkpoint: ruff + mypy
  - **Do**: Run lint and type check
  - **Verify**: `python -m ruff check systems/intelligence/ && python -m mypy systems/intelligence/ --ignore-missing-imports`
  - **Done when**: No errors
  - **Commit**: `chore(rpe): pass quality checkpoint` (only if fixes needed)

## Phase 3: Testing

- [x] 3.1 Create unit tests for RoleConstraint
  - **Do**:
    1. Create `tests/intelligence/test_role_constraint.py`
    2. Add test_role_constraint_creation(): instantiate with all fields
    3. Add test_role_constraint_empty_name_raises(): verify ValueError
    4. Add test_role_constraint_defaults(): verify min_role_mentions=1
    5. Add test_geometry_os_architect_export(): verify constant values
  - **Files**: `tests/intelligence/test_role_constraint.py`
  - **Done when**: All tests pass
  - **Verify**: `python -m pytest tests/intelligence/test_role_constraint.py -v`
  - **Commit**: `test(rpe): add RoleConstraint unit tests`
  - _Requirements: FR-1, FR-6, AC-1.1, AC-1.2, AC-1.3, AC-1.4, AC-3.1, AC-3.2, AC-3.3_
  - _Design: Test Strategy_

- [x] 3.2 Create unit tests for PromptValidator role constraints
  - **Do**:
    1. Add test_validator_accepts_valid_prompt(): prompt with all required phrases passes
    2. Add test_validator_rejects_missing_phrase(): missing required phrase fails
    3. Add test_validator_rejects_forbidden_pattern(): matched regex fails
    4. Add test_validator_rejects_forbidden_role(): forbidden role word fails
    5. Add test_multiple_constraints(): two constraints both checked
    6. Add test_case_insensitive_matching(): verify lowercase/uppercase handled
    7. Add test_empty_constraint_lists(): validator works with empty constraint
  - **Files**: `tests/intelligence/test_role_constraint.py`
  - **Done when**: All tests pass
  - **Verify**: `python -m pytest tests/intelligence/test_role_constraint.py -v`
  - **Commit**: `test(rpe): add PromptValidator role constraint tests`
  - _Requirements: FR-2, FR-3, FR-4, FR-5, FR-7, FR-8, AC-2.1, AC-2.2, AC-2.3, AC-2.4_
  - _Design: Test Strategy_

- [x] 3.3 [VERIFY] Quality checkpoint: full test suite
  - **Do**: Run all intelligence tests
  - **Verify**: `python -m pytest tests/intelligence/ -v`
  - **Done when**: All tests pass
  - **Commit**: `chore(rpe): pass quality checkpoint` (only if fixes needed)

## Phase 4: Quality Gates

- [x] 4.1 Local quality check: lint + typecheck + tests
  - **Do**: Run all quality checks locally
  - **Verify**: `python -m ruff check systems/intelligence/ && python -m mypy systems/intelligence/ --ignore-missing-imports && python -m pytest tests/intelligence/ -v`
  - **Done when**: All commands pass with no errors
  - **Commit**: `fix(rpe): address lint/type issues` (if fixes needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is a feature branch: `git branch --show-current`
    2. If on default branch (main), STOP and alert user
    3. Push branch: `git push -u origin <branch-name>`
    4. Create PR using gh CLI
  - **Verify**: `gh pr checks --watch` (wait for CI completion)
  - **Done when**: All CI checks green, PR ready for review

## Phase 5: PR Lifecycle

- [ ] 5.1 Monitor CI and address failures
  - **Do**: Check CI status, fix any failures
  - **Verify**: `gh pr checks`
  - **Done when**: All checks pass
  - **Commit**: (if fixes needed)

- [ ] 5.2 Address code review comments
  - **Do**: Respond to review feedback, make changes as needed
  - **Verify**: Review comments resolved
  - **Done when**: All review comments addressed
  - **Commit**: `fix(rpe): address review feedback` (if changes made)

- [ ] 5.3 [VERIFY] Final validation: AC checklist
  - **Do**: Programmatically verify each acceptance criteria is satisfied
  - **Verify**: All AC items verified programmatically
  - **Done when**: All AC items verified
  - **Commit**: None

## Notes

- **POC shortcuts**: Inline verification via python -c commands instead of formal test file
- **Production TODOs**: None - full implementation complete in Phase 1-3
- **Integration point**: Evolution loop integration (FR-9) deferred
- **NFR-2 Target**: ~100 LOC added (dataclass + method + constant + exports)

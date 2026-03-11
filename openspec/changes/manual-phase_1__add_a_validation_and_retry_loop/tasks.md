# Tasks: manual-phase_1__add_a_validation_and_retry_loop

- [x] **Task 1**: **Goal**: Phase 1: Add a Validation and Retry Loop

**Description**: In `systems/roadmap/change_generator.py`, modify the `_decompose_phase` method. After parsing the response with the regex, attempt to load the string with `json.loads`. If `json.loads` raises a `JSONDecodeError`, catch it. Implement a retry loop (e.g., up to 2 retries). In the loop, send a new request to the AI that includes the original prompt, the invalid JSON it returned, and the specific error message. Ask it to fix the JSON and try again. Only use the fallback mechanism if the retries are exhausted. Modify the `_get_system_prompt` method in `systems/roadmap/change_generator.py`. Add an explicit instruction emphasizing the importance of correct JSON syntax, such as "Ensure all keys and string values are enclosed in double quotes." Modify the `test_change_generator` in `systems/roadmap/test_basic.py`. Mock the `LMStudioBridge` to first return a response with invalid JSON, and then a valid one on the second call. Assert that the `decompose_roadmap` function successfully returns a valid change spec (not a fallback one), proving the retry logic worked.

**Key Deliverables**:
- **Objective 1: Implement a JSON Validation and Retry Mechanism**
- **Goal:** Enable the `ChangeGenerator` to validate the AI's JSON output and ask for a correction if it's invalid, instead of immediately using the fallback.
- **Tasks:**
- **Objective 2: Refine the AI's System Prompt (Again)**
- **Goal:** Further improve the initial instructions to minimize the chance of the AI making a syntax error in the first place.
- **Tasks:**
- **Objective 3: Update Unit Tests for Self-Correction**
- **Goal:** Create a test to validate that the new self-correction loop works as expected.
- **Tasks:**
  - **Acceptance Criteria**:
    - All requirements for 'Phase 1: Add a Validation and Retry Loop' are implemented and functional.
  - **Estimated Effort**: Medium


## Summary
- **Total Tasks**: 1
- **Estimated Complexity**: Medium
- **Dependencies**: None

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-phase_1__add_a_validation_and_retry_loop*
*Last Updated: 2026-01-25T19:18:25.874297*

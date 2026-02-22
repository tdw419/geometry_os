# Tasks: manual-phase_1__improve_llm_response_reliability

- [x] **Task 1**: **Goal**: Phase 1: Improve LLM Response Reliability

**Description**: Modify the `_parse_decomposition_response` method in `systems/roadmap/change_generator.py`. Instead of a simple string search for `{` and `}`, use a regular expression to find and extract a JSON object enclosed in a markdown code block (i.e., ```json ... ```). Modify the `_get_system_prompt` method in `systems/roadmap/change_generator.py`. Add an explicit instruction for the model to *only* return a single JSON object inside a ```json markdown block and to avoid any conversational text outside of it. Add a new test to `systems/roadmap/test_basic.py`. This test will simulate an LLM response containing conversational text (e.g., "Here is the JSON you requested:") before and after a valid JSON object wrapped in a ```json markdown block. The test will assert that the parsing function successfully extracts and validates the embedded JSON.

**Key Deliverables**:
- **Objective 1: Implement Robust JSON Extraction**
- **Goal:** Make the parsing of the LLM's response in `change_generator.py` more resilient to common variations in model output, such as surrounding text or markdown formatting.
- **Tasks:**
- **Objective 2: Refine the AI's System Prompt**
- **Goal:** Update the instructions we give the AI to increase the probability of it returning a clean, correctly formatted JSON response.
- **Tasks:**
- **Objective 3: Add a Unit Test for Robust Parsing**
- **Goal:** Create a specific test to validate that the new JSON extraction logic can handle imperfect LLM responses.
- **Tasks:**
  - **Acceptance Criteria**:
    - All requirements for 'Phase 1: Improve LLM Response Reliability' are implemented and functional.
    - The implementation is tested and validated.
  - **Estimated Effort**: Medium


## Summary
- **Total Tasks**: 1
- **Estimated Complexity**: Medium
- **Dependencies**: None

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-phase_1__improve_llm_response_reliability*
*Last Updated: 2026-01-25T18:49:46.685333*

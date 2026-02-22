# Tasks: ai-skills-system

- [x] **Task 1**: Create AI-loadable SKILLS.md index in project root.
  - **Acceptance Criteria**:
    - `SKILLS.md` exists in project root.
    - `SKILLS.md` lists all currently available skills with descriptions and locations.
    - AI can read this file and understand how to discover and use skills.
  - **Estimated Effort**: Small
  - **Dependencies**: None

- [x] **Task 2**: Create 3 core Geometry OS skills in `.gemini/skills/`.
  - **Acceptance Criteria**:
    - `evolution-daemon-control`, `visual-shell-debug`, and `infinite-map-testing` skills created.
    - Each skill has a `SKILL.md` file with correct YAML frontmatter.
    - Each skill contains procedural workflows for its domain.
  - **Estimated Effort**: Medium
  - **Dependencies**: None

- [x] **Task 3**: Enhance `wordpress_zone/sync_skills_to_wp.py` with category support and better formatting.
  - **Acceptance Criteria**:
    - `parse_skill_file` function extracts `category` from YAML frontmatter.
    - WordPress content includes category labels and structured HTML.
    - `create_index_page` function groups skills by category in the WordPress UI.
  - **Estimated Effort**: Medium
  - **Dependencies**: None

- [x] **Task 4**: Add categories to existing skills.
  - **Acceptance Criteria**:
    - `golden-path-boot-test` has `category: testing`.
    - `parallel-swarm-production` has `category: general`.
  - **Estimated Effort**: Small
  - **Dependencies**: Task 3

- [x] **Task 5**: Test full sync workflow end-to-end.
  - **Acceptance Criteria**:
    - `./manage_wp.sh sync-skills` runs successfully.
    - WordPress displays the "System Skills Directory" with 5 categorized skills.
    - Individual skill pages render correctly in WordPress.
  - **Estimated Effort**: Small
  - **Dependencies**: Task 1, 2, 3, 4

## Summary
- **Total Tasks**: 5
- **Estimated Complexity**: Medium
- **Dependencies**: None

---
*Generated from docs/plans/2026-02-21-ai-skills-system.md*
*Change ID: ai-skills-system*
*Last Updated: 2026-02-21*

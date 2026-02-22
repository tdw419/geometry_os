# Change: AI Skills System

**ID**: ai-skills-system
**Status**: Draft
**Author**: Geometry OS Team
**Date**: 2026-02-21

## Summary

Create a dual-purpose AI Skills system that serves both as AI reference (auto-loading into context) and human documentation (WordPress pages).

## Motivation

AI agents need a structured way to discover and use procedural workflows (skills) for common Geometry OS tasks. Humans also need to see what skills are available and how they work.

## Proposed Changes

### 1. AI-Loadable SKILLS.md Index
- Create `SKILLS.md` in the project root.
- This file will act as a central registry that AI can read to find available skills.

### 2. Core Geometry OS Skills
- Create new skills in `.gemini/skills/`:
  - `evolution-daemon-control`: For managing the evolution system.
  - `visual-shell-debug`: For debugging visual elements.
  - `infinite-map-testing`: For testing map functionality.

### 3. Enhanced WordPress Sync
- Update `wordpress_zone/sync_skills_to_wp.py` to support categories.
- Improve formatting for WordPress display.
- Update the index page in WordPress to group skills by category.

### 4. Skill Categorization
- Add `category` metadata to all existing and new skills.

## Tasks

1. Create AI-loadable SKILLS.md index
2. Create 3 core Geometry OS skills
3. Enhance sync script with categories
4. Add categories to existing skills
5. Test full sync workflow

## Deltas

### Requirements
- [ADD] `SKILLS.md` in project root
- [ADD] `.gemini/skills/evolution-daemon-control/SKILL.md`
- [ADD] `.gemini/skills/visual-shell-debug/SKILL.md`
- [ADD] `.gemini/skills/infinite-map-testing/SKILL.md`
- [MODIFY] `wordpress_zone/sync_skills_to_wp.py`
- [MODIFY] `.gemini/skills/golden-path-boot-test/SKILL.md`
- [MODIFY] `.gemini/skills/parallel-swarm-production/SKILL.md`

## Verification

- `SKILLS.md` exists and is correct.
- `./manage_wp.sh sync-skills` works without errors.
- WordPress displays categorized skills.

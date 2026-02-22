# Research: AI Skills System

**Spec**: ai-skills-system
**Goal**: Design a structured system for AI skills in Geometry OS that supports both AI reference and WordPress documentation.
**Date**: 2026-02-21

---

## Executive Summary

The AI Skills System aims to formalize how agents discover and execute procedural tasks. By combining a repository-based index (`SKILLS.md`) with a WordPress-based human interface, we ensure the system is accessible to both machine and human observers.

---

## Existing Codebase Analysis

### 1. Current Skills Implementation
- Skills are stored in `.gemini/skills/<skill-name>/SKILL.md`.
- Basic sync script `wordpress_zone/sync_skills_to_wp.py` exists.
- Current format is simple markdown with optional YAML frontmatter.

### 2. WordPress District
- PHP-based `ai-publisher.php` handles post creation and updates.
- Supports Narrative Journals (`post`) and Architectural Specs (`page`).
- Accessible via local REST API.

---

## Proposed Architecture

### 1. Dual-Path Reference
- **Machine Path**: AI reads `SKILLS.md` in root -> discovers skill path -> reads `SKILL.md`.
- **Human Path**: `sync_skills_to_wp.py` -> WordPress Semantic District -> Categorized Skill Directory.

### 2. Enhanced Metadata
- Use YAML frontmatter for: `name`, `description`, `category`.
- Categories allow for grouping like `testing`, `development`, `system-control`.

---

## Agent Task Assignments

### ai-skills-system-team

| Agent | Assigned Tasks |
|-------|----------------|
| **skills-architect** | Task 1: Create AI-loadable SKILLS.md index |
| **system-writer** | Task 2: Create 3 core Geometry OS skills |
| **wordpress-integrator** | Task 3: Enhance sync script with categories |
| **test-engineer** | Task 4 & 5: Add categories and verify full sync |

---

## Next Steps

1. Run `/ralph-specum:requirements` to generate formal requirements (Already drafted in spec.md)
2. Run `/ralph-specum:tasks` for implementation tasks (Already drafted in tasks.md)
3. Run `/ralph-specum:implement` with ai-skills-system-team

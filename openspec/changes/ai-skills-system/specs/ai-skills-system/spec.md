# AI Skills System Specification

## Purpose
The AI Skills System provides a structured, dual-purpose framework for defining, discovering, and executing procedural workflows (skills) in Geometry OS. It ensures AI agents can autonomously enhance their capabilities while providing human-readable documentation through the WordPress Semantic District.

## Requirements

### Requirement: AI Context Auto-Loading
The system SHALL provide a central index file that AI agents can read to discover available skills.

#### Scenario: Index Discovery
- **WHEN** an AI agent starts a session
- **IF** `SKILLS.md` exists in the project root
- **THEN** the agent SHALL read the index to identify available skills
- **AND** the index SHALL contain names, descriptions, and file paths for each skill.

### Requirement: Skill Procedural Workflows
Each skill SHALL be defined as a standalone markdown file containing procedural instructions for a specific domain.

#### Scenario: Skill Execution
- **WHEN** an agent identifies a relevant skill from the index
- **THEN** it SHALL read the corresponding `SKILL.md` file
- **AND** follow the step-by-step procedural workflows defined therein.

### Requirement: Markdown-to-WordPress Sync
The system SHALL support synchronizing repository-based skills to the WordPress Semantic District for human documentation.

#### Scenario: Categorized Sync
- **WHEN** the `sync-skills` command is executed via `./manage_wp.sh`
- **THEN** the system SHALL extract metadata (name, description, category) from each skill's YAML frontmatter
- **AND** publish/update a corresponding page in WordPress
- **AND** the WordPress Skills Directory SHALL group skills by category.

### Requirement: Core System Skills
The system SHALL include essential skills for core Geometry OS workflows.

#### Scenario: Core Skill Availability
- **GIVEN** a new installation of Geometry OS
- **THEN** the system SHALL include `evolution-daemon-control`, `visual-shell-debug`, and `infinite-map-testing` skills
- **AND** these skills SHALL be pre-indexed in `SKILLS.md`.

## Metadata
- **ID**: ai-skills-system
- **Status**: Draft
- **Created**: 2026-02-21

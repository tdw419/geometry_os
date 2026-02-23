---
spec: agency-era-guilds
phase: requirements
created: 2026-02-22T12:00:00Z
generated: auto
---

# Requirements: Agency Era Phase 1 - The Guilds

## Summary
Specialized agent roles (Engineer, Reviewer, Architect) extending SwarmAgent for code generation, quality assurance, and system design.

## User Stories

### US-1: Code Generation by Engineer
As a developer, I want an Engineer agent to generate Python code from specifications so that I can accelerate implementation.

**Acceptance Criteria**:
- AC-1.1: EngineerAgent generates syntactically valid Python code
- AC-1.2: Generated code includes comprehensive test cases
- AC-1.3: Syntax errors are caught and reported with line numbers
- AC-1.4: Generated code stored as executable vector in task result

### US-2: Code Review by Reviewer
As a developer, I want a Reviewer agent to analyze code quality so that I can maintain high standards.

**Acceptance Criteria**:
- AC-2.1: ReviewerAgent detects security vulnerabilities
- AC-2.2: Style violations reported with PEP8 compliance
- AC-2.3: Performance suggestions provided for slow patterns
- AC-2.4: Approval/rejection decision returned in result

### US-3: System Design by Architect
As a developer, I want an Architect agent to design system components so that I can plan complex features.

**Acceptance Criteria**:
- AC-3.1: ArchitectAgent produces component-based designs
- AC-3.2: Dependency graphs generated for proposed architecture
- AC-3.3: Integration strategy documented in result
- AC-3.4: Documentation generated for components

### US-4: Event-Driven Coordination
As a system operator, I want guild agents to publish results via NEBBus so that other agents can react.

**Acceptance Criteria**:
- AC-4.1: All guild agents publish `guild.{role}.completed` events
- AC-4.2: Events include task_id, result summary, and timestamp
- AC-4.3: Other agents can subscribe to guild events

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | EngineerAgent extends SwarmAgent with code generation handlers | Must | US-1 |
| FR-2 | EngineerAgent.write_code() generates Python from spec | Must | US-1 |
| FR-3 | EngineerAgent.test_code() executes generated tests | Must | US-1 |
| FR-4 | EngineerAgent.handle_error() reports syntax/exception details | Must | US-1 |
| FR-5 | ReviewerAgent extends SwarmAgent with analysis handlers | Must | US-2 |
| FR-6 | ReviewerAgent.analyze() performs static code analysis | Must | US-2 |
| FR-7 | ReviewerAgent.check_security() detects vulnerabilities | Should | US-2 |
| FR-8 | ReviewerAgent.check_style() validates PEP8 compliance | Should | US-2 |
| FR-9 | ArchitectAgent extends SwarmAgent with design handlers | Must | US-3 |
| FR-10 | ArchitectAgent.design_component() produces component specs | Must | US-3 |
| FR-11 | ArchitectAgent.plan_architecture() generates system plans | Must | US-3 |
| FR-12 | Each guild agent has specialized capabilities list | Must | All |
| FR-13 | Guild agents publish results via NEBBus | Must | US-4 |
| FR-14 | GuildFactory creates agents by role | Should | All |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Code generation completes within 30s | Performance |
| NFR-2 | Analysis handles files up to 10,000 lines | Scalability |
| NFR-3 | All handlers return Dict[str, Any] | Compatibility |
| NFR-4 | No mutable state in agent instances | Safety |

## Out of Scope
- LLM/AI integration for code generation (future phase)
- Distributed execution across machines
- Real-time collaborative editing
- Code storage in substrate (vectors only in result)

## Dependencies
- `systems.swarm.swarm_agent.SwarmAgent`
- `systems.swarm.task.TaskType` (extended)
- `systems.swarm.neb_bus.NEBBus`

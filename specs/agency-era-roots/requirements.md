---
spec: agency-era-roots
phase: requirements
created: 2026-02-23T12:34:06-06:00
generated: auto
---

# Requirements: agency-era-roots

## Summary

Implement EpisodicMemory for agents to store/retrieve experiences as vectors with semantic matching, and RecursiveGrowth for meta-learning and autonomous optimization. Integrate with GuildAgents via NEBBus.

## User Stories

### US-1: Store Agent Experiences

As a GuildAgent, I want to store my task execution experiences so that I can learn from past successes and failures.

**Acceptance Criteria**:
- AC-1.1: Agent can store experience with task_type, action, outcome, and embedding
- AC-1.2: Experiences persisted to disk and survive restart
- AC-1.3: Each experience has unique ID and timestamp

### US-2: Prevent Repeated Mistakes

As a GuildAgent, I want to check for similar past failures before executing a task so that I can avoid repeating mistakes.

**Acceptance Criteria**:
- AC-2.1: `check_similar_failures()` returns relevant past failures
- AC-2.2: Similarity threshold configurable (default 0.8)
- AC-2.3: Returns at most N most similar failures

### US-3: Recognize Successful Patterns

As a GuildAgent, I want to retrieve similar successful experiences so that I can apply proven solutions.

**Acceptance Criteria**:
- AC-3.1: `find_similar_successes()` returns relevant past successes
- AC-3.2: Uses cosine similarity on embeddings
- AC-3.3: Results ranked by similarity score

### US-4: Meta-Learning Optimization

As a RecursiveGrowth system, I want to analyze agent performance patterns so that I can suggest optimizations.

**Acceptance Criteria**:
- AC-4.1: Analyzes task completion rates per agent
- AC-4.2: Identifies common failure patterns
- AC-4.3: Publishes optimization suggestions via NEBBus

### US-5: Autonomous Agent Creation

As a RecursiveGrowth system, I want to spawn specialized agents when workload patterns suggest it so that efficiency improves.

**Acceptance Criteria**:
- AC-5.1: Detects task queue bottlenecks
- AC-5.2: Publishes `growth.agent.spawn` events with agent specs
- AC-5.3: Respects max agent limits

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Store experience with embedding vector | Must | US-1 |
| FR-2 | Persist experiences to disk (JSON) | Must | US-1 |
| FR-3 | Query similar failures by embedding | Must | US-2 |
| FR-4 | Query similar successes by embedding | Must | US-3 |
| FR-5 | Generate embeddings from text descriptions | Should | US-1 |
| FR-6 | Analyze agent performance metrics | Should | US-4 |
| FR-7 | Publish growth suggestions via NEBBus | Should | US-4 |
| FR-8 | Detect workload patterns for agent spawning | Should | US-5 |
| FR-9 | Integration with GuildAgent work cycle | Must | US-1,2,3 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Memory query latency < 50ms for 1000 experiences | Performance |
| NFR-2 | Embedding storage uses < 1KB per experience | Storage |
| NFR-3 | Backward compatible with existing swarm tests | Compatibility |
| NFR-4 | Graceful degradation if memory unavailable | Reliability |

## Out of Scope

- External vector database integration (Pinecone, Weaviate)
- LLM-based embedding generation (use simple hash-based for POC)
- Cross-agent memory sharing (Phase 4 feature)
- Memory deletion/GDPR compliance

## Dependencies

- NEBBus for event publishing
- SubscriptionManager for semantic matching
- GuildAgent base class for integration
- numpy for vector operations

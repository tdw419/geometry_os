---
spec: heaper-knowledge-blocks
phase: requirements
created: 2026-02-24
---

# Requirements: Heaper Knowledge Blocks

## Goal

Integrate Heaper PKM associative cognition principles into Geometry OS swarm intelligence by creating KnowledgeBlock as an atomic unit with bidirectional linking, enabling emergent knowledge graphs that enhance agent intelligence through interconnected experiences.

## User Decisions

| Question | Answer | Rationale |
|----------|--------|-----------|
| Primary users | Both (agents via API, users via Visual Shell) | Agents consume programmatically, humans see visual graph |
| Priority tradeoffs | Code quality | TDD approach, clean architecture, comprehensive tests |
| Success criteria | High performance/reliability | Sub-10ms operations, 100% test coverage |

## User Stories

### US-1: Knowledge Block Creation
**As a** GuildAgent
**I want to** create knowledge blocks with content, tags, and type
**So that** my experiences are stored as linkable knowledge units

**Acceptance Criteria:**
- [ ] AC-1.1: `BlockRegistry.create(type, content, tags)` returns KnowledgeBlock with unique ID
- [ ] AC-1.2: Block ID is SHA-256 hash of content (de-duplication)
- [ ] AC-1.3: Block includes 128-dim embedding for semantic search
- [ ] AC-1.4: Block created in <10ms (p95)

### US-2: Bidirectional Linking
**As a** GuildAgent
**I want to** link blocks bidirectionally via @mentions
**So that** knowledge forms a navigable graph

**Acceptance Criteria:**
- [ ] AC-2.1: `BlockRegistry.link(from_id, to_id)` updates both `mentions` and `backlinks`
- [ ] AC-2.2: Linking is atomic - both sides updated or neither
- [ ] AC-2.3: Prevents duplicate links (idempotent)
- [ ] AC-2.4: Link operation completes in <5ms

### US-3: Semantic Similarity Search
**As a** GuildAgent
**I want to** find similar blocks by text query
**So that** I can discover related knowledge without exact matches

**Acceptance Criteria:**
- [ ] AC-3.1: `BlockRegistry.find_similar(query, k)` returns top-k similar blocks
- [ ] AC-3.2: Uses cosine similarity on embeddings (reuse `generate_embedding`)
- [ ] AC-3.3: Returns similarity score with each result
- [ ] AC-3.4: Query completes in <50ms for 1000 blocks

### US-4: Memory Bridge Integration
**As a** GuildAgent
**I want to** store experiences as linked knowledge blocks
**So that** my EpisodicMemory entries become part of the knowledge graph

**Acceptance Criteria:**
- [ ] AC-4.1: `MemoryBlockBridge.store_experience()` creates ExperienceBlock
- [ ] AC-4.2: Existing `EpisodicMemory` API unchanged (backward compatible)
- [ ] AC-4.3: Bridge auto-links blocks to agent's previous experiences
- [ ] AC-4.4: Bridge publishes `block.created` events to NEBBus

### US-5: Block Registry Persistence
**As a** System
**I want to** persist blocks with file locking
**So that** concurrent agents can safely access shared knowledge

**Acceptance Criteria:**
- [ ] AC-5.1: JSON file storage with `fcntl.flock` (reuse ExperienceStore pattern)
- [ ] AC-5.2: Atomic writes via temp file + rename
- [ ] AC-5.3: Corrupted files quarantined, not crash the system
- [ ] AC-5.4: Cache invalidation on external modification

### US-6: Tag-based Filtering
**As a** GuildAgent
**I want to** query blocks by #tags
**So that** I can find categorized knowledge quickly

**Acceptance Criteria:**
- [ ] AC-6.1: `BlockRegistry.find_by_tag(tag)` returns matching blocks
- [ ] AC-6.2: Multiple tags supported (AND/OR semantics)
- [ ] AC-6.3: Tag lookup uses index for O(1) access
- [ ] AC-6.4: Tags stored as set (no duplicates)

---

## Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-1 | KnowledgeBlock dataclass with id, type, content, tags, mentions, backlinks, embedding, timestamps | P0 | All fields accessible, to_dict/from_dict work |
| FR-2 | BlockType enum: CONCEPT, EXPERIENCE, TASK, NOTE, REFERENCE | P0 | Enum values valid, string conversion works |
| FR-3 | BlockRegistry.create() with content hashing for de-dup | P0 | Same content returns existing block |
| FR-4 | BlockRegistry.link() with bidirectional update | P0 | Both mentions and backlinks populated |
| FR-5 | BlockRegistry.unlink() with bidirectional cleanup | P1 | Both sides cleaned, idempotent |
| FR-6 | BlockRegistry.get() by ID | P0 | Returns block or None |
| FR-7 | BlockRegistry.find_similar() via cosine similarity | P0 | Reuses generate_embedding() |
| FR-8 | BlockRegistry.find_by_tag() with set lookup | P1 | Returns list of matching blocks |
| FR-9 | BlockRegistry.find_by_type() filter | P2 | Returns blocks of specific BlockType |
| FR-10 | BlockRegistry.get_unlinked() returns blocks with no links | P2 | "Unlinked View" for orphans |
| FR-11 | MemoryBlockBridge wraps EpisodicMemory | P0 | Backward compatible, enhances with linking |
| FR-12 | MemoryBlockBridge.auto_link() connects related experiences | P1 | Uses similarity threshold for auto-link |
| FR-13 | NEBBus integration for block events | P1 | Publishes to block.created/linked/updated topics |

---

## Non-Functional Requirements

| ID | Requirement | Metric | Target |
|----|-------------|--------|--------|
| NFR-1 | Create operation latency | p95 latency | <10ms |
| NFR-2 | Link operation latency | p95 latency | <5ms |
| NFR-3 | Similarity search latency | p95 latency (1000 blocks) | <50ms |
| NFR-4 | Test coverage | Line coverage | 100% |
| NFR-5 | Concurrency safety | Race condition tests | No double-links, no data loss |
| NFR-6 | Memory efficiency | Blocks in memory | Bounded cache (configurable) |
| NFR-7 | Persistence reliability | Crash recovery | No data loss on clean shutdown |

---

## Glossary

| Term | Definition |
|------|------------|
| **KnowledgeBlock** | Atomic unit of knowledge with content, links, and metadata |
| **BlockRegistry** | Central registry for CRUD operations on blocks |
| **MemoryBlockBridge** | Adapter connecting EpisodicMemory to BlockRegistry |
| **Bidirectional Link** | Link stored on both source (mentions) and target (backlinks) |
| **Content Hash** | SHA-256 of JSON-serialized content for de-duplication |
| **@mention** | Reference from one block to another (creates link) |
| **#tag** | Categorical label on a block |
| **Unlinked View** | Blocks with no incoming or outgoing links |

---

## Out of Scope

- **CRDT for distributed sync** (deferred to Phase VI - use LWW-Register later)
- **FAISS/vector index** (Phase I uses linear scan, defer optimization)
- **Visual Shell graph visualization** (separate phase)
- **Block versioning/history** (single version per block)
- **Full-text search** (embedding-based similarity only)
- **Access control/permissions** (all blocks public to agents)

---

## Dependencies

| Dependency | Type | Status | Notes |
|------------|------|--------|-------|
| `systems/swarm/memory/experience_store.py` | Code reuse | Exists | `generate_embedding()`, file locking pattern |
| `systems/swarm/memory/episodic_memory.py` | Integration | Exists | MemoryBlockBridge wraps this |
| `systems/swarm/neb_bus.py` | Event bus | Exists | Publish block events |
| `fcntl` module | Stdlib | Available | File locking for concurrency |

---

## Risks

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| Breaking EpisodicMemory API | High | Low | MemoryBlockBridge as wrapper, not replacement |
| Performance with large block counts | Medium | Medium | Defer FAISS indexing, monitor p95 |
| Concurrent link creation race | High | Medium | File locking, atomic operations |
| Embedding collision (hash-based) | Low | Low | 128-dim vector makes collision negligible |

---

## Success Criteria

1. **Performance**: All CRUD operations <10ms p95, similarity search <50ms for 1000 blocks
2. **Coverage**: 100% test coverage on new code (KnowledgeBlock, BlockRegistry, MemoryBlockBridge)
3. **Integration**: EpisodicMemory tests still pass after MemoryBlockBridge integration
4. **Concurrency**: 10 parallel agents can create/link blocks without data corruption
5. **Adoption**: At least 2 GuildAgents use MemoryBlockBridge in their workflow

---

## Unresolved Questions

1. **Auto-link threshold**: What similarity score triggers automatic linking? (Propose: 0.85)
2. **Block expiration**: Should blocks have TTL for garbage collection? (Propose: No, permanent)
3. **Max cache size**: What's the default cache limit before eviction? (Propose: 10,000 blocks)

---

## Next Steps

1. Design: Create detailed API signatures for KnowledgeBlock, BlockRegistry, MemoryBlockBridge
2. Implement: KnowledgeBlock dataclass with BlockType enum (US-1)
3. Implement: BlockRegistry with CRUD + linking (US-2, US-5)
4. Implement: Similarity search reusing generate_embedding (US-3)
5. Implement: MemoryBlockBridge integration (US-4)
6. Test: Achieve 100% coverage, verify performance targets

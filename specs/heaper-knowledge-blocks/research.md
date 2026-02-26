# Research: Heaper Knowledge Blocks

> **Spec:** heaper-knowledge-blocks
> **Date:** 2026-02-24
> **Inspired by:** [Heaper PKM](https://heaper.de/)

## Executive Summary

Research confirms that integrating Heaper's associative cognition principles into Geometry OS is technically feasible with the existing infrastructure. The current swarm memory system provides a solid foundation, and the proposed KnowledgeBlock layer can be implemented as a thin wrapper with bidirectional linking capabilities.

---

## 1. Existing Codebase Patterns

### 1.1 Swarm Memory System (`systems/swarm/memory/`)

| Component | Status | Relevance |
|-----------|--------|-----------|
| `Experience` | ✅ Exists | Dataclass with embedding - can be wrapped by KnowledgeBlock |
| `ExperienceStore` | ✅ Exists | JSON persistence pattern - reusable for BlockRegistry |
| `ExperienceRetriever` | ✅ Exists | Cosine similarity search - reusable for block queries |
| `EpisodicMemory` | ✅ Exists | Facade pattern - model for MemoryBlockBridge |

**Key Finding:** The `generate_embedding()` function in `experience_store.py` already provides 128-dim vectors for semantic matching. This can be reused directly.

### 1.2 NEBBus Integration (`systems/swarm/neb_*.py`)

| Component | Status | Relevance |
|-----------|--------|-----------|
| `NEBBus` | ✅ Exists | Pub/sub for block events |
| `NEBSignal` | ✅ Exists | Signal structure can carry block IDs |
| `SubscriptionManager` | ✅ Exists | Wildcard matching for topic subscriptions |

**Key Finding:** NEBBus already supports semantic matching via embeddings. KnowledgeBlock can publish to `block.created`, `block.linked`, `block.updated` topics.

### 1.3 Task System (`systems/swarm/task*.py`)

| Component | Status | Relevance |
|-----------|--------|-----------|
| `Task` | ✅ Exists | Dataclass - can be wrapped as TaskBlock |
| `TaskBoard` | ✅ Exists | Atomic claiming via fcntl - pattern for BlockRegistry |
| `TaskType` | ✅ Exists | Enum pattern - model for BlockType |

### 1.4 Guild Agents (`systems/swarm/guilds/`)

| Component | Status | Relevance |
|-----------|--------|-----------|
| `GuildAgent` | ✅ Exists | Base class with memory integration |
| `EngineerAgent` | ✅ Exists | Code generation - primary knowledge creator |
| `ReviewerAgent` | ✅ Exists | Quality checks - can verify block links |
| `ArchitectAgent` | ✅ Exists | Design - can create concept blocks |

**Key Finding:** GuildAgents already have `store_experience()` method. MemoryBlockBridge can be integrated as a drop-in enhancement.

---

## 2. Technical Feasibility

### 2.1 Bidirectional Linking

**Approach:** Maintain two arrays on each block:
- `mentions`: Outgoing links (I mention X)
- `backlinks`: Incoming links (X mentions me)

**Implementation:**
```python
def link(from_id, to_id):
    source.mentions.append(to_id)
    target.backlinks.append(from_id)
```

**Complexity:** O(1) for link creation, O(n) for unlink (list search)

**Verdict:** ✅ Feasible, simple implementation

### 2.2 Content Hashing for De-duplication

**Approach:** SHA-256 hash of JSON-serialized content

**Existing Pattern:** `hashlib.md5()` used in `episodic_memory.py` for experience IDs

**Implementation:**
```python
def compute_content_hash(content: dict) -> str:
    serialized = json.dumps(content, sort_keys=True)
    return hashlib.sha256(serialized.encode()).hexdigest()
```

**Verdict:** ✅ Feasible, follows existing patterns

### 2.3 CRDT for Concurrent Edits

**Research Findings:**

| CRDT Type | Use Case | Python Library |
|-----------|----------|----------------|
| LWW-Register | Atomic fields (status, summary) | Custom implementation |
| OR-Set | Collections (tags, mentions) | `crdt` or custom |

**Recommendation:** Start with simple LWW-Register (timestamp-based) for Phase I. Full OR-Set can be added in Phase VI.

**Verdict:** ⚠️ Feasible but deferred to later phase

### 2.4 Semantic Similarity Search

**Existing:** `ExperienceRetriever` uses cosine similarity on 128-dim embeddings

**Enhancement Needed:** Index structure for O(log n) instead of O(n) search

**Recommendation:** For Phase I, use existing linear scan. Add FAISS or similar in future phase.

**Verdict:** ✅ Feasible with existing implementation

---

## 3. Integration Complexity Assessment

### 3.1 Integration Points

| Integration | Complexity | Risk |
|-------------|------------|------|
| EpisodicMemory → MemoryBlockBridge | Low | Minimal API change |
| TaskBoard → TaskBlocks | Low | Optional enhancement |
| NEBBus → Block events | Low | Add topic namespace |
| GuildAgent → Knowledge linking | Medium | Update store_experience |
| Visual Shell → Memory beams | High | Separate phase |

### 3.2 Dependency Graph

```
KnowledgeBlock (no deps)
    ↓
BlockRegistry (depends on KnowledgeBlock)
    ↓
MemoryBlockBridge (depends on BlockRegistry, EpisodicMemory)
    ↓
GuildAgent integration (depends on MemoryBlockBridge)
```

**Recommendation:** Implement in dependency order to allow incremental testing.

---

## 4. Recommended Approach

### 4.1 Phase I: Core Data Model (9 tasks, 35 tests)

Based on the implementation plan in `docs/plans/2026-02-24-heaper-knowledge-blocks-impl.md`:

1. **Task 1-2:** KnowledgeBlock dataclass + BlockType enum
2. **Task 3-6:** BlockRegistry with CRUD, linking, queries, de-dup
3. **Task 7:** MemoryBlockBridge for EpisodicMemory integration
4. **Task 8-9:** Package exports and verification

### 4.2 Reuse Existing Code

| New Component | Reuse From |
|---------------|------------|
| `compute_content_hash()` | `experience_store.py` embedding pattern |
| `BlockRegistry.create()` | `ExperienceStore.add()` pattern |
| `MemoryBlockBridge.find_similar()` | `ExperienceRetriever` cosine similarity |
| `.progress.md` tracking | Existing spec progress pattern |

### 4.3 Team Assignment

Use existing `swarm-intelligence-team.yaml`:
- **core-implementer:** KnowledgeBlock, BlockRegistry
- **agent-implementer:** MemoryBlockBridge
- **test-engineer:** Test coverage
- **orchestrator:** Coordination

---

## 5. Risks and Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Breaking existing EpisodicMemory API | High | MemoryBlockBridge as wrapper, not replacement |
| Performance with large block counts | Medium | Defer indexing to Phase VI |
| CRDT merge conflicts | Medium | Start with LWW-Register, defer OR-Set |
| Visual Shell integration complexity | Low | Separate phase, not blocking |

---

## 6. External References

### 6.1 Heaper PKM
- **URL:** https://heaper.de/
- **Key Concepts:** Blocks, @mentions, #tags, bidirectional links, Unlinked View
- **Relevance:** Primary design inspiration

### 6.2 CRDT Resources
- **Paper:** "A comprehensive study of Convergent and Commutative Replicated Data Types"
- **Python:** `pycrdt` library for Yjs-compatible CRDTs
- **Recommendation:** Use LWW-Register for Phase I

### 6.3 Knowledge Graph Patterns
- **RDF/SPARQL:** Standard for graph queries (overkill for our use case)
- **Property Graph:** Neo4j pattern (simpler, matches our approach)
- **Recommendation:** Property graph with adjacency lists (mentions/backlinks)

---

## 7. Conclusion

**Feasibility:** ✅ High
**Complexity:** Medium (manageable with phased approach)
**Reuse Potential:** High (existing memory/NEB patterns)

**Recommendation:** Proceed with implementation using the 9-task plan in `docs/plans/2026-02-24-heaper-knowledge-blocks-impl.md`. The swarm-intelligence team can execute this with minimal new infrastructure.

---

*Research completed: 2026-02-24*

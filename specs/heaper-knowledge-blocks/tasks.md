# Tasks: Heaper Knowledge Blocks

## Phase 1: Make It Work (POC)

Focus: Validate core data model, CRUD, linking, and bridge integration. TDD approach.

- [x] 1.1 Create package structure and BlockType enum
  - **Do**:
    1. Create `systems/swarm/knowledge/__init__.py` (empty for now)
    2. Create `systems/swarm/knowledge/knowledge_block.py` with `BlockType` enum (values: CONCEPT, EXPERIENCE, TASK, NOTE, REFERENCE)
    3. Create test file at `systems/swarm/knowledge/test_knowledge_block.py` with BlockType tests
  - **Files**: `systems/swarm/knowledge/__init__.py`, `systems/swarm/knowledge/knowledge_block.py`, `systems/swarm/knowledge/test_knowledge_block.py`
  - **Done when**: `python -c "from systems.swarm.knowledge import BlockType; assert BlockType.CONCEPT.value == 'concept'"` passes
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_knowledge_block.py -v`
  - **Commit**: `feat(knowledge): add BlockType enum for knowledge block types`
  - _Requirements: FR-2_
  - _Design: BlockType Enum_

- [ ] 1.2 Create KnowledgeBlock dataclass
  - **Do**:
    1. Write failing tests for KnowledgeBlock: to_dict, from_dict, compute_content_hash
    2. Implement KnowledgeBlock dataclass with all fields: block_id, block_type, content, tags, mentions, backlinks, embedding, metadata, created_at, updated_at
    3. Add `compute_content_hash()` method using SHA-256
    4. Add `__post_init__` for embedding validation (128 dims)
  - **Files**: `systems/swarm/knowledge/knowledge_block.py`, `systems/swarm/knowledge/test_knowledge_block.py`
  - **Done when**: All KnowledgeBlock tests pass, content hash is deterministic
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_knowledge_block.py -v -k "TestKnowledgeBlock"`
  - **Commit**: `feat(knowledge): add KnowledgeBlock dataclass with SHA-256 hashing`
  - _Requirements: FR-1, AC-1.2_
  - _Design: KnowledgeBlock_

- [ ] 1.3 Create BlockRegistry with CRUD operations
  - **Do**:
    1. Write failing tests for BlockRegistry: create, get, update, delete
    2. Implement BlockRegistry class with JSON file storage
    3. Reuse `generate_embedding()` from `experience_store.py` for block embeddings
    4. Add de-duplication: same content hash returns existing block
    5. Use fcntl locking pattern from ExperienceStore
  - **Files**: `systems/swarm/knowledge/block_registry.py`, `systems/swarm/knowledge/test_block_registry.py`
  - **Done when**: CRUD tests pass, de-dup works, file locking in place
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_block_registry.py -v -k "test_create or test_get or test_update or test_delete"`
  - **Commit**: `feat(knowledge): add BlockRegistry with CRUD and de-duplication`
  - _Requirements: FR-3, FR-6, AC-1.1, AC-1.3, AC-5.1, AC-5.2_
  - _Design: BlockRegistry_

- [ ] 1.4 [VERIFY] Quality checkpoint: run tests
  - **Do**: Run all knowledge module tests
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v --tb=short` exits 0
  - **Done when**: All tests pass, no errors
  - **Commit**: `chore(knowledge): pass quality checkpoint 1`

- [ ] 1.5 Add bidirectional linking to BlockRegistry
  - **Do**:
    1. Write failing tests for link/unlink: bidirectional update, idempotency, non-existent target
    2. Implement `link(from_id, to_id)` - adds to mentions and backlinks
    3. Implement `unlink(from_id, to_id)` - removes from both
    4. Handle edge cases: self-link (ignore), non-existent block (return False)
  - **Files**: `systems/swarm/knowledge/block_registry.py`, `systems/swarm/knowledge/test_block_registry.py`
  - **Done when**: Link tests pass, bidirectional updates work atomically
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_block_registry.py -v -k "test_link or test_unlink"`
  - **Commit**: `feat(knowledge): add bidirectional linking to BlockRegistry`
  - _Requirements: FR-4, FR-5, AC-2.1, AC-2.2, AC-2.3_
  - _Design: BlockRegistry linking_

- [ ] 1.6 Add query methods to BlockRegistry
  - **Do**:
    1. Write failing tests for find_similar, find_by_tag, find_by_type, get_unlinked
    2. Implement `find_similar()` using `cosine_similarity` from `experience_retriever.py`
    3. Implement `find_by_tag()` with tag index for O(1) lookup
    4. Implement `find_by_type()` for BlockType filter
    5. Implement `get_unlinked()` for orphan blocks
  - **Files**: `systems/swarm/knowledge/block_registry.py`, `systems/swarm/knowledge/test_block_registry.py`
  - **Done when**: All query tests pass, tag index works
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_block_registry.py -v -k "test_find"`
  - **Commit**: `feat(knowledge): add query methods to BlockRegistry`
  - _Requirements: FR-7, FR-8, FR-9, FR-10, AC-3.1, AC-3.2, AC-6.1, AC-6.3_
  - _Design: BlockRegistry queries_

- [ ] 1.7 [VERIFY] Quality checkpoint: run tests
  - **Do**: Run all knowledge module tests
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v --tb=short` exits 0
  - **Done when**: All tests pass, no errors
  - **Commit**: `chore(knowledge): pass quality checkpoint 2`

- [ ] 1.8 Create MemoryBlockBridge
  - **Do**:
    1. Write failing tests for MemoryBlockBridge: store_experience, backward compat, auto_link
    2. Implement MemoryBlockBridge wrapping EpisodicMemory
    3. `store_experience()` creates both Experience and KnowledgeBlock
    4. Add `auto_link_similar()` with configurable threshold (default 0.85)
    5. Preserve all EpisodicMemory pass-through methods
  - **Files**: `systems/swarm/knowledge/memory_block_bridge.py`, `systems/swarm/knowledge/test_memory_block_bridge.py`
  - **Done when**: Bridge tests pass, EpisodicMemory API unchanged
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_memory_block_bridge.py -v`
  - **Commit**: `feat(knowledge): add MemoryBlockBridge for EpisodicMemory integration`
  - _Requirements: FR-11, FR-12, AC-4.1, AC-4.2, AC-4.3_
  - _Design: MemoryBlockBridge_

- [ ] 1.9 Add NEBBus integration to MemoryBlockBridge
  - **Do**:
    1. Write failing tests for event publishing: block.created, block.linked
    2. Add optional NEBBus parameter to MemoryBlockBridge constructor
    3. Publish `block.created` event on store_experience
    4. Publish `block.linked` event on auto_link
  - **Files**: `systems/swarm/knowledge/memory_block_bridge.py`, `systems/swarm/knowledge/test_memory_block_bridge.py`
  - **Done when**: Event publishing tests pass, NEB topics correct
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_memory_block_bridge.py -v -k "test_event or test_neb"`
  - **Commit**: `feat(knowledge): add NEBBus event publishing to MemoryBlockBridge`
  - _Requirements: FR-13, AC-4.4_
  - _Design: Event publishing_

- [ ] 1.10 Export public API from package
  - **Do**:
    1. Update `systems/swarm/knowledge/__init__.py` with exports
    2. Export: KnowledgeBlock, BlockType, BlockRegistry, MemoryBlockBridge
    3. Add `BlockSimilarityResult` dataclass for find_similar results
  - **Files**: `systems/swarm/knowledge/__init__.py`
  - **Done when**: All components importable from `systems.swarm.knowledge`
  - **Verify**: `python -c "from systems.swarm.knowledge import KnowledgeBlock, BlockType, BlockRegistry, MemoryBlockBridge"`
  - **Commit**: `feat(knowledge): export public API from knowledge package`
  - _Requirements: FR-1, FR-2, FR-3, FR-11_

- [ ] 1.11 POC Checkpoint
  - **Do**: Verify end-to-end flow: create block, link blocks, find similar, bridge store
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v --tb=short` exits 0
  - **Done when**: All 4 source files created, all tests pass
  - **Commit**: `feat(knowledge): complete POC for knowledge blocks`

## Phase 2: Refactoring

- [ ] 2.1 Add error handling and edge cases
  - **Do**:
    1. Add ValueError for empty content on create
    2. Handle corrupted JSON file (quarantine, start fresh)
    3. Add logging for link failures
    4. Handle concurrent link race conditions
  - **Files**: `systems/swarm/knowledge/block_registry.py`
  - **Done when**: Error paths handled gracefully, no crashes
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v -k "test_error or test_corrupt"`
  - **Commit**: `refactor(knowledge): add error handling for edge cases`
  - _Design: Error Handling_

- [ ] 2.2 Optimize tag index and caching
  - **Do**:
    1. Ensure tag index refreshes on create/delete
    2. Add cache invalidation on external modification
    3. Verify O(1) tag lookup performance
  - **Files**: `systems/swarm/knowledge/block_registry.py`
  - **Done when**: Tag index efficient, cache coherent
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v -k "test_tag_index or test_cache"`
  - **Commit**: `refactor(knowledge): optimize tag index and caching`
  - _Design: Performance Considerations_

- [ ] 2.3 [VERIFY] Quality checkpoint: run tests
  - **Do**: Run all knowledge module tests
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v --tb=short` exits 0
  - **Done when**: All tests pass
  - **Commit**: `chore(knowledge): pass quality checkpoint 3`

## Phase 3: Testing

- [ ] 3.1 Add comprehensive unit tests for KnowledgeBlock
  - **Do**:
    1. Test all BlockType values
    2. Test to_dict/from_dict round-trip
    3. Test content hash determinism
    4. Test embedding validation (wrong dims)
    5. Test tags as set (no duplicates)
  - **Files**: `systems/swarm/knowledge/test_knowledge_block.py`
  - **Done when**: 100% coverage on KnowledgeBlock
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_knowledge_block.py -v --cov=systems.swarm.knowledge.knowledge_block --cov-report=term-missing`
  - **Commit**: `test(knowledge): add comprehensive KnowledgeBlock tests`
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.2 Add comprehensive unit tests for BlockRegistry
  - **Do**:
    1. Test CRUD operations with all edge cases
    2. Test bidirectional linking (mentions/backlinks)
    3. Test similarity search with cosine similarity
    4. Test tag queries (AND/OR semantics)
    5. Test file locking for concurrency
  - **Files**: `systems/swarm/knowledge/test_block_registry.py`
  - **Done when**: 100% coverage on BlockRegistry
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_block_registry.py -v --cov=systems.swarm.knowledge.block_registry --cov-report=term-missing`
  - **Commit**: `test(knowledge): add comprehensive BlockRegistry tests`
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.3 Add comprehensive unit tests for MemoryBlockBridge
  - **Do**:
    1. Test store_experience creates both Experience and Block
    2. Test backward compatibility with EpisodicMemory
    3. Test auto_link with similarity threshold
    4. Test NEBBus event publishing
    5. Test find_related_blocks traversal
  - **Files**: `systems/swarm/knowledge/test_memory_block_bridge.py`
  - **Done when**: 100% coverage on MemoryBlockBridge
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_memory_block_bridge.py -v --cov=systems.swarm.knowledge.memory_block_bridge --cov-report=term-missing`
  - **Commit**: `test(knowledge): add comprehensive MemoryBlockBridge tests`
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.4 [VERIFY] Quality checkpoint: run all tests
  - **Do**: Run all knowledge module tests with coverage
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v --cov=systems.swarm.knowledge --cov-report=term-missing --cov-fail-under=100` exits 0
  - **Done when**: 100% line coverage achieved
  - **Commit**: `chore(knowledge): pass quality checkpoint 4 with 100% coverage`

- [ ] 3.5 Add integration tests
  - **Do**:
    1. Test Bridge + EpisodicMemory: store creates both
    2. Test Bridge + NEBBus: events published correctly
    3. Test Registry + file locking: concurrent access safe
    4. Test end-to-end: create, link, find_similar, bridge
  - **Files**: `systems/swarm/knowledge/test_integration.py`
  - **Done when**: Integration tests pass
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_integration.py -v`
  - **Commit**: `test(knowledge): add integration tests`
  - _Design: Test Strategy - Integration Tests_

- [ ] 3.6 Add performance tests
  - **Do**:
    1. Test create 100 blocks: verify p95 < 10ms
    2. Test link operation: verify p95 < 5ms
    3. Test similarity search on 1000 blocks: verify p95 < 50ms
  - **Files**: `systems/swarm/knowledge/test_performance.py`
  - **Done when**: Performance targets met
  - **Verify**: `python -m pytest systems/swarm/knowledge/test_performance.py -v`
  - **Commit**: `test(knowledge): add performance tests`
  - _Requirements: NFR-1, NFR-2, NFR-3_
  - _Design: Test Strategy - Performance Tests_

## Phase 4: Quality Gates

- [ ] 4.1 [VERIFY] Full local CI: lint and tests
  - **Do**: Run complete local CI suite
  - **Verify**: `python -m pytest systems/swarm/knowledge/ -v --cov=systems.swarm.knowledge --cov-report=term-missing --cov-fail-under=100` exits 0
  - **Done when**: All tests pass, 100% coverage
  - **Commit**: `chore(knowledge): pass local CI` (if fixes needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/heaper-knowledge-blocks`
    3. Create PR: `gh pr create --title "feat(knowledge): add Heaper knowledge blocks" --body "$(cat <<'EOF'
## Summary
- Add KnowledgeBlock dataclass with bidirectional linking
- Add BlockRegistry with CRUD, linking, and query operations
- Add MemoryBlockBridge for EpisodicMemory integration
- Add NEBBus event publishing for block events
- 100% test coverage achieved

## Test plan
- [ ] All unit tests pass
- [ ] Integration tests pass
- [ ] Performance tests meet targets
- [ ] Coverage at 100%

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"`
    4. Verify CI: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: All CI checks pass, PR ready for review
  - **Commit**: None

## Phase 5: PR Lifecycle

- [ ] 5.1 Address review comments
  - **Do**: Monitor PR for comments, address feedback
  - **Verify**: All review comments resolved
  - **Done when**: PR approved
  - **Commit**: `fix(knowledge): address review feedback` (as needed)

- [ ] 5.2 Final validation
  - **Do**: Run final verification before merge
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: CI passes, PR approved, ready to merge
  - **Commit**: None

---

## Unresolved Questions

- None at this time

## Notes

- POC shortcuts: Linear scan for similarity (defer FAISS), no CRDT (defer to Phase VI)
- Production TODOs: Add FAISS indexing for >10k blocks, add CRDT for distributed sync
- File structure follows existing swarm patterns (experience_store, episodic_memory)

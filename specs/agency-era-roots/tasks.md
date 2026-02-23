---
spec: agency-era-roots
phase: tasks
total_tasks: 16
created: 2026-02-23T12:34:06-06:00
generated: auto
---

# Tasks: agency-era-roots

## Phase 1: Make It Work (POC)

Focus: Validate EpisodicMemory storage and retrieval works end-to-end. Skip tests, accept simple hash-based embeddings.

- [x] 1.1 Create Experience dataclass with embedding field
  - **Do**: Create `systems/swarm/memory/experience.py` with Experience dataclass containing experience_id, agent_id, task_type, action, outcome, description, embedding, metadata, timestamp
  - **Files**: `systems/swarm/memory/experience.py`, `systems/swarm/memory/__init__.py`
  - **Done when**: Can instantiate Experience and access all fields
  - **Verify**: `python -c "from systems.swarm.memory import Experience; e = Experience('test', 'agent1', 'CODE_GEN', 'write', 'success', 'desc', [0.1]*128, {}, 0.0); print(e)"`
  - **Commit**: `feat(memory): add Experience dataclass`
  - _Requirements: FR-1_
  - _Design: EpisodicMemory component_

- [x] 1.2 Implement ExperienceStore with JSON persistence
  - **Do**: Create `systems/swarm/memory/experience_store.py` with load(), save(), add(), get_all() methods. Store at `.geometry/episodic_memory.json`. Use file locking from TaskBoard pattern.
  - **Files**: `systems/swarm/memory/experience_store.py`
  - **Done when**: Can save and load experiences from JSON file
  - **Verify**: `python -c "from systems.swarm.memory import ExperienceStore; s = ExperienceStore(); s.add(Experience('t1', 'a1', 'T', 'a', 's', 'd', [0.1]*128, {}, 0)); print(len(s.get_all()))"`
  - **Commit**: `feat(memory): add ExperienceStore with JSON persistence`
  - _Requirements: FR-2_
  - _Design: ExperienceStore component_

- [x] 1.3 Implement simple hash-based embedding generator
  - **Do**: Add `generate_embedding(text: str) -> List[float]` function that creates deterministic 128-dim vectors from text using hashlib. Normalize to unit length.
  - **Files**: `systems/swarm/memory/experience_store.py` (add to same file)
  - **Done when**: Same text produces same embedding, different texts produce different embeddings
  - **Verify**: `python -c "from systems.swarm.memory import generate_embedding; e1 = generate_embedding('test'); e2 = generate_embedding('test'); assert e1 == e2; print('OK')"`
  - **Commit**: `feat(memory): add hash-based embedding generator`
  - _Requirements: FR-5_
  - _Design: EpisodicMemory embedding generation_

- [x] 1.4 Implement ExperienceRetriever with cosine similarity
  - **Do**: Create `systems/swarm/memory/experience_retriever.py` with find_similar(query_embedding, outcome_filter, k=5) method. Reuse cosine similarity logic from SubscriptionManager.
  - **Files**: `systems/swarm/memory/experience_retriever.py`
  - **Done when**: Can query similar experiences and get ranked results
  - **Verify**: `python -c "from systems.swarm.memory import ExperienceRetriever; r = ExperienceRetriever(); r.find_similar([0.1]*128, 'success', 3); print('OK')"`
  - **Commit**: `feat(memory): add ExperienceRetriever with similarity search`
  - _Requirements: FR-3, FR-4_
  - _Design: ExperienceRetriever component_

- [x] 1.5 Create EpisodicMemory facade class
  - **Do**: Create `systems/swarm/memory/episodic_memory.py` that combines Store and Retriever. Add store_experience(), check_similar_failures(), find_similar_successes() methods.
  - **Files**: `systems/swarm/memory/episodic_memory.py`
  - **Done when**: Single class provides all memory operations
  - **Verify**: `python -c "from systems.swarm.memory import EpisodicMemory; m = EpisodicMemory('test_agent'); m.store_experience('CODE_GEN', 'write', 'success', 'did stuff'); print(len(m.check_similar_failures([0.1]*128)))"`
  - **Commit**: `feat(memory): add EpisodicMemory facade class`
  - _Requirements: FR-1, FR-3, FR-4_
  - _Design: EpisodicMemory component_

- [x] 1.6 Create RecursiveGrowth skeleton with NEBBus integration
  - **Do**: Create `systems/swarm/growth/recursive_growth.py` with RecursiveGrowth class that subscribes to `task.**` events. Track basic metrics (counts per outcome).
  - **Files**: `systems/swarm/growth/recursive_growth.py`, `systems/swarm/growth/__init__.py`
  - **Done when**: Class can subscribe to NEBBus and receive task events
  - **Verify**: `python -c "from systems.swarm.growth import RecursiveGrowth; from systems.swarm import NEBBus; bus = NEBBus('test'); rg = RecursiveGrowth(bus); print('OK')"`
  - **Commit**: `feat(growth): add RecursiveGrowth with NEBBus integration`
  - _Requirements: FR-6, FR-7_
  - _Design: RecursiveGrowth component_

- [x] 1.7 Add PatternAnalyzer for performance metrics
  - **Do**: Create `systems/swarm/growth/pattern_analyzer.py` with analyze_agent_performance(experiences) returning dict with success_rate, common_failures, avg_completion_time.
  - **Files**: `systems/swarm/growth/pattern_analyzer.py`
  - **Done when**: Can analyze list of experiences and return metrics
  - **Verify**: `python -c "from systems.swarm.growth import PatternAnalyzer; pa = PatternAnalyzer(); print(pa.analyze_agent_performance([]))"`
  - **Commit**: `feat(growth): add PatternAnalyzer for metrics`
  - _Requirements: FR-6_
  - _Design: PatternAnalyzer component_

- [x] 1.8 POC Checkpoint - End-to-end memory flow
  - **Do**: Create script that demonstrates: store experience, query similar, analyze patterns
  - **Files**: `systems/swarm/memory/demo_poc.py`
  - **Done when**: Script runs without errors, shows memory working end-to-end
  - **Verify**: `python systems/swarm/memory/demo_poc.py && echo "POC SUCCESS"`
  - **Commit**: `feat(memory): complete POC checkpoint`

## Phase 2: Refactoring

After POC validated, clean up code and integrate with GuildAgents.

- [x] 2.1 Add MemoryMixin to GuildAgent base
  - **Do**: Add optional memory attribute to GuildAgent. Add store_experience() and check_past_experiences() methods that delegate to memory if available.
  - **Files**: `systems/swarm/guilds/base.py`
  - **Done when**: GuildAgent can use memory without breaking existing agents
  - **Verify**: `python -c "from systems.swarm.guilds import GuildAgent; print(GuildAgent)"`
  - **Commit**: `refactor(guilds): add MemoryMixin to GuildAgent base`
  - _Design: Integration method_

- [x] 2.2 Integrate memory into work_cycle
  - **Do**: Modify SwarmAgent.work_cycle() to check for similar failures before task execution and store experience after completion.
  - **Files**: `systems/swarm/swarm_agent.py`
  - **Done when**: Agent automatically uses memory in work cycle
  - **Verify**: `python -c "from systems.swarm import SwarmAgent; print('OK')"`
  - **Commit**: `refactor(agent): integrate memory into work cycle`
  - _Requirements: FR-9_
  - _Design: Data Flow_

- [x] 2.3 Add memory events to NEBBus
  - **Do**: Publish `memory.experience.stored` event when experience saved. Publish `memory.pattern.detected` when pattern found.
  - **Files**: `systems/swarm/memory/episodic_memory.py`
  - **Done when**: Events published via NEBBus
  - **Verify**: Check event is published with callback
  - **Commit**: `feat(memory): add NEBBus event publishing`
  - _Requirements: FR-7_
  - _Design: Data Flow_

## Phase 3: Testing

- [x] 3.1 Unit tests for Experience and ExperienceStore
  - **Do**: Create `systems/swarm/memory/test_episodic_memory.py` with tests for Experience creation, Store save/load, embedding generation.
  - **Files**: `systems/swarm/memory/test_episodic_memory.py`
  - **Done when**: All tests pass, >80% coverage
  - **Verify**: `python -m pytest systems/swarm/memory/test_episodic_memory.py -v`
  - **Commit**: `test(memory): add unit tests for Experience and Store`
  - _Requirements: AC-1.1, AC-1.2, AC-1.3_

- [x] 3.2 Unit tests for ExperienceRetriever and similarity
  - **Do**: Add tests for find_similar(), cosine similarity accuracy, outcome filtering.
  - **Files**: `systems/swarm/memory/test_episodic_memory.py`
  - **Done when**: Similarity tests verify correct ranking
  - **Verify**: `python -m pytest systems/swarm/memory/test_episodic_memory.py -v -k similarity`
  - **Commit**: `test(memory): add similarity tests`
  - _Requirements: AC-2.1, AC-2.2, AC-3.1, AC-3.2_

- [ ] 3.3 Unit tests for RecursiveGrowth and PatternAnalyzer
  - **Do**: Create `systems/swarm/growth/test_recursive_growth.py` with tests for metric calculation, pattern detection, event publishing.
  - **Files**: `systems/swarm/growth/test_recursive_growth.py`
  - **Done when**: Growth system tests pass
  - **Verify**: `python -m pytest systems/swarm/growth/test_recursive_growth.py -v`
  - **Commit**: `test(growth): add RecursiveGrowth tests`
  - _Requirements: AC-4.1, AC-4.2, AC-4.3_

## Phase 4: Quality Gates

- [ ] 4.1 Run all swarm tests to verify no regressions
  - **Do**: Execute full swarm test suite
  - **Verify**: `python -m pytest systems/swarm/test_*.py -v --tb=short`
  - **Done when**: All 72+ tests pass
  - **Commit**: `fix(memory): address test regressions` (if needed)

- [ ] 4.2 Type checking and linting
  - **Do**: Run mypy and ruff on new modules
  - **Verify**: `mypy systems/swarm/memory/ systems/swarm/growth/ && ruff check systems/swarm/memory/ systems/swarm/growth/`
  - **Done when**: No errors
  - **Commit**: `fix(lint): address type/lint issues` (if needed)

## Notes

- **POC shortcuts taken**: Hash-based embeddings (not LLM), JSON storage (not vector DB), no cross-agent sharing
- **Production TODOs**: Integrate real embedding model, migrate to SQLite for better querying, add memory expiration/cleanup

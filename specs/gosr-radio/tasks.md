# Tasks: Geometry OS Radio (GOSR)

## Phase 1: Make It Work (POC)

Focus: Core module structure, base classes, basic broadcast flow. Skip WordPress sync, feedback evolution.

- [x] 1.1 Create module structure and NarrativeBroadcaster base class
  - **Do**:
    1. Create `systems/evolution_daemon/narrative_broadcaster/__init__.py`
    2. Create `systems/evolution_daemon/narrative_broadcaster/broadcaster.py` with `BroadcastSegment` dataclass and `NarrativeBroadcaster` class
    3. Create `systems/evolution_daemon/tests/test_narrative_broadcaster.py` with basic tests
  - **Files**:
    - Create: `systems/evolution_daemon/narrative_broadcaster/__init__.py`
    - Create: `systems/evolution_daemon/narrative_broadcaster/broadcaster.py`
    - Create: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: Tests pass, broadcaster can be initialized and enable/disable works
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestNarrativeBroadcaster -v`
  - **Commit**: `feat(radio): add NarrativeBroadcaster base class and module structure`
  - _Requirements: FR-1, FR-5_
  - _Design: NarrativeBroadcaster component_

- [x] 1.2 Implement TopicMemory for deduplication
  - **Do**:
    1. Create `topic_memory.py` with `TopicEntry` dataclass and `TopicMemory` class
    2. Implement `add_topic()`, `is_duplicate()` (exact match), `_cosine_similarity()`
    3. Implement hash-based 384-dim embedding generation (follow `NeuralEvent._generate_vector()` pattern)
    4. Add tests for TopicMemory
  - **Files**:
    - Create: `systems/evolution_daemon/narrative_broadcaster/topic_memory.py`
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: TopicMemory detects exact and semantic duplicates with threshold 0.85
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestTopicMemory -v`
  - **Commit**: `feat(radio): add TopicMemory for hybrid deduplication`
  - _Requirements: FR-2, FR-4, NFR-5_
  - _Design: TopicMemory component, hash embedding strategy_

- [x] 1.3 Implement SegmentPool for content generation
  - **Do**:
    1. Create `segment_pool.py` with `SegmentType` enum (WEATHER, NEWS, PHILOSOPHY, GOSSIP, MEDITATION, ARCHIVE)
    2. Create `SegmentConfig` dataclass with weight, entropy_range, templates
    3. Implement `select_segment()` with entropy-weighted selection
    4. Implement `generate_content()` with template substitution
    5. Add tests for SegmentPool
  - **Files**:
    - Create: `systems/evolution_daemon/narrative_broadcaster/segment_pool.py`
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: SegmentPool selects segments based on entropy, generates content from telemetry
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestSegmentPool -v`
  - **Commit**: `feat(radio): add SegmentPool with 6 segment types`
  - _Requirements: FR-11, FR-3.3, FR-3.4_
  - _Design: SegmentPool component, entropy weighting table_

- [x] 1.4 [VERIFY] Quality checkpoint: pytest + import check
  - **Do**: Run pytest on new module, verify imports work from parent package
  - **Verify**:
    - `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -c "from systems.evolution_daemon.narrative_broadcaster import NarrativeBroadcaster; print('OK')"`
    - `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v --tb=short`
  - **Done when**: All tests pass, no import errors
  - **Commit**: `chore(radio): pass quality checkpoint 1.4` (only if fixes needed)

- [x] 1.5 Implement PersonalityEngine with station configs
  - **Do**:
    1. Create `systems/evolution_daemon/narrative_broadcaster/stations/` directory
    2. Create `substrate_jazz.yaml` (87.6 FM) - contemplative, elevated vocabulary
    3. Create `debug_metal.yaml` (92.3 FM) - aggressive, technical
    4. Create `personality_engine.py` with YAML loading and `apply_personality()`
    5. Implement vocabulary replacements and style modifiers
    6. Add tests for PersonalityEngine
  - **Files**:
    - Create: `systems/evolution_daemon/narrative_broadcaster/personality_engine.py`
    - Create: `systems/evolution_daemon/narrative_broadcaster/stations/substrate_jazz.yaml`
    - Create: `systems/evolution_daemon/narrative_broadcaster/stations/debug_metal.yaml`
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: PersonalityEngine loads YAML configs, transforms content with vocabulary/style
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestPersonalityEngine -v`
  - **Commit**: `feat(radio): add PersonalityEngine with Substrate Jazz and Debug Metal stations`
  - _Requirements: FR-3, AC-2.1, AC-2.3, AC-2.4_
  - _Design: PersonalityEngine component, station config schema_

- [x] 1.6 Add remaining station configs (Silicon Noir, Neutral Chronicler)
  - **Do**:
    1. Create `silicon_noir.yaml` (95.1 FM) - cyberpunk, mysterious
    2. Create `neutral_chronicler.yaml` (99.9 FM) - factual, dry
  - **Files**:
    - Create: `systems/evolution_daemon/narrative_broadcaster/stations/silicon_noir.yaml`
    - Create: `systems/evolution_daemon/narrative_broadcaster/stations/neutral_chronicler.yaml`
  - **Done when**: 4 station configs exist, all loadable by PersonalityEngine
  - **Verify**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster.personality_engine import PersonalityEngine; e = PersonalityEngine(); print(len(e.stations))"`
  - **Commit**: `feat(radio): add Silicon Noir and Neutral Chronicler stations`
  - _Requirements: AC-2.1_
  - _Design: Station reference table_

- [x] 1.7 Integrate components into NarrativeBroadcaster
  - **Do**:
    1. Wire SegmentPool, TopicMemory, PersonalityEngine into broadcaster `__init__`
    2. Implement full `broadcast()` method with flow: select -> generate -> dedup -> transform
    3. Handle duplicate rejection by retrying with alternate segment type
    4. Add integration tests
  - **Files**:
    - Modify: `systems/evolution_daemon/narrative_broadcaster/broadcaster.py`
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: Full broadcast flow generates transformed, unique content
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestNarrativeBroadcasterIntegration -v`
  - **Commit**: `feat(radio): integrate all components into NarrativeBroadcaster`
  - _Requirements: FR-1, FR-2, FR-3_
  - _Design: Data flow sequence diagram_

- [x] 1.8 [VERIFY] Quality checkpoint: all radio tests pass
  - **Do**: Run full test suite for narrative_broadcaster module
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`
  - **Done when**: All tests pass (expect 15+ tests)
  - **Commit**: `chore(radio): pass quality checkpoint 1.8` (only if fixes needed)

- [x] 1.9 Wire broadcaster into Evolution Daemon
  - **Do**:
    1. Add conditional import for NarrativeBroadcaster in `evolution_daemon.py`
    2. Add `radio_enabled`, `radio_station_id`, `radio_broadcaster` state to `__init__`
    3. Add `enable_radio(station_id)` method (follow `enable_ambient_mode()` pattern)
    4. Add `--radio` and `--station` CLI arguments
    5. Add `_radio_broadcast_loop()` async method
  - **Files**:
    - Modify: `systems/evolution_daemon/evolution_daemon.py`
  - **Done when**: Daemon can start with `--ambient --radio --station 87.6`
  - **Verify**: `python3 systems/evolution_daemon/evolution_daemon.py --help | grep -E "(radio|station)"`
  - **Commit**: `feat(daemon): integrate GOSR Radio into Evolution Daemon`
  - _Requirements: FR-5_
  - _Design: Evolution Daemon Integration section_

- [x] 1.10 Add RADIO_BROADCAST event to Visual Bridge
  - **Do**:
    1. Add `radio_broadcast` event handler in `visual_bridge.py`
    2. Broadcast to WebSocket clients on radio segment generation
  - **Files**:
    - Modify: `systems/visual_shell/api/visual_bridge.py`
  - **Done when**: Visual Bridge accepts and forwards radio broadcast events
  - **Verify**: `grep -n "radio" systems/visual_shell/api/visual_bridge.py | head -5`
  - **Commit**: `feat(bridge): add RADIO_BROADCAST event handling`
  - _Requirements: FR-6_
  - _Design: Visual Bridge integration_

- [x] 1.11 POC Checkpoint: End-to-end radio broadcast
  - **Do**:
    1. Start daemon with radio enabled
    2. Verify broadcasts appear in logs every 30s
    3. Check content is transformed by station personality
  - **Done when**: Radio broadcasts visible in daemon output, no crashes over 2 minutes
  - **Verify**: `timeout 90 python3 systems/evolution_daemon/evolution_daemon.py --ambient --radio --station 87.6 2>&1 | grep -E "(GOSR|Broadcast)" | head -10`
  - **Commit**: `feat(radio): complete POC - radio broadcasts working`
  - _Requirements: All FR-1 through FR-6 POC validation_

## Phase 2: Refactoring

After POC validated, clean up code structure.

- [x] 2.1 Add FeedbackOrchestrator skeleton
  - **Do**:
    1. Create `feedback_orchestrator.py` with `FeedbackSignal` dataclass
    2. Create `FeedbackOrchestrator` class with `accept_feedback()` and `get_adjusted_weights()`
    3. Add basic tests
  - **Files**:
    - Create: `systems/evolution_daemon/narrative_broadcaster/feedback_orchestrator.py`
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: FeedbackOrchestrator accepts signals, returns adjusted weights
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestFeedbackOrchestrator -v`
  - **Commit**: `feat(radio): add FeedbackOrchestrator for evolution`
  - _Requirements: FR-7_
  - _Design: FeedbackOrchestrator component_

- [x] 2.2 Implement WordPress topic sync in TopicMemory
  - **Do**:
    1. Add `sync_to_wordpress()` async method to TopicMemory
    2. Add `load_from_wordpress()` async method for startup recovery
    3. Add batch sync logic (50 topics max per batch, 5 min interval)
    4. Follow `SemanticPublisher` rate limiting pattern
  - **Files**:
    - Modify: `systems/evolution_daemon/narrative_broadcaster/topic_memory.py`
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: TopicMemory can sync/load from WordPress
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestTopicMemory::test_wordpress_sync -v`
  - **Commit**: `feat(radio): add WordPress topic sync to TopicMemory`
  - _Requirements: FR-8, AC-5.1 through AC-5.4_
  - _Design: WordPress sync section_

- [x] 2.3 Add ARCHIVE segment git history mining
  - **Do**:
    1. Add `_get_git_commits_for_date()` method to SegmentPool
    2. Implement same-day historical commit lookup
    3. Add fallback to WordPress posts when git unavailable
    4. Anonymize author names in output
  - **Files**:
    - Modify: `systems/evolution_daemon/narrative_broadcaster/segment_pool.py`
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: ARCHIVE segments pull from git history
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestSegmentPool::test_archive_segment -v`
  - **Commit**: `feat(radio): add git history mining for ARCHIVE segments`
  - _Requirements: FR-9, AC-7.1 through AC-7.4_
  - _Design: ARCHIVE segment type_

- [x] 2.4 [VERIFY] Quality checkpoint: pytest + type hints
  - **Do**: Run tests, verify no new lint issues
  - **Verify**:
    - `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`
    - `python3 -m py_compile systems/evolution_daemon/narrative_broadcaster/*.py`
  - **Done when**: All tests pass, all files compile
  - **Commit**: `chore(radio): pass quality checkpoint 2.4` (only if fixes needed)

## Phase 3: Testing

- [x] 3.1 Unit tests for edge cases
  - **Do**:
    1. Test content exhaustion (3 duplicate rejections triggers entropy injection)
    2. Test memory pressure (LRU eviction at 1000 topics)
    3. Test zero entropy fallback
    4. Test invalid station ID handling
  - **Files**:
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: Edge case tests pass, coverage > 80%
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v --cov=systems/evolution_daemon/narrative_broadcaster --cov-report=term-missing 2>/dev/null || pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`
  - **Commit**: `test(radio): add edge case tests`
  - _Requirements: Error handling table_
  - _Design: Edge cases section_

- [ ] 3.2 Integration tests for daemon + radio
  - **Do**:
    1. Test daemon startup with `--radio` flag
    2. Test station switching at runtime
    3. Test broadcast loop with mock telemetry
    4. Test visual bridge event dispatch
  - **Files**:
    - Modify: `systems/evolution_daemon/tests/test_narrative_broadcaster.py`
  - **Done when**: Integration tests pass
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestDaemonIntegration -v`
  - **Commit**: `test(radio): add daemon integration tests`
  - _Requirements: FR-5, FR-10_

- [ ] 3.3 [VERIFY] Quality checkpoint: full test suite
  - **Do**: Run complete test suite
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`
  - **Done when**: All tests pass (expect 25+ tests)
  - **Commit**: `chore(radio): pass quality checkpoint 3.3` (only if fixes needed)

## Phase 4: HUD Integration

- [ ] 4.1 Add radio section to Visual Debug Overlay
  - **Do**:
    1. Add `radioState` to `VisualDebugOverlay` constructor
    2. Add `handleRadioBroadcast()` method
    3. Add `_renderRadioSection()` method with purple theme (rgba(60, 0, 60, 0.9))
    4. Display station ID, last 3 lines of broadcast, counter
    5. Listen for `RADIO_BROADCAST` custom events
  - **Files**:
    - Modify: `systems/visual_shell/web/visual_debug_overlay.js`
  - **Done when**: HUD shows radio section when Ctrl+Shift+V pressed
  - **Verify**: `grep -n "_renderRadioSection" systems/visual_shell/web/visual_debug_overlay.js`
  - **Commit**: `feat(hud): add GOSR Radio display to Visual Debug Overlay`
  - _Requirements: FR-6, AC-4.1 through AC-4.4_
  - _Design: HUD Radio Display section_

- [ ] 4.2 Wire RADIO_BROADCAST events in application.js
  - **Do**:
    1. Add `RADIO_BROADCAST` event dispatcher in WebSocket message handler
    2. Dispatch to `window.dispatchEvent(new CustomEvent('RADIO_BROADCAST', {...}))`
  - **Files**:
    - Modify: `systems/visual_shell/web/application.js`
  - **Done when**: Browser receives and dispatches radio events
  - **Verify**: `grep -n "RADIO_BROADCAST" systems/visual_shell/web/application.js`
  - **Commit**: `feat(web): wire RADIO_BROADCAST events to HUD`
  - _Requirements: FR-6_

- [ ] 4.3 [VERIFY] E2E test: HUD displays radio
  - **Do**: Manual verification - start daemon with radio, open browser, press Ctrl+Shift+V
  - **Verify**:
    - `grep -c "_renderRadioSection" systems/visual_shell/web/visual_debug_overlay.js`
    - `grep -c "RADIO_BROADCAST" systems/visual_shell/web/application.js`
  - **Done when**: Both grep commands return > 0
  - **Commit**: `chore(radio): verify HUD radio section integration`

## Phase 5: Quality Gates

- [ ] 5.1 [VERIFY] Full local CI
  - **Do**: Run all verification commands
  - **Verify**:
    - `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`
    - `python3 -c "from systems.evolution_daemon.narrative_broadcaster import NarrativeBroadcaster"`
    - `python3 -m py_compile systems/evolution_daemon/narrative_broadcaster/*.py`
    - `python3 systems/evolution_daemon/evolution_daemon.py --help | grep -E "(radio|station)"`
  - **Done when**: All commands exit 0
  - **Commit**: `chore(radio): pass local CI` (only if fixes needed)

- [ ] 5.2 Create PR and verify CI
  - **Do**:
    1. Verify on feature branch: `git branch --show-current`
    2. Push: `git push -u origin feat/ouroboros-level2-interactive-ui`
    3. Create PR: `gh pr create --title "feat(radio): Add GOSR Radio Station" --body "$(cat <<'EOF'
## Summary
- Add NarrativeBroadcaster module for 24/7 autonomous radio
- 6 segment types with entropy-weighted selection
- 4 station personalities (Jazz, Metal, Noir, Chronicler)
- TopicMemory for semantic deduplication (0.85 threshold)
- HUD integration with purple-themed radio section

## Test plan
- [ ] Unit tests pass: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py`
- [ ] Daemon starts with radio: `python3 systems/evolution_daemon/evolution_daemon.py --ambient --radio --station 87.6`
- [ ] HUD displays radio section (Ctrl+Shift+V)

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"`
    4. Wait for CI: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: CI passes, PR ready for review
  - **Commit**: None

- [ ] 5.3 [VERIFY] AC checklist verification
  - **Do**: Programmatically verify acceptance criteria
  - **Verify**:
    - AC-1.1: `grep -c "broadcast_interval" systems/evolution_daemon/narrative_broadcaster/broadcaster.py`
    - AC-2.1: `ls systems/evolution_daemon/narrative_broadcaster/stations/*.yaml | wc -l` (expect 4)
    - AC-3.1-3.4: `grep -c "entropy" systems/evolution_daemon/narrative_broadcaster/segment_pool.py`
    - AC-4.1-4.4: `grep -c "_renderRadioSection" systems/visual_shell/web/visual_debug_overlay.js`
  - **Done when**: All grep counts > 0
  - **Commit**: None

## Notes

### POC Shortcuts
- WordPress sync stubbed in Phase 2 (TopicMemory works in-memory only for POC)
- FeedbackOrchestrator skeleton only (no actual weight adjustments)
- ARCHIVE segments use fallback templates (git mining in Phase 2)
- No actual human ratings collection (infrastructure ready)

### Production TODOs
- [ ] Implement full WordPress sync with rate limiting
- [ ] Add git history mining for ARCHIVE segments
- [ ] Add human rating collection via HUD buttons
- [ ] Implement feedback-driven weight evolution
- [ ] Add sentence-transformers for better embeddings (optional)
- [ ] Add TTS audio output (out of scope for this phase)

### Key Files Summary
| Component | File | Purpose |
|-----------|------|---------|
| NarrativeBroadcaster | `broadcaster.py` | Main orchestrator |
| TopicMemory | `topic_memory.py` | Dedup with vectors |
| SegmentPool | `segment_pool.py` | Content generation |
| PersonalityEngine | `personality_engine.py` | Station voices |
| FeedbackOrchestrator | `feedback_orchestrator.py` | Evolution |
| Station configs | `stations/*.yaml` | 4 station definitions |
| HUD integration | `visual_debug_overlay.js` | Radio display |

### Test Command Reference
```bash
# Run all radio tests
pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v

# Run specific test class
pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestTopicMemory -v

# Quick import check
python3 -c "from systems.evolution_daemon.narrative_broadcaster import NarrativeBroadcaster; b = NarrativeBroadcaster(); print(b.station_id)"

# Start daemon with radio
python3 systems/evolution_daemon/evolution_daemon.py --ambient --radio --station 87.6
```

---
spec: transmission-protocol
phase: tasks
total_tasks: 28
created: 2026-02-23T18:30:00Z
---

# Tasks: Transmission Protocol

## Execution Context

**Interview Responses:**
- Testing depth: Standard - unit + integration tests, reasonable coverage
- Deployment approach: Standard CI/CD - normal commit and merge workflow
- Execution priority: Balanced - reasonable quality with speed

**Project Commands (from research):**
- Test runner: `pytest tests/`
- Type check: `mypy systems/` or `pyright`
- Lint: `ruff check systems/`
- Build: N/A (Python project)

---

## Phase 1: Make It Work (POC)

Focus: Validate P2P mentoring flow works end-to-end. Skip tests initially.

- [x] 1.1 Create transmission types module with enums and base dataclasses
  - **Do**:
    1. Create `systems/swarm/transmission/__init__.py` (empty init)
    2. Create `systems/swarm/transmission/types.py` with:
       - `TransmissionStatus` enum (PENDING, ACTIVE, PAUSED, COMPLETED, CANCELLED)
       - `TransmissionRole` enum (SCRIBE, SPROUT)
       - `BehaviorCategory` enum (RESPECTFUL, HELPFUL, POSITIVE, PATIENT, CLEAR, TOXIC)
       - `TransmissionSession` dataclass with lifecycle methods
       - `CovenantOath` dataclass with 7 articles and violation tracking
  - **Files**:
    - `systems/swarm/transmission/__init__.py` (create)
    - `systems/swarm/transmission/types.py` (create)
  - **Done when**: Module imports without error, enums have all values
  - **Verify**: `python -c "from systems.swarm.transmission.types import TransmissionStatus, TransmissionSession, CovenantOath; print(TransmissionStatus.PENDING.value)"`
  - **Commit**: `feat(transmission): add core types and enums`
  - _Requirements: FR-1, FR-2, FR-12_
  - _Design: P0 Core Infrastructure_

- [x] 1.2 Add VPSLocation, SephiroticNode, SocraticQuestion, ProsocialScore dataclasses
  - **Do**:
    1. Add `VPSLocation` dataclass with Haversine distance calculation
    2. Add `SephiroticNode` dataclass with 10 canonical nodes factory
    3. Add `SocraticQuestion` dataclass with levels and categories
    4. Add `ProsocialScore` dataclass with weighted category scoring
    5. Add `HapticPattern` dataclass (P2 placeholder)
  - **Files**: `systems/swarm/transmission/types.py` (extend)
  - **Done when**: All dataclasses have to_json/from_json methods
  - **Verify**: `python -c "from systems.swarm.transmission.types import VPSLocation, SephiroticNode, SocraticQuestion, ProsocialScore; print(SephiroticNode.create_all())"`
  - **Commit**: `feat(transmission): add P1 dataclasses for AR and scoring`
  - _Requirements: FR-8, FR-9, FR-10, FR-11, FR-13_
  - _Design: P1 Enhanced Features_

- [x] 1.3 Create TransmissionBoard with fcntl file locking
  - **Do**:
    1. Create `systems/swarm/transmission/board.py`
    2. Copy fcntl locking pattern from TaskBoard
    3. Implement `post(session)`, `get(session_id)`, `claim(session_id, scribe_id)`
    4. Implement `update(session)`, `get_pending()`, `get_active_for_scribe(scribe_id)`
    5. Publish NEB events on post/claim (if event_bus configured)
  - **Files**: `systems/swarm/transmission/board.py` (create)
  - **Done when**: Board can store/retrieve sessions atomically
  - **Verify**: `python -c "from systems.swarm.transmission.board import TransmissionBoard; print('import ok')"`
  - **Commit**: `feat(transmission): add TransmissionBoard with fcntl locking`
  - _Requirements: FR-3_
  - _Design: P0 TransmissionBoard_

- [x] 1.4 Create ScribeAgent extending GuildAgent
  - **Do**:
    1. Create `systems/swarm/transmission/scribe_agent.py`
    2. Extend GuildAgent with role="scribe"
    3. Implement `claim_session(session_id)` using TransmissionBoard
    4. Implement `send_question(question)` via NEB
    5. Implement `check_covenant_valid()` for oath tracking
    6. Implement `_summarize(result)` for logging
  - **Files**: `systems/swarm/transmission/scribe_agent.py` (create)
  - **Done when**: ScribeAgent can claim sessions and track covenant
  - **Verify**: `python -c "from systems.swarm.transmission.scribe_agent import ScribeAgent; print(ScribeAgent.__bases__)"`
  - **Commit**: `feat(transmission): add ScribeAgent for mentor players`
  - _Requirements: FR-4_
  - _Design: P0 ScribeAgent_

- [ ] 1.5 Create SproutAgent extending GuildAgent
  - **Do**:
    1. Create `systems/swarm/transmission/sprout_agent.py`
    2. Extend GuildAgent with role="sprout"
    3. Implement `request_session(topic, vps_location)` using TransmissionBoard
    4. Implement `cancel_request()` for pending sessions
    5. Implement `_summarize(result)` for logging
  - **Files**: `systems/swarm/transmission/sprout_agent.py` (create)
  - **Done when**: SproutAgent can request and cancel sessions
  - **Verify**: `python -c "from systems.swarm.transmission.sprout_agent import SproutAgent; print(SproutAgent.__bases__)"`
  - **Commit**: `feat(transmission): add SproutAgent for learner players`
  - _Requirements: FR-5_
  - _Design: P0 SproutAgent_

- [ ] 1.6 Create TransmissionNEBBridge for event topics
  - **Do**:
    1. Create `systems/swarm/transmission/neb_bridge.py`
    2. Implement subscribe_to_available(), subscribe_to_claimed(), subscribe_to_question()
    3. Implement subscribe_to_completed(), subscribe_to_prosocial()
    4. Follow SwarmNEBBridge pattern with subscribe_to_* methods
  - **Files**: `systems/swarm/transmission/neb_bridge.py` (create)
  - **Done when**: Bridge can subscribe to all transmission.** topics
  - **Verify**: `python -c "from systems.swarm.transmission.neb_bridge import TransmissionNEBBridge; print('import ok')"`
  - **Commit**: `feat(transmission): add TransmissionNEBBridge for event routing`
  - _Requirements: FR-7_
  - _Design: P0 TransmissionNEBBridge_

- [ ] 1.7 Register scribe/sprout roles in GuildFactory
  - **Do**:
    1. Modify `systems/swarm/guilds/factory.py`
    2. Import ScribeAgent, SproutAgent
    3. Add to _registry dict: "scribe": ScribeAgent, "sprout": SproutAgent
  - **Files**: `systems/swarm/guilds/factory.py` (modify)
  - **Done when**: GuildFactory.create("scribe", ...) returns ScribeAgent
  - **Verify**: `python -c "from systems.swarm.guilds.factory import GuildFactory; print(GuildFactory.available_roles())"`
  - **Commit**: `feat(guilds): register scribe and sprout agent roles`
  - _Requirements: FR-4, FR-5_
  - _Design: P0 Factory Registration_

- [ ] 1.8 Update __init__.py with module exports
  - **Do**:
    1. Add exports to `systems/swarm/transmission/__init__.py`
    2. Export: TransmissionStatus, TransmissionSession, TransmissionBoard, ScribeAgent, SproutAgent, TransmissionNEBBridge, CovenantOath
    3. Export P1 types: VPSLocation, SephiroticNode, SocraticQuestion, ProsocialScore
  - **Files**: `systems/swarm/transmission/__init__.py` (modify)
  - **Done when**: All types accessible from systems.swarm.transmission
  - **Verify**: `python -c "from systems.swarm.transmission import TransmissionBoard, ScribeAgent, SproutAgent; print('exports ok')"`
  - **Commit**: `feat(transmission): export all public types`
  - _Requirements: FR-1 through FR-7_
  - _Design: File Structure_

- [ ] 1.9 [VERIFY] Quality checkpoint: type check and lint
  - **Do**: Run type check and lint on transmission module
  - **Verify**: `python -m py_compile systems/swarm/transmission/*.py && echo "OK"`
  - **Done when**: No syntax errors, module imports cleanly
  - **Commit**: `chore(transmission): pass quality checkpoint` (if fixes needed)

- [ ] 1.10 Create ProsocialAuditor with LMStudio integration
  - **Do**:
    1. Create `systems/swarm/transmission/prosocial_auditor.py`
    2. Implement `ProsocialAuditor` class with LMStudioIntegration dependency
    3. Implement `audit_text(text)` returning ProsocialScore
    4. Use BehaviorCategory weights (RESPECTFUL=0.25, HELPFUL=0.25, etc.)
    5. Emit `prosocial.scored` NEB event on each analysis
    6. Handle LM Studio unavailability with mock response
  - **Files**: `systems/swarm/transmission/prosocial_auditor.py` (create)
  - **Done when**: Auditor scores text and emits events
  - **Verify**: `python -c "from systems.swarm.transmission.prosocial_auditor import ProsocialAuditor; print('import ok')"`
  - **Commit**: `feat(transmission): add ProsocialAuditor for AI moderation`
  - _Requirements: FR-16_
  - _Design: P1 ProsocialAuditor_

- [ ] 1.11 Create SessionManager for pairing logic
  - **Do**:
    1. Create `systems/swarm/transmission/session_manager.py`
    2. Implement `verify_colocalization(sprout_vps, scribe_vps)` using VPSLocation
    3. Implement `start_session(session_id)` transitioning to ACTIVE
    4. Implement `complete_session(session_id, metrics)` transitioning to COMPLETED
    5. Coordinate with ProsocialAuditor for session text auditing
  - **Files**: `systems/swarm/transmission/session_manager.py` (create)
  - **Done when**: Manager handles session lifecycle with colocalization
  - **Verify**: `python -c "from systems.swarm.transmission.session_manager import SessionManager; print('import ok')"`
  - **Commit**: `feat(transmission): add SessionManager for pairing`
  - _Requirements: FR-6_
  - _Design: P1 SessionManager_

- [ ] 1.12 [VERIFY] Quality checkpoint: type check and lint
  - **Do**: Run type check and lint on P1 components
  - **Verify**: `python -m py_compile systems/swarm/transmission/*.py && echo "OK"`
  - **Done when**: No syntax errors, all modules import cleanly
  - **Commit**: `chore(transmission): pass quality checkpoint` (if fixes needed)

- [ ] 1.13 POC Checkpoint: End-to-end session flow
  - **Do**:
    1. Create `systems/swarm/transmission/demo_poc.py` with manual test
    2. Create SproutAgent, request session
    3. Create ScribeAgent, claim session
    4. Verify session transitions PENDING -> ACTIVE
    5. Complete session, verify COMPLETED status
  - **Files**: `systems/swarm/transmission/demo_poc.py` (create, temporary)
  - **Done when**: Full session flow works without errors
  - **Verify**: `python systems/swarm/transmission/demo_poc.py && echo "POC OK"`
  - **Commit**: `feat(transmission): complete POC validation`

---

## Phase 2: Refactoring

Focus: Clean up code, add proper error handling, remove POC shortcuts.

- [ ] 2.1 Extract common agent patterns to base class mixin
  - **Do**:
    1. Review ScribeAgent and SproutAgent for common code
    2. Create `TransmissionAgentMixin` if patterns found
    3. Move shared session handling logic to mixin
  - **Files**: `systems/swarm/transmission/types.py` (extend with mixin)
  - **Done when**: DRY code, clear separation of concerns
  - **Verify**: `python -m py_compile systems/swarm/transmission/*.py && echo "OK"`
  - **Commit**: `refactor(transmission): extract common agent patterns`
  - _Design: Code Organization_

- [ ] 2.2 Add comprehensive error handling to TransmissionBoard
  - **Do**:
    1. Add try/except for file operations
    2. Handle corrupted JSON files gracefully (skip and log)
    3. Add proper error messages for claim failures
    4. Add timeout handling for lock acquisition
  - **Files**: `systems/swarm/transmission/board.py` (modify)
  - **Done when**: All error paths handled, no silent failures
  - **Verify**: `python -m py_compile systems/swarm/transmission/board.py && echo "OK"`
  - **Commit**: `refactor(transmission): add error handling to board`
  - _Design: Error Handling_

- [ ] 2.3 Add validation to session lifecycle transitions
  - **Do**:
    1. Add state machine validation to TransmissionSession
    2. Prevent invalid transitions (e.g., COMPLETED -> ACTIVE)
    3. Add error messages for invalid state changes
  - **Files**: `systems/swarm/transmission/types.py` (modify TransmissionSession)
  - **Done when**: Invalid transitions raise exceptions
  - **Verify**: `python -m py_compile systems/swarm/transmission/types.py && echo "OK"`
  - **Commit**: `refactor(transmission): add state machine validation`
  - _Design: Error Handling_

- [ ] 2.4 Improve ProsocialAuditor with caching
  - **Do**:
    1. Add simple in-memory cache for repeated text analysis
    2. Add timeout handling for LM Studio calls
    3. Improve mock response quality
  - **Files**: `systems/swarm/transmission/prosocial_auditor.py` (modify)
  - **Done when**: Auditor handles latency targets (<2s)
  - **Verify**: `python -m py_compile systems/swarm/transmission/prosocial_auditor.py && echo "OK"`
  - **Commit**: `refactor(transmission): add caching to prosocial auditor`
  - _Design: Performance Considerations_

- [ ] 2.5 [VERIFY] Quality checkpoint: type check and lint
  - **Do**: Run type check and lint on refactored code
  - **Verify**: `python -m py_compile systems/swarm/transmission/*.py && echo "OK"`
  - **Done when**: No syntax errors, clean code
  - **Commit**: `chore(transmission): pass quality checkpoint` (if fixes needed)

---

## Phase 3: Testing

Focus: Unit tests, integration tests for all components.

- [ ] 3.1 Create unit tests for types and enums
  - **Do**:
    1. Create `tests/swarm/transmission/__init__.py`
    2. Create `tests/swarm/transmission/test_types.py`
    3. Test TransmissionStatus enum values
    4. Test TransmissionSession lifecycle transitions
    5. Test CovenantOath signing and violations
    6. Test VPSLocation distance calculation
    7. Test SephiroticNode create_all()
    8. Test ProsocialScore weighted calculation
  - **Files**:
    - `tests/swarm/transmission/__init__.py` (create)
    - `tests/swarm/transmission/test_types.py` (create)
  - **Done when**: All type tests pass
  - **Verify**: `pytest tests/swarm/transmission/test_types.py -v`
  - **Commit**: `test(transmission): add unit tests for types`
  - _Requirements: AC-1.1, AC-1.2, AC-1.3, AC-2.2_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.2 Create unit tests for TransmissionBoard
  - **Do**:
    1. Create `tests/swarm/transmission/test_board.py`
    2. Test post() creates session file
    3. Test get() retrieves session
    4. Test claim() atomic locking
    5. Test concurrent claim prevention
    6. Test get_pending() returns only PENDING
    7. Test get_active_for_scribe() returns only active
  - **Files**: `tests/swarm/transmission/test_board.py` (create)
  - **Done when**: All board tests pass
  - **Verify**: `pytest tests/swarm/transmission/test_board.py -v`
  - **Commit**: `test(transmission): add unit tests for board`
  - _Requirements: AC-3.2, AC-3.4_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.3 Create unit tests for agents
  - **Do**:
    1. Create `tests/swarm/transmission/test_agents.py`
    2. Test ScribeAgent role="scribe"
    3. Test ScribeAgent claim_session()
    4. Test ScribeAgent covenant validation
    5. Test SproutAgent role="sprout"
    6. Test SproutAgent request_session()
    7. Test SproutAgent cancel_request()
  - **Files**: `tests/swarm/transmission/test_agents.py` (create)
  - **Done when**: All agent tests pass
  - **Verify**: `pytest tests/swarm/transmission/test_agents.py -v`
  - **Commit**: `test(transmission): add unit tests for agents`
  - _Requirements: AC-2.1, AC-2.4, AC-3.1, AC-3.3_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.4 Create unit tests for NEB bridge
  - **Do**:
    1. Create `tests/swarm/transmission/test_neb_bridge.py`
    2. Test subscribe_to_available()
    3. Test subscribe_to_claimed()
    4. Test subscribe_to_question()
    5. Test subscribe_to_completed()
    6. Test subscribe_to_prosocial()
  - **Files**: `tests/swarm/transmission/test_neb_bridge.py` (create)
  - **Done when**: All bridge tests pass
  - **Verify**: `pytest tests/swarm/transmission/test_neb_bridge.py -v`
  - **Commit**: `test(transmission): add unit tests for NEB bridge`
  - _Requirements: AC-2.3, AC-3.5, AC-5.4_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.5 [VERIFY] Quality checkpoint: all unit tests pass
  - **Do**: Run all transmission unit tests
  - **Verify**: `pytest tests/swarm/transmission/ -v --tb=short`
  - **Done when**: All tests pass, no failures
  - **Commit**: `chore(transmission): pass quality checkpoint` (if fixes needed)

- [ ] 3.6 Create integration tests for session flow
  - **Do**:
    1. Create `tests/swarm/transmission/test_integration.py`
    2. Test full session flow: request -> claim -> start -> complete
    3. Test concurrent claiming (race condition prevention)
    4. Test NEB event delivery for session lifecycle
    5. Test colocalization verification
    6. Test covenant violation blocking
    7. Test prosocial auditing flow
  - **Files**: `tests/swarm/transmission/test_integration.py` (create)
  - **Done when**: All integration tests pass
  - **Verify**: `pytest tests/swarm/transmission/test_integration.py -v`
  - **Commit**: `test(transmission): add integration tests for session flow`
  - _Requirements: AC-2.1 through AC-3.5_
  - _Design: Test Strategy - Integration Tests_

- [ ] 3.7 Create ProsocialAuditor tests
  - **Do**:
    1. Create `tests/swarm/transmission/test_prosocial.py`
    2. Test audit_text() returns ProsocialScore
    3. Test weighted category calculation
    4. Test is_prosancial() threshold (0.7)
    5. Test TOXIC category reduces score
    6. Test LM Studio unavailability fallback
    7. Test NEB event emission
  - **Files**: `tests/swarm/transmission/test_prosocial.py` (create)
  - **Done when**: All prosocial tests pass
  - **Verify**: `pytest tests/swarm/transmission/test_prosocial.py -v`
  - **Commit**: `test(transmission): add prosocial auditor tests`
  - _Requirements: AC-7.1 through AC-7.5_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.8 [VERIFY] Quality checkpoint: all tests pass
  - **Do**: Run full test suite for transmission module
  - **Verify**: `pytest tests/swarm/transmission/ -v --tb=short`
  - **Done when**: All tests pass, no failures
  - **Commit**: `chore(transmission): pass quality checkpoint` (if fixes needed)

---

## Phase 4: Quality Gates

Focus: Final verification, CI readiness.

- [ ] 4.1 Local quality check
  - **Do**: Run all quality checks locally
  - **Verify**:
    1. `python -m py_compile systems/swarm/transmission/*.py`
    2. `pytest tests/swarm/transmission/ -v`
    3. All existing tests: `pytest tests/swarm/ -v --tb=short`
  - **Done when**: All commands pass with no errors
  - **Commit**: `fix(transmission): address quality issues` (if fixes needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/transmission-protocol`
    3. Create PR using gh CLI: `gh pr create --title "feat(transmission): add P2P mentoring system" --body "Implements Transmission Protocol for Scribe/Sprout mentoring sessions"`
  - **Verify**: `gh pr checks --watch`
  - **Done when**: All CI checks green, PR ready for review
  - **Commit**: None

---

## Phase 5: PR Lifecycle

Focus: Continuous PR validation until merge.

- [ ] 5.1 Monitor CI and address failures
  - **Do**: Check CI status, fix any issues found
  - **Verify**: `gh pr checks`
  - **Done when**: All checks pass
  - **Commit**: `fix(transmission): resolve CI failures` (if needed)

- [ ] 5.2 Address code review comments
  - **Do**: Respond to review feedback, make requested changes
  - **Verify**: Review comments resolved
  - **Done when**: All review comments addressed
  - **Commit**: `refactor(transmission): address review feedback` (if needed)

- [ ] 5.3 Final validation: zero regressions
  - **Do**:
    1. Run full swarm test suite: `pytest tests/swarm/ -v`
    2. Verify no test regressions
    3. Verify new tests cover requirements
  - **Verify**: `pytest tests/swarm/ --tb=short | tail -5`
  - **Done when**: Zero regressions, all tests pass
  - **Commit**: None

---

## Unresolved Questions

1. **MechanicalRefusal Conditions**: Design assumes configurable gate function - implement as simple callback that can be customized
2. **Sephirotic Node Intensity Source**: Assume game API provides 0.0-1.0 values, add TODO for integration
3. **Prosocial Scoring Frequency**: Per-message for MVP (real-time feedback)
4. **Blockchain Settlement**: P2 deferred - create placeholder ProofOfPlayLogger

## Notes

**POC Shortcuts:**
- HapticPattern is placeholder only
- ProofOfPlayLogger not implemented in POC (P2)
- ScribeReputationToken not implemented (P2)
- VPSColocalizer is simple Haversine check (no 6DOF)
- SharedARSpace not implemented (mobile client responsibility)

**Production TODOs:**
- Implement ProofOfPlayLogger with web3.py for Arbitrum Orbit
- Implement ScribeReputationToken ERC-721 contract
- Add real-time WebSocket updates for AR HUD
- Add voice moderation (ToxMod integration)
- Add MechanicalRefusal game state checks

# Change: manual-active_construction_phase

## Problem Statement
Manual implementation of roadmap phase: *Status**: Core Implementation Complete (2026-01-28) *Implementation**: 220 lines of Python (within 200-300 target) *Files**: `analysis_agent.py` (+120 lines), `workflows.py` (310 lines), `test_phase35.py` (190 lines) *Documentation**: `PHASE_35_IMPLEMENTATION_PLAN.md`, `PHASE_35_INITIAL_IMPLEMENTATION.md` *Success Criteria**: Agent can execute multi-step shell workflows without human intervention *Status**: Architecture Planning (2026-01-29) *Expected Complexity**: 350 lines of Python + Rust *Success Criteria**: Visual Cortex Code Complete & Logic Verified *Expected Complexity**: 500-600 lines of Python *Success Criteria**: Agent exhibits computational intuition, adapting to novel scenarios --

## Proposed Solution
Direct implementation of roadmap requirements for Active Construction Phase

## Impact Assessment
- **Scope**: Medium complexity
- **Risk**: Medium (automated implementation)
- **Dependencies**: None

## Success Criteria
- **Goal**: Active Construction Phase

**Description**: *Status**: Core Implementation Complete (2026-01-28) *Implementation**: 220 lines of Python (within 200-300 target) *Files**: `analysis_agent.py` (+120 lines), `workflows.py` (310 lines), `test_phase35.py` (190 lines) *Documentation**: `PHASE_35_IMPLEMENTATION_PLAN.md`, `PHASE_35_INITIAL_IMPLEMENTATION.md` *Success Criteria**: Agent can execute multi-step shell workflows without human intervention *Status**: Architecture Planning (2026-01-29) *Expected Complexity**: 350 lines of Python + Rust *Success Criteria**: Visual Cortex Code Complete & Logic Verified *Expected Complexity**: 500-600 lines of Python *Success Criteria**: Agent exhibits computational intuition, adapting to novel scenarios --

**Key Deliverables**:
- *Objective**: Extend the AutoPilot to handle complex, multi-stage workflows beyond simple login sequences. Enable the agent to execute shell commands, monitor output, and chain operations.
- *Objective**: Replace memory scanning with pixel-level Optical Character Recognition, enabling the agent to "read" any text displayed on screen regardless of source (VM, browser, native app).
- *Objective**: Enable the agent to understand *where* to look before reading. Implement visual attention mechanisms, saliency detection, and object recognition to guide the OCR engine.
- *Objective**: Move beyond hardcoded FSM to learned behaviors. Train the agent to discover optimal interaction patterns through trial and error.
- **Task 1: Extended State Machine** ✅
- Add workflow states: `OPENING_TERMINAL`, `EXECUTING_COMMAND`, `WAITING_FOR_OUTPUT`, `PARSING_RESULT`
- Implement command queue system for sequential operations
- Add state persistence for long-running workflows
- **Task 2: Output Monitoring** ✅
- Implement terminal output parsing via memory scanner
- Create pattern matching for command completion detection
- Add timeout handling for long-running commands
- **Task 3: Workflow Templates** ✅
- Create reusable workflow definitions (e.g., "install package", "run tests")
- Implement workflow composition (chain multiple templates)
- Add error recovery strategies per workflow type
- **Task 4: Verification** 🚧
- Goal: Autonomously install a package in Alpine VM
- Sequence: Login → Open Shell → Type Command → Wait for Prompt → Verify Installation
- **Task 1: Framebuffer Capture** ✅
- Add `/api/framebuffer` endpoint to compositor
- Implement region-of-interest (ROI) capture for efficiency
- Add caching to avoid redundant captures
- **Task 2: OCR Engine Integration** ✅
- Integrate Tesseract/VisualPerception
- Implement spatial text map: `{text: str, x: int, y: int, confidence: float}`
- Add text-based POI search: "Find text 'login:' on screen"
- **Task 3: Spatial Text Mapping** ✅
- Correlate OCR results with POI coordinates
- Build text-to-action mapping logic (in `VisualPerception`)
- Implement text change detection for state monitoring
- **Task 4: Verification** ✅
- Mock-based Verification (Logic Verified)
- Live Integration (Blocked by env dependencies)
- Benchmark: OCR latency < 500ms for typical screen regions
- **Task 1: Saliency Map Generation** ✅
- Implement color/contrast-based saliency detection (DoG/NumPy)
- Create "Attention Heatmap" logic (in `SaliencyEngine`)
- **Task 2: Visual Attention Mechanism** ✅
- Implement "Inhibition of Return" (don't stare at the same spot)
- Logic for "Saccade Generation" based on saliency
- **Task 3: Object Recognition (Heuristic)** ✅
- Detect UI elements: Buttons, Input Fields, Windows
- Classify regions: "Text Heavy", "Image", "Whitespace"
- **Task 4: Integration** ✅
- Connect Attention System to `AnalysisAgent`
- Use saliency to prioritize OCR regions (Optimization)
- **Task 1: Q-Learning Architecture** ✅
- Implement Deep Q-Network (PyTorch)
- Implement DQNAgent with Epsilon-Greedy Policy
- **Task 2: Reward System Design** ✅
- Implement `RewardCalculator` (+100 goal, -1 step, etc.)
- Define multi-modal reward signals
- **Task 3: Experience Replay** ✅
- Implement `ReplayBuffer` with random sampling
- Optimize state storage
- **Task 4: Integration** ✅
- Implement `RLController` linking Perception and Action
- Training loop integration (`train_step`)
- **Task 3: Learned Behaviors**
- Learn optimal click locations (minimize retries)
- Discover new interaction patterns (e.g., keyboard shortcuts)
- Adapt to different VM configurations automatically
- **Task 4: Verification**
- Benchmark: Learned policy outperforms hardcoded FSM by 20%
- Test on unseen VM configurations
- Validate generalization to new task types

---
*Generated automatically from roadmap decomposition*
*Change ID: manual-active_construction_phase*
*Complexity: Medium*

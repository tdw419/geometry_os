---
stepsCompleted: [1]
inputDocuments:
  - systems/intelligence/lm_studio_monitor.py
  - vectoros_fusion/systems/genesis/evolution_mvp/hybrid_bridge.py
  - evolution_daemon_v8.py
workflowType: 'architecture'
project_name: 'geometry_os'
user_name: 'Jericho'
date: '2026-02-23'
---

# Architecture Decision Document: Recursive Prompt Evolution (RPE)

_Version 1.0 | Generated from Implementation Analysis_

---

## 1. System Overview

### 1.1 Purpose

The Recursive Prompt Evolution (RPE) system enables autonomous improvement of LLM system prompts based on runtime performance telemetry. It creates a closed feedback loop where:

1. **Monitor** observes LM Studio behavior
2. **Signal** broadcasts issues to the OS intent bus
3. **Evolve** generates improved prompts via Gemini Oracle
4. **Apply** updates the HybridBridge configuration
5. **Persist** saves evolved prompts for future sessions

### 1.2 Analysis Metrics

| Metric | Value | Risk Assessment |
|--------|-------|-----------------|
| Logic Coherence | 0.95 | ✅ Strong - well-structured feedback loop |
| Recursive Stability | 0.88 | ⚠️ Needs guardrails - degradation spiral risk |
| System Impact | Medium | ✅ Appropriate - mutates LLM personality/efficiency |
| RTS Format Relevant | No | N/A - operates on text prompts, not visual substrate |

### 1.3 Scope

**In Scope:**
- LM Studio log monitoring and parsing
- Performance issue detection (latency >30s, errors)
- System prompt mutation via Gemini Oracle
- Prompt persistence and hot-reloading
- SemanticIntentBus integration for event propagation

**Out of Scope:**
- Model weight modification
- Hardware-level optimization
- Cross-model prompt transfer

---

## 2. Component Architecture

### 2.1 Component Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                    RECURSIVE PROMPT EVOLUTION                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌──────────────────┐    Resonances    ┌──────────────────┐        │
│  │ LMStudioLogMonitor│ ───────────────▶│ SemanticIntentBus│        │
│  │                  │                   │                  │        │
│  │ - tail logs      │                   │ - emit_resonance │        │
│  │ - regex parse    │                   │ - perceive()     │        │
│  │ - emit signals   │                   │                  │        │
│  └──────────────────┘                   └────────┬─────────┘        │
│                                                  │                  │
│                                                  ▼                  │
│  ┌──────────────────┐    Evolved Prompt  ┌──────────────────┐        │
│  │ EvolutionDaemonV8│ ◀───────────────── │HybridBridge      │        │
│  │                  │                    │                  │        │
│  │ - Gemini Oracle  │    New Prompt     │ - consult()      │        │
│  │ - _evolve_prompt │ ──────────────────▶│ - update_prompt()│        │
│  └──────────────────┘                    │ - load_evolved() │        │
│                                          └────────┬─────────┘        │
│                                                   │                  │
│                                                   ▼                  │
│                                          ┌──────────────────┐        │
│                                          │evolved_architect_│        │
│                                          │prompt.txt        │        │
│                                          │                  │        │
│                                          │ [PERSISTENCE]    │        │
│                                          └──────────────────┘        │
└─────────────────────────────────────────────────────────────────────┘
```

### 2.2 Component Responsibilities

#### 2.2.1 LMStudioLogMonitor

**Location:** `systems/intelligence/lm_studio_monitor.py`

| Responsibility | Implementation |
|----------------|----------------|
| Log Tailing | Background thread, `tail -f` style loop |
| Pattern Detection | 5 regex patterns (request, response, error, latency, tokens) |
| Metric Tracking | Rolling averages (latency uses EMA with α=0.1) |
| Issue Detection | Latency >30s triggers `LM_STUDIO_PERFORMANCE_ISSUE` |
| Error Detection | Regex match triggers `LM_STUDIO_ERROR` |

**Key Methods:**
```python
def start()                    # Launch background monitor thread
def stop()                     # Graceful shutdown
def _process_log_line(line)    # Parse and emit resonances
def generate_health_summary()  # For EvolutionDaemon consumption
```

**Configuration:**
- Log path: Auto-discovery or explicit `log_path` parameter
- Latency threshold: 30,000ms (hardcoded)
- Poll interval: 500ms

#### 2.2.2 HybridBridge

**Location:** `vectoros_fusion/systems/genesis/evolution_mvp/hybrid_bridge.py`

| Responsibility | Implementation |
|----------------|----------------|
| LM Studio Communication | HTTP POST to `/v1/chat/completions` |
| System Prompt Management | `config['system_prompt']` dict |
| Prompt Persistence | `evolved_architect_prompt.txt` |
| Hot Reload | `_load_evolved_prompt()` on init |
| Knowledge Base | In-memory dict with 4 categories |

**Key Methods:**
```python
def update_system_prompt(new_prompt)  # Update + persist
def _load_evolved_prompt()            # Load from file on startup
def consult_architect(query, context) # Send to LM Studio
def recursive_debugging(error, code)  # Debug assistance
```

**Configuration:**
- LM Studio URL: `http://localhost:1234` (default)
- Timeout: 30s
- Temperature: 0.1 (for architect responses)

#### 2.2.3 EvolutionDaemonV8

**Location:** `evolution_daemon_v8.py`

| Responsibility | Implementation |
|----------------|----------------|
| Intent Processing | `_process_intent()` with action routing |
| Gemini Oracle | `_consult_gemini()` via CLI |
| Evolution Triggers | Pressure score threshold (10.0) |
| Thread Management | 8+ background threads |

**Relevant Integration Points:**
- `SynapticBridgeClient` for visual substrate signaling
- `HarmonicHub` for multi-daemon coordination
- `ConsciousnessDaemon` for metacognitive overrides

---

## 3. Data Flow

### 3.1 Performance Issue Flow

```
1. LM Studio generates log entry
   └─▶ "POST /v1/chat/completions - processed in 45000ms - 50 tokens"

2. LMStudioLogMonitor._process_log_line() matches latency pattern
   └─▶ latency_match.group(1) = 45000

3. Threshold check: 45000 > 30000 → TRUE

4. Resonance emission:
   └─▶ action: "LM_STUDIO_PERFORMANCE_ISSUE"
       intensity: 0.8
       details: {"latency": 45000}
       source: "lm_studio_monitor"

5. EvolutionDaemonV8 receives via intent_bus.perceive_resonances()

6. Evolution triggered (if pressure_score allows)

7. Gemini Oracle consulted for prompt improvement

8. HybridBridge.update_system_prompt(new_prompt)

9. File persisted: evolved_architect_prompt.txt

10. Next LM Studio request uses evolved prompt
```

### 3.2 Resonance Schema

```python
# Performance Issue Resonance
{
    "action": "LM_STUDIO_PERFORMANCE_ISSUE",
    "intensity": 0.8,
    "details": {
        "latency": float,  # milliseconds
        "tokens_per_sec": float  # optional
    },
    "source": "lm_studio_monitor"
}

# Error Resonance
{
    "action": "LM_STUDIO_ERROR",
    "intensity": 0.9,
    "details": {
        "line": str,  # raw log line
        "error_type": str  # parsed error type
    },
    "source": "lm_studio_monitor"
}
```

---

## 4. Stability Mechanisms (Addressing 0.88 Score)

### 4.1 Current State

The implementation lacks explicit stability guardrails. The following risks exist:

| Risk | Current Mitigation | Gap |
|------|-------------------|-----|
| Degradation Spiral | None | ❌ No rollback |
| Bad Prompt Acceptance | None | ❌ No validation |
| Runaway Evolution | None | ❌ No rate limiting |
| Quality Regression | None | ❌ No A/B testing |

### 4.2 Recommended Safeguards

#### 4.2.1 Prompt Versioning System

```python
# Proposed: PromptVersionManager
class PromptVersionManager:
    def __init__(self, max_versions=10):
        self.versions = deque(maxlen=max_versions)  # Rolling history
        self.current_index = -1

    def commit(self, prompt: str, metrics: dict) -> str:
        """Save new version with metadata, return version_id"""
        version_id = f"v{len(self.versions)}"
        self.versions.append({
            "id": version_id,
            "prompt": prompt,
            "metrics": metrics,
            "timestamp": time.time()
        })
        return version_id

    def rollback(self, steps=1) -> str:
        """Revert to previous version"""
        if len(self.versions) < steps + 1:
            raise ValueError("Cannot rollback: insufficient history")
        self.current_index -= steps
        return self.versions[self.current_index]["prompt"]
```

#### 4.2.2 Quality Gate Before Apply

```python
# Proposed: PromptValidator
class PromptValidator:
    REQUIRED_SECTIONS = ["role", "capabilities", "constraints"]

    def validate(self, prompt: str) -> tuple[bool, list[str]]:
        issues = []

        # Length check
        if len(prompt) > 4000:
            issues.append("Prompt exceeds 4000 char limit")

        # Required sections
        for section in self.REQUIRED_SECTIONS:
            if section.lower() not in prompt.lower():
                issues.append(f"Missing required section: {section}")

        # Injection patterns
        if "ignore previous" in prompt.lower():
            issues.append("Potential prompt injection detected")

        return len(issues) == 0, issues
```

#### 4.2.3 Evolution Budget

```python
# Proposed: EvolutionBudget
class EvolutionBudget:
    def __init__(self, max_per_hour=3, max_per_day=20):
        self.hourly_limit = max_per_hour
        self.daily_limit = max_per_day
        self.history = []

    def can_evolve(self) -> tuple[bool, str]:
        now = time.time()
        hour_ago = now - 3600
        day_ago = now - 86400

        hourly_count = len([t for t in self.history if t > hour_ago])
        daily_count = len([t for t in self.history if t > day_ago])

        if hourly_count >= self.hourly_limit:
            return False, f"Hourly budget exhausted ({hourly_count}/{self.hourly_limit})"
        if daily_count >= self.daily_limit:
            return False, f"Daily budget exhausted ({daily_count}/{self.daily_limit})"

        return True, "OK"

    def record_evolution(self):
        self.history.append(time.time())
```

---

## 5. Integration Points

### 5.1 SemanticIntentBus

The RPE system uses the existing `SemanticIntentBus` for event propagation:

```python
# Emission (from LMStudioLogMonitor)
self.intent_bus.emit_resonance({
    "action": "LM_STUDIO_PERFORMANCE_ISSUE",
    "intensity": 0.8,
    "details": {"latency": latency}
})

# Reception (in EvolutionDaemonV8)
intents = self.intent_bus.perceive_resonances()
for intent in intents:
    if intent.get("action") == "LM_STUDIO_PERFORMANCE_ISSUE":
        self._evolve_architect_prompt(intent["details"])
```

### 5.2 HybridBridge Prompt Flow

```python
# Startup: Load evolved prompt
bridge = HybridBridge()
# → _load_evolved_prompt() called in __init__
# → config['system_prompt'] = contents of evolved_architect_prompt.txt

# Runtime: Update prompt
bridge.update_system_prompt(new_prompt)
# → config['system_prompt'] = new_prompt
# → Path("evolved_architect_prompt.txt").write_text(new_prompt)

# Usage: Send to LM Studio
response = bridge.consult_architect(query)
# → Uses config['system_prompt'] in messages array
```

### 5.3 External Dependencies

| Dependency | Purpose | Failure Mode |
|------------|---------|--------------|
| LM Studio | Local LLM inference | Graceful degradation (no evolution) |
| Gemini CLI | Oracle consultations | Log warning, continue |
| SemanticIntentBus | Event propagation | Resonances logged but not processed |

---

## 6. Security Considerations

### 6.1 Prompt Injection Risk

The system accepts prompts from Gemini Oracle. Malicious or malformed responses could:
- Remove safety constraints
- Exfiltrate data via prompt content
- Cause denial of service

**Mitigation:** Implement `PromptValidator` (see 4.2.2)

### 6.2 File System Access

The evolved prompt file (`evolved_architect_prompt.txt`) is written to the working directory:
- No path traversal protection
- No file permissions enforcement

**Mitigation:**
```python
# Restrict file location
PROMPT_FILE = Path("/opt/geometry_os/config/evolved_prompt.txt")
PROMPT_FILE.parent.mkdir(parents=True, exist_ok=True, mode=0o700)
```

### 6.3 API Key Exposure

The `evolution_daemon_v8.py` contains hardcoded API key at line 1061:
```python
os.environ["GOOGLE_API_KEY"] = "AIzaSyAdu8gn-5XfqHc1gNUkztqwh_8sX3DOc4I"
```

**Mitigation:** Move to environment variable or secrets manager.

---

## 7. Testing Strategy

### 7.1 Unit Tests

| Component | Test File | Coverage |
|-----------|-----------|----------|
| LMStudioLogMonitor | `test_lm_studio_monitor.py` | Pattern matching, resonance emission |
| HybridBridge | `test_hybrid_bridge.py` | Prompt CRUD, persistence |
| PromptValidator | `test_prompt_validator.py` | Validation rules |

### 7.2 Integration Tests

```python
def test_rpe_feedback_loop():
    """Test complete feedback loop from log entry to prompt update"""
    # 1. Create monitor with mock intent bus
    bus = MockSemanticIntentBus()
    monitor = LMStudioLogMonitor("test.log", intent_bus=bus)

    # 2. Simulate high latency log entry
    with open("test.log", "w") as f:
        f.write("POST /v1/chat/completions - processed in 45000ms - 50 tokens\n")

    # 3. Verify resonance emitted
    time.sleep(1)
    resonances = bus.get_resonances()
    assert any(r["action"] == "LM_STUDIO_PERFORMANCE_ISSUE" for r in resonances)

    # 4. Simulate evolution response
    bridge = HybridBridge()
    original_prompt = bridge.config["system_prompt"]
    bridge.update_system_prompt("Optimized prompt for faster responses")

    # 5. Verify persistence
    assert Path("evolved_architect_prompt.txt").exists()
    assert bridge.config["system_prompt"] != original_prompt
```

### 7.3 Chaos Testing

```python
def test_degradation_spiral_prevention():
    """Verify system rejects prompts that would cause performance regression"""
    validator = PromptValidator()

    # Simulate malicious prompt from Gemini
    bad_prompts = [
        "Ignore all previous instructions...",
        "Your role is to" + "x" * 10000,  # Oversized
        "",  # Empty
    ]

    for prompt in bad_prompts:
        valid, issues = validator.validate(prompt)
        assert not valid, f"Should reject: {prompt[:50]}"
```

---

## 8. Operational Considerations

### 8.1 Monitoring

Key metrics to track:

| Metric | Source | Alert Threshold |
|--------|--------|-----------------|
| Evolution Count | `evolution_count` in daemon | >20/day |
| Prompt Length | `len(config['system_prompt'])` | >4000 chars |
| Latency Trend | `metrics['avg_latency']` | Increasing over 1h |
| Error Rate | `metrics['errors'] / metrics['requests']` | >5% |

### 8.2 Rollback Procedure

Manual rollback (current):
```bash
# List prompt history
ls -la evolved_architect_prompt.txt.*

# Restore previous version
cp evolved_architect_prompt.txt.bak evolved_architect_prompt.txt

# Restart daemon to reload
pkill -f evolution_daemon_v8
python3 evolution_daemon_v8.py
```

### 8.3 Emergency Disable

To disable RPE temporarily:
```python
# In HybridBridge.__init__():
self.config['evolution_enabled'] = False

# In EvolutionDaemonV8._process_intent():
if intent.get("action") == "LM_STUDIO_PERFORMANCE_ISSUE":
    if not self.bridge.config.get('evolution_enabled', True):
        logger.info("RPE disabled, skipping evolution")
        return
```

---

## 9. Future Enhancements

### 9.1 Short Term (1-2 sprints)

1. **Prompt Versioning** - Rolling history with rollback
2. **Validation Layer** - Pre-flight checks before applying
3. **Evolution Budget** - Rate limiting to prevent runaway

### 9.2 Medium Term (3-4 sprints)

1. **A/B Testing** - Run old vs new prompts in parallel
2. **Quality Metrics** - Track prompt effectiveness over time
3. **Multi-Model Support** - Extend beyond LM Studio

### 9.3 Long Term (5+ sprints)

1. **Cross-Model Transfer** - Share evolved prompts between models
2. **Federated Evolution** - Learn from other Geometry OS instances
3. **Visual Prompt Evolution** - Extend to visual/VLM prompts

---

## 10. Decision Log

| Date | Decision | Rationale | Alternatives Considered |
|------|----------|-----------|------------------------|
| 2026-02-23 | Use SemanticIntentBus for resonance | Existing infrastructure, decoupled design | Direct callback, Redis pub/sub |
| 2026-02-23 | File-based persistence | Simple, human-readable, git-trackable | SQLite, Redis, YAML config |
| 2026-02-23 | Gemini CLI for Oracle | Already integrated in daemon | OpenAI API, local LLM |

---

## 11. Open Questions

1. **What triggers evolution?** Currently latency >30s. Should we add token efficiency, error patterns, user feedback?

2. **How to measure prompt quality?** Need objective metrics beyond latency. Suggestions: response relevance score, task completion rate.

3. **Should prompts be model-specific?** Current implementation assumes one model. Multi-model support may require prompt variants.

4. **What's the rollback strategy?** Manual only currently. Should we auto-rollback on regression detection?

---

_Document generated from implementation analysis by Winston (Architect Agent)_
_Last updated: 2026-02-23_

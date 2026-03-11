---
spec: llm-powered-expansion
phase: research
created: 2026-02-21T09:17:00Z
---

# Research: LLM-Powered WordPress Content Expansion

## Executive Summary
Replace template-based content expansion in `content_analyzer.py` with intelligent LLM-generated improvements via ZAI Bridge. Integration points are clean: ZAIBridge provides `chat()` method, ContentAnalyzer needs `llm_enabled` flag, and BridgeService already has safety configuration patterns. Plan reference at `docs/plans/2026-02-21-llm-powered-expansion.md` provides detailed TDD implementation.

## External Research

### Best Practices
- LLM content generation should use system prompts that constrain output format
- Fallback to template on API errors (resilience pattern)
- Confidence scoring should combine multiple heuristics (length, structure, relevance)
- Rate limiting essential for API cost control

### Prior Art
- GuardianGate already uses ZAIBridge for AI-powered review (`guardian_gate.py:188-241`)
- Async pattern established in `pixel-llm-async-api` spec (retry, batch, cache)
- Evolution Daemon V11+ safety pipeline provides validation framework

### Pitfalls to Avoid
- Don't block on LLM calls - use async with timeout
- Don't trust LLM output blindly - validate structure and content length
- Don't execute without backup - content modifications need rollback capability

## Codebase Analysis

### 1. ContentAnalyzer Current Implementation

**File**: `systems/evolution_daemon/wordpress/content_analyzer.py`

**Template-based expansion (lines 133-151)**:
```python
def _generate_expansion(self, post: Dict[str, Any]) -> str:
    """Generate expanded content."""
    content = post.get("content", "")
    title = post.get("title", "")

    # Simple expansion template
    expansion = f"""{content}

## Additional Context

This post about "{title}" covers important topics in the Geometry OS ecosystem.
Further exploration of these concepts can enhance understanding of the system.

### Key Points
- The concepts discussed relate to spatial computing
- Integration with the infinite map provides unique perspectives
- Evolution and self-improvement are core principles
"""
    return expansion.strip()
```

**Enhancement template (lines 153-167)**:
```python
def _generate_enhancement(self, post: Dict[str, Any]) -> str:
    """Generate enhanced content with better structure."""
    content = post.get("content", "")
    title = post.get("title", "")

    enhanced = f"""# {title}

{content}

---

*This content is part of the Geometry OS knowledge base.*
"""
    return enhanced.strip()
```

**Confidence calculation (lines 169-178)**:
```python
def _calculate_confidence(self, analysis: ContentAnalysis) -> float:
    """Calculate confidence score for a proposal."""
    issue_weight = len(analysis.issues) * 0.2
    if not analysis.issues:
        return 0.1
    return min(0.95, 0.5 + issue_weight)
```

**Integration Point**: Add `llm_enabled` flag to `__init__`, inject LLMExpansionService.

### 2. ZAI Bridge Integration

**File**: `zai_bridge.py`

**Core chat method (lines 259-398)**:
```python
async def chat(
    self,
    agent_name: str,
    message: str,
    system_prompt: Optional[str] = None,
    model: Optional[str] = None,
    tools: Optional[List[Dict]] = None,
    stream: bool = False,
    stream_callback: Optional[Callable[[str], None]] = None,
) -> str:
```

**Available Agent Personas (lines 148-201)**:
| Persona | Role | Model | Use Case |
|---------|------|-------|----------|
| architect | System Designer | glm-4-plus | Design, planning |
| coder | Implementation Specialist | glm-4-plus | Code, content gen |
| oracle | Analyst & Seer | glm-4-plus | Analysis, insights |
| guardian | Security & Validation | glm-4-plus | Review, validation |

**Recommendation**: Use "coder" persona for content generation.

**Retry Decorator (lines 63-100)**:
```python
@with_retry(max_retries=3)
async def chat(...):
```

**Mock Mode (lines 447-455)**:
- Returns mock responses when `zhipuai` SDK unavailable or no API key
- Essential for testing without API access

**Integration Pattern**:
```python
from zai_bridge import ZAIBridge

bridge = ZAIBridge(api_key=os.environ.get("ZAI_API_KEY"))
response = await bridge.chat("coder", prompt, model="glm-4-plus")
```

### 3. Bridge Service Configuration

**File**: `.worktrees/parallel-agents/systems/evolution_daemon/wordpress/bridge_service.py`

**Config dataclass (lines 27-33)**:
```python
@dataclass
class BridgeServiceConfig:
    wp_url: str = "http://localhost:8080"
    ws_uri: str = "ws://localhost:8768"
    cycle_interval: int = 60
    auto_execute: bool = False  # Safety: require manual approval by default
    min_confidence: float = 0.5
```

**Service execution flow (lines 155-161)**:
```python
if self.config.auto_execute and qualified_proposals:
    for proposal in qualified_proposals:
        exec_result = await self._execute_proposal(proposal)
        if exec_result.success:
            executed_count += 1
```

**Integration Point**: Add `llm_enabled: bool = False` and `safety_config: Optional[SafetyConfig]` to config.

### 4. Safety Patterns

**GuardianGate patterns (lines 30-48)**:
```python
REJECTION_PATTERNS = [
    "exec(", "eval(", "__import__(", "subprocess.call(",
    "os.system(", "pickle.loads(", "yaml.load(",
]

ESCALATION_PATTERNS = [
    "delete_all", "drop_table", "truncate", "shutdown", "format_drive",
]
```

**AI Review Integration (lines 188-241)**:
```python
async def _ai_review(self, proposal: EvolutionProposal) -> Optional[dict]:
    prompt = f"""
    Review this code change proposal...
    Respond in JSON format:
    {{
        "approved": true/false,
        "risk_level": "low"|"medium"|"high",
        "issues": ["issue1", "issue2"],
        "recommendations": ["rec1", "rec2"]
    }}
    """
    response = await self.zai_bridge.chat("guardian", prompt)
    return json.loads(json_str)
```

**Safety Pipeline**: V11+ uses `SandboxManager` → `GuardianGate` → `TierRouter` → `GitIntegration` → `PostCommitMonitor`.

### 5. Existing Tests

**File**: `tests/test_wordpress_content_analyzer.py`

**Test patterns**:
```python
def test_analyze_post_returns_content_analysis():
    analyzer = WordPressContentAnalyzer()
    post = {"id": 1, "title": "Test Post", "content": "...", "status": "publish"}
    result = analyzer.analyze(post)
    assert isinstance(result, ContentAnalysis)
    assert result.word_count == 6
    assert 0.0 <= result.readability_score <= 1.0

def test_propose_improvement_returns_actionable_proposal():
    analyzer = WordPressContentAnalyzer()
    proposal = analyzer.propose_improvement(weak_post)
    assert proposal.improvement_type in ["expand", "enhance", "correct"]
    assert 0.0 <= proposal.confidence <= 1.0
```

**Extension needed**: Add tests for LLM mode, fallback behavior, and quality metrics.

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | ZAIBridge ready, async patterns established |
| Effort Estimate | M | ~7 tasks per plan, TDD approach |
| Risk Level | Low | Feature flag allows safe rollback |

## Dependencies

| Dependency | Status | Notes |
|------------|--------|-------|
| zhipuai SDK | Optional | Falls back to mock mode |
| ZAI_API_KEY env var | Required | For LLM mode |
| asyncio | Available | Python 3.12 |
| pytest | Available | Test framework |

## Quality Commands

| Type | Command | Source |
|------|---------|--------|
| Unit Tests | `pytest tests/test_wordpress_content_analyzer.py -v` | pytest |
| All Tests | `pytest tests/test_*wordpress* tests/test_*llm* -v` | pytest |
| Lint | `make lint` | Makefile |
| Format | `make format` | Makefile |

**Local CI**: `pytest tests/ -v && make lint`

## Related Specs

| Spec | Relevance | May Need Update |
|------|-----------|-----------------|
| evolution-daemon-wordpress-gui | High - same codebase | No |
| pixel-llm-async-api | Medium - async patterns | No |
| wordpress-git-coordination | Medium - execution flow | No |

## Risks and Mitigations

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| LLM API rate limits | Medium | Medium | Implement retry + fallback |
| Poor LLM output quality | Low | Medium | Confidence scoring + validation |
| Cost overrun | Low | Low | Rate limiting, min_confidence |
| Breaking existing behavior | Low | High | Feature flag default OFF |

## Recommendations for Requirements

1. **Feature Flag Default OFF**: `llm_enabled=False` by default, opt-in via CLI `--llm`
2. **Fallback Pattern**: On any LLM error, fall back to template expansion with lower confidence (0.3)
3. **Safety Integration**: Use existing SafetyConfig pattern for backup before modification
4. **Async Implementation**: Use `asyncio.run()` for sync interface, maintain async internally
5. **Confidence Adjustment**: LLM expansion should get higher base confidence (0.6) than template (0.3)
6. **Content Validation**: Check length ratio, structure markers (##, - ), relevance keywords

## Open Questions

1. **Temperature setting**: What temperature for content expansion? (Plan suggests 0.7)
2. **Max tokens**: What's the appropriate max_tokens for expansion? (Plan suggests 1024)
3. **Backup retention**: How long to keep content backups? (Plan defaults to /tmp)

## Sources

- `systems/evolution_daemon/wordpress/content_analyzer.py` - Template implementation
- `zai_bridge.py` - ZAI Bridge API
- `.worktrees/parallel-agents/systems/evolution_daemon/wordpress/bridge_service.py` - Service config
- `systems/evolution_daemon/safety/guardian_gate.py` - AI review pattern
- `tests/test_wordpress_content_analyzer.py` - Test patterns
- `docs/plans/2026-02-21-llm-powered-expansion.md` - Implementation plan
- `specs/pixel-llm-async-api/design.md` - Async patterns

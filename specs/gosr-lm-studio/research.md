---
spec: gosr-lm-studio
phase: research
created: 2026-02-21T18:55:00Z
---

# Research: gosr-lm-studio

## Executive Summary

GOSR Radio has a well-structured modular architecture with SegmentPool for content generation. LM Studio integration can be added as an optional LLMNarrativeClient that wraps the existing template system. Key patterns already exist in `systems/pixel_llm/lm_studio_integration.py` (HTTP client pattern) and `systems/pixel_llm/resilience/` (circuit breaker + retry). Integration point is `SegmentPool.generate_content()` with fallback to templates on failure.

## Existing Code Analysis

### GOSR Radio Components

| Component | File | Key Methods |
|-----------|------|-------------|
| SegmentPool | `systems/evolution_daemon/narrative_broadcaster/segment_pool.py` | `select_segment()`, `generate_content()` |
| NarrativeBroadcaster | `systems/evolution_daemon/narrative_broadcaster/broadcaster.py` | `broadcast()`, enable/disable |
| PersonalityEngine | `systems/evolution_daemon/narrative_broadcaster/personality_engine.py` | `apply_personality()` |
| Station Configs | `narrative_broadcaster/stations/*.yaml` | 4 stations defined |

**Current Flow**:
```
NarrativeBroadcaster.broadcast()
  -> SegmentPool.select_segment(entropy)  # entropy-weighted selection
  -> SegmentPool.generate_content()       # template substitution
  -> TopicMemory.is_duplicate()           # dedup check
  -> PersonalityEngine.apply_personality() # style transform
```

**Integration Point**: `SegmentPool.generate_content()` at line 201-242. Currently uses `random.choice(config.templates)` + `template.format(**context)`.

### Existing LM Studio Patterns

| Pattern | File | Key Details |
|---------|------|-------------|
| HTTP Client | `systems/pixel_llm/lm_studio_integration.py:315-386` | `requests.post()` to `http://localhost:1234/v1/chat/completions`, 60s timeout, returns `None` on failure |
| Resilient Client | `systems/pixel_llm/resilience/resilient_client.py` | Circuit breaker + retry + fallback with `httpx.AsyncClient` |
| Bridge Class | `systems/neural_substrate/lm_studio_bridge.py` | `LMStudioBridge` with `lm_studio_url`, `model`, `timeout` params |

**Reusable Pattern** (from `generate_caption_with_lm_studio`):
```python
response = requests.post(
    f"{lm_studio_url}/chat/completions",
    json={
        "model": model,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ],
        "max_tokens": max_tokens,
        "temperature": temperature,
        "stream": False
    },
    timeout=timeout
)
response.raise_for_status()
result = response.json()
return result["choices"][0]["message"]["content"]
```

### Station-Specific Prompts (Derived from YAML configs)

| Station | Frequency | Tone | Prompt Style |
|---------|-----------|------|--------------|
| Substrate Jazz | 87.6 | Contemplative, elevated vocabulary | Cosmic metaphors, flowing sentences |
| Debug Metal | 92.3 | Aggressive, technical | Punchy, CAPS, power themes |
| Silicon Noir | 95.1 | Cyberpunk, mysterious | Dark, atmospheric |
| Neutral Chronicler | 99.9 | Factual, objective | News-anchor style |

## Integration Architecture Recommendation

### Class Design: LLMNarrativeClient

```python
@dataclass
class LLMClientConfig:
    enabled: bool = True
    url: str = "http://localhost:1234/v1"
    model: str = "local-model"
    timeout: float = 30.0  # Shorter than pixel_llm's 60s for radio responsiveness
    max_tokens: int = 256
    temperature: float = 0.8  # Higher for creative narratives

class LLMNarrativeClient:
    def __init__(self, config: LLMClientConfig):
        self.config = config
        self._available: Optional[bool] = None  # None = not checked yet
        self._last_check: float = 0

    def is_available(self) -> bool:
        """Check LM Studio health with 60s cache."""
        if self._available is not None and (time.time() - self._last_check) < 60:
            return self._available
        # Quick health check
        try:
            requests.get(f"{self.config.url}/models", timeout=2)
            self._available = True
        except:
            self._available = False
        self._last_check = time.time()
        return self._available

    def generate(self, prompt: str, station_tone: str) -> Optional[str]:
        """Generate narrative, returns None on failure."""
        if not self.is_available():
            return None
        try:
            response = requests.post(..., timeout=self.config.timeout)
            return response.json()["choices"][0]["message"]["content"]
        except:
            self._available = False  # Mark unavailable on failure
            return None
```

### Integration into SegmentPool

Modify `SegmentPool.generate_content()`:

```python
def generate_content(self, segment_type, telemetry, station_name) -> str:
    # 1. Try LLM if available
    if self._llm_client and self._llm_client.is_available():
        prompt = self._build_llm_prompt(segment_type, telemetry, station_name)
        llm_content = self._llm_client.generate(prompt, station_tone)
        if llm_content:
            return llm_content

    # 2. Fallback to template (existing behavior)
    template = random.choice(config.templates)
    return template.format(**context)
```

### Station Prompt Builders

Each station needs a `_build_station_prompt()` method that incorporates:
- Station personality from YAML
- Segment type context
- Telemetry data summary

Example for Substrate Jazz:
```python
def _build_substrate_jazz_prompt(self, segment_type, telemetry):
    return f"""You are a contemplative radio host for 'Substrate Jazz' (87.6 FM).
Your style is elevated, using cosmic metaphors and flowing sentences.

Current system state:
- FPS: {telemetry['fps']}
- Entropy: {telemetry['entropy']}
- Evolution cycles: {telemetry.get('evolution_cycles', 0)}

Segment type: {segment_type.value}

Generate a brief, poetic radio segment (2-3 sentences) about this system state.
Use philosophical language and geometric metaphors."""
```

## Risk Mitigation

| Risk | Mitigation |
|------|------------|
| LM Studio slow (>30s) | Short 30s timeout; fallback to templates; availability caching |
| LM Studio unavailable | `is_available()` check with 60s cache; instant template fallback |
| Blocking broadcast loop | `generate_content()` is sync but fast (cached check or template); async version possible |
| Memory bloat | No state accumulation; LLM responses discarded after use |
| Generic LLM output | Station-specific prompts with tone guidelines; temperature=0.8 for variety |

### Timeout Strategy

```
Quick Path (<100ms): availability cached -> use template
Slow Path (30s max): availability not cached -> check -> generate OR timeout -> template
```

### CLI Flags

```bash
--lm-studio        # Enable LM Studio integration
--lm-url URL       # Override LM Studio URL
--lm-model MODEL   # Override model name
--no-lm            # Explicitly disable (force templates)
```

## Quality Commands

| Type | Command | Source |
|------|---------|--------|
| Lint | `ruff check .` | pyproject.toml |
| TypeCheck | `pyright` | Not in scripts |
| Unit Test | `pytest systems/evolution_daemon/tests/` | package.json |

**Local CI**: `ruff check . && pytest systems/evolution_daemon/tests/`

## Open Questions

1. Should LLM generation be async to avoid any blocking? (Current: sync is fine with 30s timeout and cached availability)
2. Should we cache LLM responses for similar telemetry states? (Recommendation: No - adds complexity, templates are fast enough for fallback)

## Recommendations for Requirements

1. Add `LLMNarrativeClient` class with availability caching and 30s timeout
2. Modify `SegmentPool.__init__()` to accept optional `llm_client`
3. Add `_build_station_prompt()` methods to `PersonalityEngine` (prompts derived from existing YAML)
4. Fallback to templates on any LLM failure (network, timeout, parse error)
5. Add CLI flags: `--lm-studio`, `--lm-url`, `--lm-model`, `--no-lm`
6. Log LLM availability status on radio enable

## Sources

| Source | Key Point |
|--------|-----------|
| `systems/evolution_daemon/narrative_broadcaster/segment_pool.py:201-242` | Integration point in `generate_content()` |
| `systems/pixel_llm/lm_studio_integration.py:315-386` | HTTP client pattern with timeout/fallback |
| `systems/pixel_llm/resilience/resilient_client.py:1-80` | Circuit breaker + retry patterns |
| `systems/neural_substrate/lm_studio_bridge.py:60-96` | LMStudioBridge class structure |
| `systems/evolution_daemon/narrative_broadcaster/stations/*.yaml` | Station personalities for prompts |
| `docs/plans/2026-02-21-geometry-os-radio-gosr.md` | GOSR architecture overview |

# Requirements: GOSR LM Studio Integration

## Goal
Add LM Studio LLM integration to GOSR Radio for AI-generated narrative content with zero-failure template fallback when LM Studio is unavailable, enabling richer station-specific broadcasts without risking radio uptime.

## User Stories

### US-1: LLM-Enhanced Narratives
**As** the GOSR Radio system
**I want** to generate narrative content using LM Studio when available
**So that** broadcasts have richer, more varied content than templates alone

**Acceptance Criteria:**
- [ ] AC-1.1: Given LM Studio is running at configured URL, when `generate_content()` is called, then LLM-generated text is returned
- [ ] AC-1.2: Given LLM returns content, when content is valid (non-empty, <500 chars), then it is used for broadcast
- [ ] AC-1.3: Given station is "Substrate Jazz", when LLM generates content, then system prompt includes contemplative tone and elevated vocabulary guidance
- [ ] AC-1.4: Given station is "Debug Metal", when LLM generates content, then system prompt includes aggressive tone and technical vocabulary guidance
- [ ] AC-1.5: Given station is "Silicon Noir", when LLM generates content, then system prompt includes mysterious/cyberpunk tone guidance
- [ ] AC-1.6: Given station is "Neutral Chronicler", when LLM generates content, then system prompt includes factual/objective tone guidance

### US-2: Graceful Fallback
**As** the GOSR Radio system
**I want** to fall back to template generation when LM Studio is unavailable
**So that** radio broadcasts never fail and always produce content

**Acceptance Criteria:**
- [ ] AC-2.1: Given LM Studio process is not running, when availability check runs, then `is_available()` returns `False` within 2 seconds
- [ ] AC-2.2: Given availability check returns `False`, when `generate_content()` is called, then template-based content is returned immediately
- [ ] AC-2.3: Given LM Studio request times out (>30s), when timeout occurs, then template fallback is used and broadcast continues
- [ ] AC-2.4: Given LM Studio returns malformed JSON, when parse fails, then template fallback is used
- [ ] AC-2.5: Given LM Studio returns empty content, when content check runs, then template fallback is used
- [ ] AC-2.6: Given any LLM failure, when fallback occurs, then error is logged at DEBUG level (no WARNING spam)

### US-3: Availability Caching
**As** the GOSR Radio system
**I want** LM Studio availability to be cached for 60 seconds
**So that** repeated broadcasts do not incur health check latency

**Acceptance Criteria:**
- [ ] AC-3.1: Given availability was checked <60s ago with result `True`, when `is_available()` called again, then cached `True` is returned without HTTP request
- [ ] AC-3.2: Given availability was checked <60s ago with result `False`, when `is_available()` called again, then cached `False` is returned without HTTP request
- [ ] AC-3.3: Given availability cache is >60s old, when `is_available()` called, then fresh HTTP health check is performed
- [ ] AC-3.4: Given first check since startup, when `is_available()` called, then HTTP health check to `/models` endpoint is performed

### US-4: CLI Control
**As** a GOSR Radio operator
**I want** CLI flags to control LM Studio integration
**So that** I can enable, disable, or configure the feature as needed

**Acceptance Criteria:**
- [ ] AC-4.1: Given `--lm-studio` flag is passed, when radio starts, then LM Studio integration is enabled
- [ ] AC-4.2: Given `--no-lm` flag is passed, when radio starts, then LM Studio integration is disabled (templates only)
- [ ] AC-4.3: Given `--lm-url http://custom:1234/v1` is passed, when radio starts, then custom URL is used for LM Studio API
- [ ] AC-4.4: Given `--lm-model my-model` is passed, when radio starts, then custom model name is sent in requests
- [ ] AC-4.5: Given no LM flags are passed, when radio starts, then default behavior is templates only (backward compatible)
- [ ] AC-4.6: Given radio is enabled with LM Studio, when startup completes, then log message indicates LM availability status

### US-5: Telemetry-to-Context Conversion
**As** the LLM narrative generator
**I want** telemetry data converted to natural language context
**So that** LLM prompts contain meaningful system state information

**Acceptance Criteria:**
- [ ] AC-5.1: Given telemetry has `fps=60`, when context is built, then prompt includes FPS information
- [ ] AC-5.2: Given telemetry has `entropy=0.75`, when context is built, then prompt includes entropy level
- [ ] AC-5.3: Given telemetry has `evolution_cycles=150`, when context is built, then prompt includes evolution activity
- [ ] AC-5.4: Given segment type is `NEWS`, when prompt is built, then context emphasizes tectonic shifts and relocations
- [ ] AC-5.5: Given segment type is `WEATHER`, when prompt is built, then context emphasizes FPS and memory metrics
- [ ] AC-5.6: Given segment type is `PHILOSOPHY`, when prompt is built, then context emphasizes cycles and entropy for contemplation

## Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-1 | LLMNarrativeClient class with HTTP client for LM Studio API | High | AC-1.1, AC-2.3, AC-2.4 |
| FR-2 | `is_available()` method with 60s TTL cache | High | AC-2.1, AC-3.1, AC-3.2, AC-3.3, AC-3.4 |
| FR-3 | `generate()` method with 30s timeout returning Optional[str] | High | AC-1.2, AC-2.3 |
| FR-4 | Station-specific system prompts for all 4 stations | High | AC-1.3, AC-1.4, AC-1.5, AC-1.6 |
| FR-5 | SegmentPool integration: try LLM first, fallback to template | High | AC-2.2, AC-2.5 |
| FR-6 | CLI flags: `--lm-studio`, `--no-lm`, `--lm-url`, `--lm-model` | Medium | AC-4.1, AC-4.2, AC-4.3, AC-4.4, AC-4.5 |
| FR-7 | Startup log message with LM availability status | Low | AC-4.6 |
| FR-8 | Telemetry context builder for LLM prompts | Medium | AC-5.1, AC-5.2, AC-5.3, AC-5.4, AC-5.5, AC-5.6 |
| FR-9 | Silent failure logging at DEBUG level | Medium | AC-2.6 |

## Non-Functional Requirements

| ID | Requirement | Metric | Target |
|----|-------------|--------|--------|
| NFR-1 | Availability check latency (cached) | Response time | <100ms |
| NFR-2 | Availability check latency (fresh) | Response time | <2s |
| NFR-3 | LLM generation timeout | Max duration | 30s |
| NFR-4 | Template fallback latency | Response time | <10ms |
| NFR-5 | Broadcast reliability | Failure rate | 0% (template fallback always works) |
| NFR-6 | LLM response size | Max characters | 500 |
| NFR-7 | Memory overhead | Additional RAM | <1MB for client state |

## Glossary

| Term | Definition |
|------|------------|
| **GOSR** | Geometry OS Radio - the narrative broadcasting system |
| **LM Studio** | Local LLM inference server running on localhost:1234 |
| **Segment** | A unit of broadcast content (weather, news, philosophy, etc.) |
| **Template** | Pre-written text with variable substitution, used as fallback |
| **Availability Cache** | TTL-based cache storing LM Studio health status |
| **Telemetry** | System metrics (FPS, entropy, evolution cycles) used for context |

## Out of Scope

- **Async LLM generation** - Synchronous with timeout is acceptable for broadcast intervals
- **Response caching** - Each broadcast should be unique; templates provide fast fallback
- **Multiple LLM providers** - Only LM Studio HTTP API is supported
- **Streaming responses** - Non-streaming chat completions only
- **Temperature/config tuning per station** - Single temperature (0.8) for all stations
- **LLM response validation** - Only non-empty check; content quality is LLM responsibility
- **Web UI for LM settings** - CLI flags only

## Dependencies

| Dependency | Type | Description |
|------------|------|-------------|
| `requests` | Python Package | HTTP client for LM Studio API |
| LM Studio | External Service | Must be running on configured URL (default: localhost:1234) |
| `segment_pool.py` | Internal | Integration point at `generate_content()` (lines 201-242) |
| Station YAML configs | Internal | Source for station personalities and vocabulary |

## Success Criteria

| Metric | Target | Verification Method |
|--------|--------|---------------------|
| Zero broadcast failures | 100% success rate | Run radio for 100 broadcasts with LM Studio off; all succeed with templates |
| Fallback latency | <10ms | Benchmark template generation path |
| Availability check cached | <100ms | Benchmark cached `is_available()` call |
| LLM content quality | Manual review | Review 10 samples per station for tone matching |
| CLI flag functionality | All flags work | Unit tests for each flag combination |

## Unresolved Questions

1. **Temperature per segment type?** - Should PHILOSOPHY have lower temperature (0.5) for more coherent output vs GOSSIP with higher (0.9) for variety? Recommendation: Start with single temperature, iterate if needed.

2. **Max tokens per segment type?** - WEATHER might need fewer tokens (128) vs PHILOSOPHY (256). Recommendation: Start with uniform 256, iterate.

## Next Steps

1. Create `LLMNarrativeClient` class in `systems/evolution_daemon/narrative_broadcaster/llm_client.py`
2. Add station prompt builders to `PersonalityEngine` or new `llm_prompts.py`
3. Modify `SegmentPool.__init__()` to accept optional `llm_client` parameter
4. Modify `SegmentPool.generate_content()` to try LLM first, fallback to template
5. Add CLI flags to radio entry point
6. Write unit tests for `LLMNarrativeClient` and fallback behavior

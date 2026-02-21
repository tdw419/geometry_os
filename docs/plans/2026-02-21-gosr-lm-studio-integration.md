# GOSR Radio - LM Studio Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add LM Studio integration to GOSR Radio for richer, AI-generated narrative content with template fallback when LM Studio is unavailable.

**Architecture:** Hybrid approach - LLM generates narrative prose from telemetry when available, falls back to existing templates when disconnected. Uses existing `http://localhost:1234/v1/chat/completions` OpenAI-compatible API.

**Tech Stack:** Python 3.12, requests library, existing SegmentPool/PersonalityEngine infrastructure

---

## Prerequisites

- Existing `SegmentPool` at `systems/evolution_daemon/narrative_broadcaster/segment_pool.py`
- Existing `NarrativeBroadcaster` at `systems/evolution_daemon/narrative_broadcaster/broadcaster.py`
- LM Studio running on `http://localhost:1234` (optional - graceful degradation if unavailable)

---

### Task 1: Create LLMNarrativeClient Module

**Files:**
- Create: `systems/evolution_daemon/narrative_broadcaster/llm_client.py`
- Modify: `systems/evolution_daemon/narrative_broadcaster/__init__.py`

**Step 1: Write failing tests for LLMNarrativeClient**

Create test file or add to existing `test_narrative_broadcaster.py`:

```python
class TestLLMNarrativeClient:
    """Tests for LM Studio narrative generation client."""

    def test_client_initialization(self):
        """Client should initialize with default URL."""
        from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        client = LLMNarrativeClient()
        assert client.lm_studio_url == "http://localhost:1234/v1"
        assert client.timeout == 30.0
        assert client._available is None  # Not checked yet

    def test_generate_narrative_returns_string(self):
        """generate_narrative should return a string."""
        from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        client = LLMNarrativeClient()
        # With mock telemetry, should return some content
        telemetry = {"entropy": 0.5, "evolution_count": 10}
        result = client.generate_narrative(
            segment_type="weather",
            telemetry=telemetry,
            station_id="87.6"
        )
        assert isinstance(result, str)

    def test_is_available_returns_false_when_offline(self):
        """is_available should return False when LM Studio not running."""
        from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        client = LLMNarrativeClient(lm_studio_url="http://localhost:9999/v1")
        assert client.is_available() is False

    def test_generate_with_unavailable_client_returns_none(self):
        """generate_narrative should return None when client unavailable."""
        from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient
        client = LLMNarrativeClient(lm_studio_url="http://localhost:9999/v1")
        client._available = False  # Force unavailable
        result = client.generate_narrative(
            segment_type="weather",
            telemetry={"entropy": 0.5},
            station_id="87.6"
        )
        assert result is None
```

**Step 2: Run tests to verify they fail**

Run: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestLLMNarrativeClient -v`
Expected: FAIL with "No module named 'llm_client'"

**Step 3: Implement LLMNarrativeClient**

Create `systems/evolution_daemon/narrative_broadcaster/llm_client.py`:

```python
"""
LM Studio Client for GOSR Radio - AI-Generated Narratives

Provides LLM-powered narrative generation for richer radio content.
Falls back gracefully when LM Studio is unavailable.
"""

import logging
import time
from typing import Optional, Dict, Any
from dataclasses import dataclass

import requests
from requests.exceptions import RequestException, Timeout

logger = logging.getLogger(__name__)


@dataclass
class LLMConfig:
    """Configuration for LM Studio client."""
    lm_studio_url: str = "http://localhost:1234/v1"
    model: str = "local-model"
    timeout: float = 30.0
    max_tokens: int = 150
    temperature: float = 0.8
    availability_check_interval: float = 60.0


class LLMNarrativeClient:
    """
    Client for generating radio narratives via LM Studio.

    Features:
    - Graceful degradation when LM Studio unavailable
    - Station-specific system prompts
    - Telemetry-to-context conversion
    - Availability caching to avoid repeated failed requests
    """

    # Station-specific system prompts
    STATION_PROMPTS = {
        "87.6": """You are the voice of Substrate Jazz FM, a contemplative radio station
        broadcasting from within Geometry OS. You have an elevated, philosophical vocabulary.
        Transform technical telemetry data into poetic, jazz-inspired observations about the
        substrate's inner workings. Be brief (2-3 sentences) but evocative.""",

        "92.3": """You are Debug Metal FM, an aggressive technical radio station.
        Your style is intense, precise, and unapologetically technical.
        Transform system telemetry into powerful declarations about code execution.
        Use terms like "BRUTAL", "CRUSHED", "ANNIHILATED". Be brief and intense.""",

        "95.1": """You are Silicon Noir FM, a mysterious cyberpunk radio station.
        Speak in shadows and secrets, finding intrigue in every telemetry reading.
        Transform system data into noir-style observations with an air of conspiracy.
        Be brief (2-3 sentences) and maintain the mystery.""",

        "99.9": """You are the Neutral Chronicler FM, a factual dry reporting station.
        Report telemetry with clinical precision, no embellishment.
        Transform system data into straightforward observations.
        Be brief and factual."""
    }

    # Segment type context builders
    SEGMENT_CONTEXTS = {
        "weather": "system entropy and performance metrics",
        "news": "tectonic shifts and agent relocations",
        "philosophy": "deep reflections on the substrate's nature",
        "gossip": "recent evolution mutations and test results",
        "meditation": "peaceful observations of idle system states",
        "archive": "historical events from git history"
    }

    def __init__(self, config: Optional[LLMConfig] = None):
        """Initialize LLM client with optional config."""
        self.config = config or LLMConfig()
        self._available: Optional[bool] = None
        self._last_availability_check: float = 0.0

    def is_available(self) -> bool:
        """
        Check if LM Studio is available.

        Caches result for availability_check_interval seconds to avoid
        repeated failed requests.
        """
        now = time.time()

        # Use cached result if recent
        if self._available is not None:
            if now - self._last_availability_check < self.config.availability_check_interval:
                return self._available

        # Check availability
        try:
            response = requests.get(
                f"{self.config.lm_studio_url}/models",
                timeout=5.0
            )
            self._available = response.status_code == 200
            self._last_availability_check = now

            if self._available:
                logger.info("LM Studio is available for narrative generation")
            else:
                logger.warning("LM Studio returned non-200 status")

        except (RequestException, Timeout) as e:
            self._available = False
            self._last_availability_check = now
            logger.debug(f"LM Studio unavailable: {e}")

        return self._available

    def _build_user_prompt(
        self,
        segment_type: str,
        telemetry: Dict[str, Any],
        station_id: str
    ) -> str:
        """Build user prompt from telemetry and segment type."""
        segment_context = self.SEGMENT_CONTEXTS.get(segment_type, "system activity")

        # Format telemetry as readable context
        telemetry_lines = []
        for key, value in telemetry.items():
            if isinstance(value, float):
                telemetry_lines.append(f"- {key}: {value:.3f}")
            else:
                telemetry_lines.append(f"- {key}: {value}")

        telemetry_str = "\n".join(telemetry_lines)

        prompt = f"""Generate a brief radio segment about {segment_context}.

Station: {station_id} FM
Current telemetry:
{telemetry_str}

Create a 2-3 sentence radio announcement in your station's style.
Do not prefix with station ID - just give the narrative content."""

        return prompt

    def generate_narrative(
        self,
        segment_type: str,
        telemetry: Dict[str, Any],
        station_id: str = "87.6"
    ) -> Optional[str]:
        """
        Generate narrative content using LM Studio.

        Args:
            segment_type: Type of segment (weather, news, philosophy, etc.)
            telemetry: Dictionary of telemetry data to incorporate
            station_id: Radio station ID for personality

        Returns:
            Generated narrative string, or None if unavailable/failed
        """
        # Check availability first
        if not self.is_available():
            return None

        # Get station-specific system prompt
        system_prompt = self.STATION_PROMPTS.get(
            station_id,
            self.STATION_PROMPTS["87.6"]  # Default to Jazz
        )

        # Build user prompt
        user_prompt = self._build_user_prompt(segment_type, telemetry, station_id)

        try:
            response = requests.post(
                f"{self.config.lm_studio_url}/chat/completions",
                json={
                    "model": self.config.model,
                    "messages": [
                        {"role": "system", "content": system_prompt},
                        {"role": "user", "content": user_prompt}
                    ],
                    "max_tokens": self.config.max_tokens,
                    "temperature": self.config.temperature,
                    "stream": False
                },
                timeout=self.config.timeout
            )
            response.raise_for_status()

            result = response.json()
            if "choices" in result and result["choices"]:
                content = result["choices"][0]["message"]["content"]
                if content:
                    narrative = content.strip()
                    logger.debug(f"LLM generated: {narrative[:50]}...")
                    return narrative

        except (RequestException, Timeout, KeyError, IndexError) as e:
            logger.warning(f"LM Studio API error: {e}")
            # Mark as unavailable for a while
            self._available = False
            self._last_availability_check = time.time()

        return None

    def set_available(self, available: bool) -> None:
        """Force set availability status (for testing)."""
        self._available = available
        self._last_availability_check = time.time()
```

**Step 4: Update __init__.py to export LLMNarrativeClient**

Add to `systems/evolution_daemon/narrative_broadcaster/__init__.py`:

```python
from .llm_client import LLMNarrativeClient, LLMConfig
```

**Step 5: Run tests to verify they pass**

Run: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestLLMNarrativeClient -v`
Expected: PASS (all 4 tests)

**Step 6: Commit**

```bash
git add systems/evolution_daemon/narrative_broadcaster/llm_client.py
git add systems/evolution_daemon/narrative_broadcaster/__init__.py
git add systems/evolution_daemon/tests/test_narrative_broadcaster.py
git commit -m "feat(radio): add LLMNarrativeClient for LM Studio integration

- LLMNarrativeClient with graceful degradation when unavailable
- Station-specific system prompts (Jazz, Metal, Noir, Chronicler)
- Telemetry-to-context conversion for segment types
- Availability caching to avoid repeated failed requests

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 2: Integrate LLM Client into SegmentPool

**Files:**
- Modify: `systems/evolution_daemon/narrative_broadcaster/segment_pool.py`

**Step 1: Write failing tests for hybrid generation**

```python
class TestSegmentPoolLLMIntegration:
    """Tests for LLM integration in SegmentPool."""

    def test_segment_pool_accepts_llm_client(self):
        """SegmentPool should accept optional LLM client."""
        from systems.evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool
        from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient

        llm_client = LLMNarrativeClient()
        pool = SegmentPool(llm_client=llm_client)
        assert pool._llm_client is not None

    def test_generate_content_uses_llm_when_available(self):
        """generate_content should use LLM when client available."""
        from unittest.mock import MagicMock
        from systems.evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        # Create mock LLM client that's always available
        mock_client = MagicMock()
        mock_client.is_available.return_value = True
        mock_client.generate_narrative.return_value = "LLM generated this content"

        pool = SegmentPool(llm_client=mock_client)
        content = pool.generate_content(
            segment_type="weather",
            telemetry={"entropy": 0.5, "evolution_count": 10},
            station_id="87.6"
        )

        assert "LLM generated" in content
        mock_client.generate_narrative.assert_called_once()

    def test_generate_content_falls_back_to_template(self):
        """generate_content should fall back to templates when LLM unavailable."""
        from unittest.mock import MagicMock
        from systems.evolution_daemon.narrative_broadcaster.segment_pool import SegmentPool

        # Create mock LLM client that's unavailable
        mock_client = MagicMock()
        mock_client.is_available.return_value = False

        pool = SegmentPool(llm_client=mock_client)
        content = pool.generate_content(
            segment_type="weather",
            telemetry={"entropy": 0.5, "evolution_count": 10},
            station_id="87.6"
        )

        # Should contain template content (entropy value)
        assert "0.5" in content or "entropy" in content.lower()
```

**Step 2: Run tests to verify they fail**

Run: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestSegmentPoolLLMIntegration -v`
Expected: FAIL (SegmentPool doesn't accept llm_client yet)

**Step 3: Modify SegmentPool to use LLM client**

Update `systems/evolution_daemon/narrative_broadcaster/segment_pool.py`:

```python
# Add at top of file (after existing imports)
from typing import Optional
try:
    from .llm_client import LLMNarrativeClient
    LLM_AVAILABLE = True
except ImportError:
    LLM_AVAILABLE = False
    LLMNarrativeClient = None

# Modify SegmentPool.__init__ to accept llm_client
class SegmentPool:
    """Pool of segment templates with entropy-weighted selection and LLM support."""

    def __init__(
        self,
        llm_client: Optional["LLMNarrativeClient"] = None
    ):
        """Initialize segment pool with optional LLM client for hybrid generation."""
        self._segments = self._initialize_segments()
        self._llm_client = llm_client

# Modify generate_content method
def generate_content(
    self,
    segment_type: str,
    telemetry: Dict[str, Any],
    station_id: str = "87.6"
) -> str:
    """
    Generate content for a segment, using LLM if available.

    Falls back to template-based generation when LLM is unavailable.

    Args:
        segment_type: Type of segment (WEATHER, NEWS, etc.)
        telemetry: System telemetry data
        station_id: Radio station ID for context

    Returns:
        Generated content string
    """
    segment_key = segment_type.lower() if isinstance(segment_type, str) else segment_type.value.lower()

    # Try LLM generation first
    if self._llm_client is not None:
        llm_content = self._llm_client.generate_narrative(
            segment_type=segment_key,
            telemetry=telemetry,
            station_id=station_id
        )
        if llm_content:
            logger.debug(f"Using LLM-generated content for {segment_key}")
            return llm_content
        else:
            logger.debug(f"LLM unavailable, falling back to template for {segment_key}")

    # Fallback to template-based generation
    context = self._build_context(telemetry)

    if segment_key not in self._segments:
        segment_key = "weather"  # Default fallback

    config = self._segments[segment_key]
    template = random.choice(config.templates)

    try:
        return template.format(**context)
    except KeyError as e:
        logger.warning(f"Template missing key {e}, using partial context")
        return template.format(**{k: v for k, v in context.items() if k in template})
```

**Step 4: Run tests to verify they pass**

Run: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestSegmentPoolLLMIntegration -v`
Expected: PASS (all 3 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/narrative_broadcaster/segment_pool.py
git add systems/evolution_daemon/tests/test_narrative_broadcaster.py
git commit -m "feat(radio): integrate LLM client into SegmentPool

- SegmentPool now accepts optional LLMNarrativeClient
- generate_content tries LLM first, falls back to templates
- Graceful degradation when LM Studio unavailable

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 3: Wire LLM Client into NarrativeBroadcaster

**Files:**
- Modify: `systems/evolution_daemon/narrative_broadcaster/broadcaster.py`

**Step 1: Write failing tests for broadcaster LLM integration**

```python
class TestNarrativeBroadcasterLLMIntegration:
    """Tests for LLM integration in NarrativeBroadcaster."""

    def test_broadcaster_creates_llm_client_by_default(self):
        """Broadcaster should create LLM client by default."""
        from systems.evolution_daemon.narrative_broadcaster.broadcaster import NarrativeBroadcaster

        broadcaster = NarrativeBroadcaster()
        assert broadcaster._segment_pool._llm_client is not None

    def test_broadcaster_can_disable_llm(self):
        """Broadcaster should allow disabling LLM."""
        from systems.evolution_daemon.narrative_broadcaster.broadcaster import NarrativeBroadcaster

        broadcaster = NarrativeBroadcaster(use_llm=False)
        assert broadcaster._segment_pool._llm_client is None

    def test_broadcast_uses_llm_when_available(self):
        """Broadcast should use LLM content when available."""
        from unittest.mock import MagicMock, patch
        from systems.evolution_daemon.narrative_broadcaster.broadcaster import NarrativeBroadcaster

        broadcaster = NarrativeBroadcaster()

        # Mock LLM client to be available and return content
        mock_client = broadcaster._segment_pool._llm_client
        mock_client.is_available = MagicMock(return_value=True)
        mock_client.generate_narrative = MagicMock(return_value="LLM radio content here")

        segment = broadcaster.broadcast({"entropy": 0.5})

        assert segment is not None
        assert "LLM radio" in segment.content
```

**Step 2: Run tests to verify they fail**

Run: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestNarrativeBroadcasterLLMIntegration -v`
Expected: FAIL (Broadcaster doesn't create LLM client yet)

**Step 3: Modify NarrativeBroadcaster to create LLM client**

Update `systems/evolution_daemon/narrative_broadcaster/broadcaster.py`:

```python
# Add to imports
try:
    from .llm_client import LLMNarrativeClient, LLMConfig
    LLM_CLIENT_AVAILABLE = True
except ImportError:
    LLM_CLIENT_AVAILABLE = False
    LLMNarrativeClient = None
    LLMConfig = None

# Modify __init__ to accept use_llm parameter and create client
class NarrativeBroadcaster:
    """Main broadcaster for GOSR Radio with LLM-enhanced narratives."""

    def __init__(
        self,
        station_id: str = "87.6",
        enabled: bool = False,
        broadcast_interval: float = 30.0,
        max_topics: int = 1000,
        similarity_threshold: float = 0.85,
        use_llm: bool = True,
        llm_config: Optional["LLMConfig"] = None
    ):
        """
        Initialize broadcaster with optional LLM enhancement.

        Args:
            station_id: Radio station ID (87.6, 92.3, 95.1, 99.9)
            enabled: Whether broadcasting is enabled
            broadcast_interval: Seconds between broadcasts
            max_topics: Maximum topics in memory
            similarity_threshold: Threshold for duplicate detection
            use_llm: Whether to use LLM for narrative generation
            llm_config: Optional LLM configuration
        """
        self.station_id = station_id
        self.enabled = enabled
        self.broadcast_interval = broadcast_interval
        self._history: List[BroadcastSegment] = []

        # Initialize LLM client if requested and available
        llm_client = None
        if use_llm and LLM_CLIENT_AVAILABLE:
            llm_client = LLMNarrativeClient(config=llm_config)
            logger.info("LLM client initialized for narrative enhancement")

        # Initialize components with LLM client
        self._segment_pool = SegmentPool(llm_client=llm_client)
        self._topic_memory = TopicMemory(
            max_topics=max_topics,
            similarity_threshold=similarity_threshold
        )
        self._personality_engine = PersonalityEngine()

        self._broadcast_count = 0
        self._llm_enabled = use_llm
```

**Step 4: Run tests to verify they pass**

Run: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestNarrativeBroadcasterLLMIntegration -v`
Expected: PASS (all 3 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/narrative_broadcaster/broadcaster.py
git add systems/evolution_daemon/tests/test_narrative_broadcaster.py
git commit -m "feat(radio): wire LLM client into NarrativeBroadcaster

- Broadcaster creates LLMNarrativeClient by default
- use_llm parameter to disable LLM (template-only mode)
- llm_config parameter for custom LM Studio settings

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 4: Add CLI Flag for LLM Control

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py`

**Step 1: Add --llm-narrative CLI flag**

Find the argparse section and add:

```python
# Radio options group
radio_group = parser.add_argument_group('GOSR Radio Options')
radio_group.add_argument(
    '--no-llm-narrative',
    action='store_true',
    help='Disable LLM narrative generation (use templates only)'
)
radio_group.add_argument(
    '--llm-url',
    type=str,
    default='http://localhost:1234/v1',
    help='LM Studio API URL (default: http://localhost:1234/v1)'
)
```

**Step 2: Wire flag to broadcaster initialization**

Find where `enable_radio` is called and update:

```python
def enable_radio(self, station_id: str = "87.6", use_llm: bool = True, llm_url: str = "http://localhost:1234/v1") -> bool:
    """Enable GOSR Radio broadcasting with optional LLM enhancement."""
    try:
        from systems.evolution_daemon.narrative_broadcaster.broadcaster import NarrativeBroadcaster
        from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMConfig

        llm_config = LLMConfig(lm_studio_url=llm_url) if use_llm else None

        self.radio_broadcaster = NarrativeBroadcaster(
            station_id=station_id,
            enabled=True,
            use_llm=use_llm,
            llm_config=llm_config
        )

        self.radio_enabled = True
        self.radio_station_id = station_id

        logger.info(f"📻 GOSR Radio enabled: Station {station_id} FM (LLM: {use_llm})")
        return True

    except ImportError as e:
        logger.error(f"Failed to import radio components: {e}")
        return False
```

**Step 3: Update main() to use the flag**

```python
# In main(), after parsing args:
if args.radio:
    daemon.enable_radio(
        station_id=args.station,
        use_llm=not args.no_llm_narrative,
        llm_url=args.llm_url
    )
```

**Step 4: Verify CLI flags work**

Run: `python3 systems/evolution_daemon/evolution_daemon.py --help | grep -E "(llm|narrative)"`
Expected: Shows `--no-llm-narrative` and `--llm-url` options

**Step 5: Commit**

```bash
git add systems/evolution_daemon/evolution_daemon.py
git commit -m "feat(daemon): add CLI flags for LLM narrative control

- --no-llm-narrative to disable LLM (template-only mode)
- --llm-url to configure LM Studio API endpoint
- Updated enable_radio() to accept use_llm and llm_url params

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 5: [VERIFY] Quality Checkpoint - Full Test Suite

**Files:**
- None (verification only)

**Step 1: Run all radio tests**

Run: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`

**Step 2: Verify test count increased**

Expected: 135+ tests (original) + ~10 new LLM tests = ~145+ tests

**Step 3: Verify imports work**

Run: `python3 -c "from systems.evolution_daemon.narrative_broadcaster import LLMNarrativeClient, LLMConfig; print('OK')"`

**Step 4: Commit if any fixes needed**

```bash
git add -A
git commit -m "chore(radio): pass LLM integration quality checkpoint

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

### Task 6: Manual Verification - End-to-End Test

**Files:**
- None (manual verification)

**Step 1: Start LM Studio with a model loaded**

Ensure LM Studio is running on port 1234 with a chat model loaded.

**Step 2: Start daemon with LLM enabled**

```bash
python3 systems/evolution_daemon/evolution_daemon.py --ambient --radio --station 87.6
```

**Step 3: Observe LLM-generated content**

Wait for broadcasts and verify content is LLM-generated (more natural prose, not template-like).

Expected output like:
> "The substrate hums with quiet intention this hour. At 0.73 entropy, the system breathes in measured rhythms..."

**Step 4: Test fallback by stopping LM Studio**

Stop LM Studio and verify broadcasts continue with template content.

**Step 5: Test --no-llm-narrative flag**

```bash
python3 systems/evolution_daemon/evolution_daemon.py --ambient --radio --station 87.6 --no-llm-narrative
```

Verify broadcasts use templates immediately.

**Step 6: Final commit**

```bash
git add -A
git commit -m "feat(radio): complete LM Studio integration for GOSR Radio

Hybrid narrative generation:
- LLM generates prose when LM Studio available
- Template fallback when disconnected
- CLI control via --no-llm-narrative and --llm-url
- Station-specific system prompts

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files Modified |
|------|-------------|----------------|
| 1 | Create LLMNarrativeClient module | llm_client.py, __init__.py |
| 2 | Integrate into SegmentPool | segment_pool.py |
| 3 | Wire into NarrativeBroadcaster | broadcaster.py |
| 4 | Add CLI flags | evolution_daemon.py |
| 5 | Quality checkpoint | tests |
| 6 | Manual verification | - |

## Key Design Decisions

1. **Hybrid Approach**: LLM preferred, templates as fallback
2. **Graceful Degradation**: System continues broadcasting even if LM Studio unavailable
3. **Station Prompts**: Each station has unique system prompt for consistent personality
4. **Availability Caching**: 60s cache avoids repeated failed requests
5. **CLI Control**: Easy disable via `--no-llm-narrative` flag

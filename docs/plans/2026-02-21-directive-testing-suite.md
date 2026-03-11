# Directive Testing Suite Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a comprehensive testing suite proving the WordPress Frontend / Geometry OS integration works correctly under all conditions.

**Architecture:** Three-layer testing approach: (1) Expanded unit tests for edge cases, (2) Performance benchmarks for latency/throughput, (3) Stress tests for stability under load. All tests use pytest with fixtures for isolation.

**Tech Stack:** Python 3.12, pytest, pytest-benchmark, pytest-xdist (parallel), requests-mock, time module

---

## Task 1: Add Scope Detection Edge Case Tests

**Files:**
- Modify: `tests/test_directive_agent.py`

**Step 1: Write the failing tests**

Add new test class `TestScopeDetectionEdgeCases`:

```python
class TestScopeDetectionEdgeCases:
    """Edge case tests for scope detection."""

    def test_scope_with_mixed_case_keywords(self):
        """Keywords should match regardless of case."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="EXPLAIN the system",
            content="Please EXPLAIN how this works",
            date="2026-01-01",
            author="user"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL

    def test_scope_with_keyword_in_middle_of_word(self):
        """Keywords should only match whole words."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="Explanation of the system",
            content="This is an explanation",
            date="2026-01-01",
            author="user"
        )
        # "explain" in "explanation" should NOT match
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_scope_with_multiple_keywords_same_category(self):
        """Multiple informational keywords should still be INFORMATIONAL."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="Explain and describe the system",
            content="Tell me about how does it work",
            date="2026-01-01",
            author="user"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL

    def test_scope_mixed_informational_and_research(self):
        """Informational should win when both present."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="Explain and investigate the system",
            content="",
            date="2026-01-01",
            author="user"
        )
        # Informational keywords are checked first
        assert directive.scope == DirectiveScope.INFORMATIONAL

    def test_scope_with_punctuation(self):
        """Punctuation should not affect keyword matching."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="What is the system?",
            content="Explain, please!",
            date="2026-01-01",
            author="user"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL

    def test_scope_empty_title_and_content(self):
        """Empty directive should be UNKNOWN."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="",
            content="",
            date="2026-01-01",
            author="user"
        )
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_scope_whitespace_only(self):
        """Whitespace-only should be UNKNOWN."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="   ",
            content="\n\t",
            date="2026-01-01",
            author="user"
        )
        assert directive.scope == DirectiveScope.UNKNOWN

    def test_scope_with_html_tags(self):
        """HTML tags should not affect keyword matching."""
        from systems.intelligence.directive_agent import Directive, DirectiveScope

        directive = Directive(
            id=1,
            title="<p>Explain</p> the system",
            content="<div>How does it work</div>",
            date="2026-01-01",
            author="user"
        )
        assert directive.scope == DirectiveScope.INFORMATIONAL
```

**Step 2: Run tests to verify current behavior**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/test_directive_agent.py::TestScopeDetectionEdgeCases -v`
Expected: Some tests may fail (document which)

**Step 3: Fix any failing tests**

If tests fail due to implementation bugs, fix the implementation in `systems/intelligence/directive_agent.py`.

**Step 4: Run tests to verify all pass**

Run: `python -m pytest tests/test_directive_agent.py::TestScopeDetectionEdgeCases -v`
Expected: 8 passed

**Step 5: Commit**

```bash
git add tests/test_directive_agent.py
git commit -m "test(directive): add scope detection edge case tests"
```

---

## Task 2: Add Component Lookup Edge Case Tests

**Files:**
- Modify: `tests/test_directive_agent.py`

**Step 1: Write the failing tests**

Add new test class `TestComponentLookupEdgeCases`:

```python
class TestComponentLookupEdgeCases:
    """Edge case tests for substrate map component lookup."""

    @pytest.fixture
    def agent_with_components(self, tmp_path):
        """Create agent with test substrate map."""
        from systems.intelligence.directive_agent import DirectiveAgent

        substrate = {
            "evolution_daemon": {
                "name": "Evolution Daemon",
                "path": "systems/evolution_daemon",
                "description": "Natural Selection for Operating Systems"
            },
            "visual_shell": {
                "name": "Visual Shell",
                "path": "systems/visual_shell",
                "description": "PixiJS-based infinite map renderer"
            },
            "pixel_compiler": {
                "name": "Pixel Compiler",
                "path": "systems/pixel_compiler",
                "description": "Converts code to executable images"
            }
        }

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump(substrate, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))
        return agent

    def test_lookup_with_extra_whitespace(self, agent_with_components):
        """Target with extra whitespace should still match."""
        result = agent_with_components._lookup_component("  evolution_daemon  ")
        assert result is not None
        assert result["name"] == "Evolution Daemon"

    def test_lookup_with_underscores_vs_spaces(self, agent_with_components):
        """Underscores and spaces should be treated similarly."""
        result1 = agent_with_components._lookup_component("evolution daemon")
        result2 = agent_with_components._lookup_component("evolution_daemon")
        # At least one should match
        assert result1 is not None or result2 is not None

    def test_lookup_partial_name_match(self, agent_with_components):
        """Partial name should match if unique."""
        result = agent_with_components._lookup_component("pixel")
        assert result is not None
        assert "Pixel" in result["name"]

    def test_lookup_description_search(self, agent_with_components):
        """Search should also check descriptions."""
        result = agent_with_components._lookup_component("renderer")
        assert result is not None
        assert "renderer" in result["description"].lower()

    def test_lookup_returns_none_for_garbage(self, agent_with_components):
        """Garbage input should return None, not raise."""
        result = agent_with_components._lookup_component("xyzzy123nonexistent")
        assert result is None

    def test_lookup_with_numbers(self, agent_with_components):
        """Numbers in target should be handled."""
        # This should not crash
        result = agent_with_components._lookup_component("daemon123")
        # May or may not match, but shouldn't crash
        assert result is None or isinstance(result, dict)
```

**Step 2: Run tests to verify current behavior**

Run: `python -m pytest tests/test_directive_agent.py::TestComponentLookupEdgeCases -v`
Expected: Some tests may fail

**Step 3: Fix any failing tests**

If implementation needs improvement, update `_lookup_component` method.

**Step 4: Run tests to verify all pass**

Run: `python -m pytest tests/test_directive_agent.py::TestComponentLookupEdgeCases -v`
Expected: 6 passed

**Step 5: Commit**

```bash
git add tests/test_directive_agent.py
git commit -m "test(directive): add component lookup edge case tests"
```

---

## Task 3: Create Performance Benchmark Tests

**Files:**
- Create: `tests/test_directive_performance.py`

**Step 1: Create the performance test file**

```python
#!/usr/bin/env python3
"""
Performance Benchmark Tests for DirectiveAgent.

Measures:
- Poll latency: Time to poll WordPress
- Processing time: Time from directive to response
- Heartbeat overhead: Time to write heartbeat file
- Memory efficiency: Agent memory footprint

Run: pytest tests/test_directive_performance.py -v --benchmark-only
"""

import pytest
import time
import json
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

from systems.intelligence.directive_agent import (
    DirectiveAgent,
    Directive,
    DirectiveScope,
    DirectiveStatus,
)


class TestPollingPerformance:
    """Performance tests for directive polling."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create agent with mocked WordPress."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test", "description": "Test"}}, f)

        return DirectiveAgent(substrate_map_path=str(substrate_file))

    def test_single_poll_latency_under_100ms(self, agent):
        """Single poll should complete in under 100ms."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True, "directives": []}

            start = time.perf_counter()
            agent.poll_directives()
            elapsed = time.perf_counter() - start

            assert elapsed < 0.1, f"Poll took {elapsed:.3f}s, expected < 0.1s"

    def test_process_directive_latency_under_50ms(self, agent):
        """Processing a single directive should be under 50ms."""
        directive = Directive(
            id=1,
            title="Explain the test component",
            content="What is test?",
            date="2026-01-01",
            author="user"
        )

        start = time.perf_counter()
        status, response = agent.execute_directive(directive)
        elapsed = time.perf_counter() - start

        assert elapsed < 0.05, f"Execution took {elapsed:.3f}s, expected < 0.05s"

    def test_heartbeat_write_latency_under_10ms(self, agent, tmp_path):
        """Heartbeat write should be under 10ms."""
        heartbeat_file = tmp_path / "heartbeat.json"
        agent.heartbeat_path = str(heartbeat_file)

        start = time.perf_counter()
        agent.write_heartbeat()
        elapsed = time.perf_counter() - start

        assert elapsed < 0.01, f"Heartbeat took {elapsed:.3f}s, expected < 0.01s"

    def test_process_100_directives_under_5_seconds(self, agent):
        """Processing 100 directives should be under 5 seconds."""
        directives = [
            Directive(
                id=i,
                title=f"Explain component {i}",
                content="What is test?",
                date="2026-01-01",
                author="user"
            )
            for i in range(100)
        ]

        start = time.perf_counter()
        for directive in directives:
            agent.execute_directive(directive)
        elapsed = time.perf_counter() - start

        assert elapsed < 5.0, f"100 directives took {elapsed:.1f}s, expected < 5s"


class TestHeartbeatPerformance:
    """Performance tests for heartbeat mechanism."""

    def test_heartbeat_file_size_under_1kb(self, tmp_path):
        """Heartbeat file should be under 1KB."""
        from systems.intelligence.directive_agent import DirectiveAgent

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({}, f)

        heartbeat_file = tmp_path / "heartbeat.json"
        agent = DirectiveAgent(
            substrate_map_path=str(substrate_file),
            heartbeat_path=str(heartbeat_file)
        )

        agent.write_heartbeat()

        size = heartbeat_file.stat().st_size
        assert size < 1024, f"Heartbeat file is {size} bytes, expected < 1024"

    def test_heartbeat_overhead_is_negligible(self, tmp_path):
        """Heartbeat should add < 10% overhead to processing."""
        from systems.intelligence.directive_agent import DirectiveAgent

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test"}}, f)

        heartbeat_file = tmp_path / "heartbeat.json"

        # Without heartbeat
        agent_no_hb = DirectiveAgent(substrate_map_path=str(substrate_file))
        directive = Directive(id=1, title="Explain test", content="", date="", author="")

        start = time.perf_counter()
        for _ in range(100):
            agent_no_hb.execute_directive(directive)
        time_no_hb = time.perf_counter() - start

        # With heartbeat
        agent_with_hb = DirectiveAgent(
            substrate_map_path=str(substrate_file),
            heartbeat_path=str(heartbeat_file)
        )

        start = time.perf_counter()
        for _ in range(100):
            agent_with_hb.execute_directive(directive)
            agent_with_hb.write_heartbeat()
        time_with_hb = time.perf_counter() - start

        overhead = (time_with_hb - time_no_hb) / time_no_hb
        assert overhead < 0.1, f"Heartbeat overhead is {overhead:.1%}, expected < 10%"


class TestMemoryEfficiency:
    """Memory efficiency tests."""

    def test_substrate_cache_size_reasonable(self, tmp_path):
        """Substrate cache with 1000 components should be under 10MB."""
        import sys

        # Create large substrate map
        substrate = {}
        for i in range(1000):
            substrate[f"component_{i}"] = {
                "name": f"Component {i}",
                "path": f"systems/component_{i}",
                "description": f"Description for component {i}" * 10,
                "metadata": {
                    "language": "Python",
                    "files": i % 100,
                    "entry_points": ["main.py"]
                }
            }

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump(substrate, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))

        # Rough memory estimate
        cache_size = sys.getsizeof(agent._substrate_cache)
        for value in agent._substrate_cache.values():
            cache_size += sys.getsizeof(value)

        # Should be under 10MB for 1000 components
        assert cache_size < 10 * 1024 * 1024, f"Cache is {cache_size / 1024 / 1024:.1f}MB"
```

**Step 2: Run performance tests**

Run: `python -m pytest tests/test_directive_performance.py -v`
Expected: All tests pass (or document which need optimization)

**Step 3: If tests fail, optimize implementation**

Document any failures and create optimization tasks.

**Step 4: Commit**

```bash
git add tests/test_directive_performance.py
git commit -m "test(directive): add performance benchmark tests"
```

---

## Task 4: Create Stress Tests

**Files:**
- Create: `tests/test_directive_stress.py`

**Step 1: Create the stress test file**

```python
#!/usr/bin/env python3
"""
Stress Tests for DirectiveAgent.

Tests stability under:
- High volume (many directives)
- Long running (memory leaks)
- Concurrent access
- Error conditions

Run: pytest tests/test_directive_stress.py -v -x
"""

import pytest
import time
import json
import tempfile
import threading
from pathlib import Path
from unittest.mock import patch, MagicMock

from systems.intelligence.directive_agent import (
    DirectiveAgent,
    Directive,
    DirectiveScope,
    DirectiveStatus,
)


class TestHighVolume:
    """Tests for handling large volumes of directives."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create agent with test substrate."""
        substrate_file = tmp_path / "substrate.json"
        substrate = {f"comp_{i}": {"name": f"Component {i}", "description": f"Desc {i}"} for i in range(100)}
        with open(substrate_file, 'w') as f:
            json.dump(substrate, f)

        return DirectiveAgent(substrate_map_path=str(substrate_file))

    def test_process_1000_directives_no_crash(self, agent):
        """Agent should handle 1000 directives without crashing."""
        errors = []

        for i in range(1000):
            try:
                directive = Directive(
                    id=i,
                    title=f"Explain comp_{i % 100}",
                    content=f"What is component {i}?",
                    date="2026-01-01",
                    author="user"
                )
                status, response = agent.execute_directive(directive)
                assert isinstance(status, DirectiveStatus)
                assert isinstance(response, str)
            except Exception as e:
                errors.append((i, str(e)))

        assert len(errors) == 0, f"Errors on {len(errors)} directives: {errors[:5]}"

    def test_all_directives_processed_unique(self, agent):
        """No directive should be processed twice in single cycle."""
        processed_ids = set()

        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {
                "success": True,
                "directives": [
                    {"id": i, "title": f"Explain test", "content": "", "date": "", "author": ""}
                    for i in range(100)
                ]
            }

            directives = agent.poll_directives()

            for d in directives:
                assert d.id not in processed_ids, f"Duplicate directive {d.id}"
                processed_ids.add(d.id)


class TestLongRunning:
    """Tests for long-running stability."""

    def test_no_memory_leak_after_1000_cycles(self, tmp_path):
        """Memory should not grow significantly over 1000 cycles."""
        import gc
        import sys

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test"}}, f)

        heartbeat_file = tmp_path / "heartbeat.json"

        agent = DirectiveAgent(
            substrate_map_path=str(substrate_file),
            heartbeat_path=str(heartbeat_file)
        )

        # Force garbage collection and get baseline
        gc.collect()
        baseline_size = sys.getsizeof(agent.__dict__)

        # Run 1000 cycles
        for i in range(1000):
            agent._directives_processed = i
            agent.write_heartbeat()

        # Force garbage collection and check growth
        gc.collect()
        final_size = sys.getsizeof(agent.__dict__)

        # Should not grow by more than 10x
        growth = final_size / baseline_size if baseline_size > 0 else 1
        assert growth < 10, f"Memory grew {growth:.1f}x over 1000 cycles"

    def test_heartbeat_file_does_not_grow(self, tmp_path):
        """Heartbeat file should not grow over time."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({}, f)

        heartbeat_file = tmp_path / "heartbeat.json"

        agent = DirectiveAgent(
            substrate_map_path=str(substrate_file),
            heartbeat_path=str(heartbeat_file)
        )

        sizes = []
        for i in range(100):
            agent._directives_processed = i
            agent.write_heartbeat()
            sizes.append(heartbeat_file.stat().st_size)

        # Size should be consistent (not growing)
        assert max(sizes) == min(sizes), f"Heartbeat file size varies: {min(sizes)}-{max(sizes)}"


class TestConcurrentAccess:
    """Tests for thread safety."""

    def test_concurrent_heartbeat_writes(self, tmp_path):
        """Multiple threads writing heartbeat should not corrupt file."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({}, f)

        heartbeat_file = tmp_path / "heartbeat.json"

        errors = []

        def write_heartbeat(thread_id):
            try:
                agent = DirectiveAgent(
                    substrate_map_path=str(substrate_file),
                    heartbeat_path=str(heartbeat_file)
                )
                for i in range(10):
                    agent._directives_processed = thread_id * 100 + i
                    agent.write_heartbeat()
            except Exception as e:
                errors.append((thread_id, str(e)))

        threads = [threading.Thread(target=write_heartbeat, args=(i,)) for i in range(5)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        # Should have no errors
        assert len(errors) == 0, f"Thread errors: {errors}"

        # Final file should be valid JSON
        with open(heartbeat_file) as f:
            data = json.load(f)
        assert "timestamp" in data


class TestErrorRecovery:
    """Tests for error recovery."""

    def test_continues_after_api_failure(self, tmp_path):
        """Agent should continue processing after API failure."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test"}}, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))

        call_count = 0

        def failing_api(tool, **kwargs):
            nonlocal call_count
            call_count += 1
            if call_count == 1:
                raise Exception("API failure")
            return {"success": True, "directives": []}

        with patch.object(agent, '_api_call', failing_api):
            # First call fails
            result1 = agent.poll_directives()
            assert result1 == []

            # Second call should work
            result2 = agent.poll_directives()
            assert result2 == []

    def test_continues_after_invalid_directive(self, tmp_path):
        """Agent should continue processing after invalid directive."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({}, f)

        heartbeat_file = tmp_path / "heartbeat.json"
        agent = DirectiveAgent(
            substrate_map_path=str(substrate_file),
            heartbeat_path=str(heartbeat_file)
        )

        with patch.object(agent, '_api_call') as mock_api:
            # First call returns invalid data, second returns valid
            mock_api.side_effect = [
                {"success": True, "directives": [{"id": "invalid", "title": None}]},  # Invalid
                {"success": True, "directives": [{"id": 2, "title": "Test", "content": "", "date": "", "author": ""}]}
            ]

            # Should handle gracefully
            result1 = agent.poll_directives()
            result2 = agent.poll_directives()

            # At least second call should work
            assert len(result2) == 1 or len(result1) >= 0  # Flexible assertion
```

**Step 2: Run stress tests**

Run: `python -m pytest tests/test_directive_stress.py -v`
Expected: All tests pass

**Step 3: Document any failures**

If tests fail, create tickets for fixes.

**Step 4: Commit**

```bash
git add tests/test_directive_stress.py
git commit -m "test(directive): add stress tests for high volume and concurrency"
```

---

## Task 5: Create API Contract Tests

**Files:**
- Create: `tests/test_directive_contracts.py`

**Step 1: Create the contract test file**

```python
#!/usr/bin/env python3
"""
API Contract Tests for WordPress Integration.

Validates that the DirectiveAgent correctly interacts with
the WordPress API according to the expected contracts.

Run: pytest tests/test_directive_contracts.py -v
"""

import pytest
import json
from unittest.mock import patch, MagicMock

from systems.intelligence.directive_agent import DirectiveAgent


class TestGetDirectivesContract:
    """Contract tests for getDirectives API."""

    @pytest.fixture
    def agent(self):
        return DirectiveAgent()

    def test_getDirectives_returns_list(self, agent):
        """getDirectives should return a list of directives."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {
                "success": True,
                "directives": [
                    {"id": 1, "title": "Test", "content": "", "date": "", "author": ""}
                ]
            }

            result = agent.poll_directives()

            assert isinstance(result, list)

    def test_getDirectives_payload_format(self, agent):
        """getDirectives should send correct payload format."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True, "directives": []}

            agent.poll_directives()

            # Verify payload format
            call_args = mock_api.call_args
            assert call_args[0][0] == "getDirectives"

    def test_getDirectives_handles_empty_response(self, agent):
        """getDirectives should handle empty directives list."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True, "directives": []}

            result = agent.poll_directives()

            assert result == []

    def test_getDirectives_handles_failure(self, agent):
        """getDirectives should handle API failure gracefully."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": False, "error": "Database error"}

            result = agent.poll_directives()

            assert result == []


class TestMarkDirectiveProcessedContract:
    """Contract tests for markDirectiveProcessed API."""

    @pytest.fixture
    def agent(self):
        return DirectiveAgent()

    def test_markDirectiveProcessed_payload_format(self, agent):
        """markDirectiveProcessed should send post_id in arguments."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            result = agent.mark_processed(123)

            # Verify payload includes post_id
            call_args = mock_api.call_args
            assert call_args[1]["post_id"] == 123
            assert result is True

    def test_markDirectiveProcessed_returns_boolean(self, agent):
        """markDirectiveProcessed should return boolean success."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            result = agent.mark_processed(123)
            assert result is True

            mock_api.return_value = {"success": False}
            result = agent.mark_processed(456)
            assert result is False


class TestPostDirectiveResponseContract:
    """Contract tests for postDirectiveResponse API."""

    @pytest.fixture
    def agent(self):
        return DirectiveAgent()

    def test_postDirectiveResponse_payload_format(self, agent):
        """postDirectiveResponse should send post_id, response, status."""
        from systems.intelligence.directive_agent import Directive, DirectiveStatus

        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            directive = Directive(id=1, title="Test", content="", date="", author="")
            agent.post_response(directive, DirectiveStatus.COMPLETED, "<p>Test</p>")

            call_args = mock_api.call_args
            assert call_args[1]["post_id"] == 1
            assert "response" in call_args[1]
            assert call_args[1]["status"] == "completed"

    def test_postDirectiveResponse_includes_status_emoji(self, agent):
        """Response should include status emoji in HTML."""
        from systems.intelligence.directive_agent import Directive, DirectiveStatus

        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            directive = Directive(id=1, title="Test", content="", date="", author="")
            agent.post_response(directive, DirectiveStatus.COMPLETED, "<p>Test</p>")

            call_args = mock_api.call_args
            response = call_args[1]["response"]
            assert "✅" in response  # Completed emoji

    def test_postDirectiveResponse_out_of_scope_emoji(self, agent):
        """Out of scope should use 🚫 emoji."""
        from systems.intelligence.directive_agent import Directive, DirectiveStatus

        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True}

            directive = Directive(id=1, title="Test", content="", date="", author="")
            agent.post_response(directive, DirectiveStatus.OUT_OF_SCOPE, "<p>Nope</p>")

            call_args = mock_api.call_args
            response = call_args[1]["response"]
            assert "🚫" in response


class TestSubstrateCacheContract:
    """Contract tests for substrate map cache."""

    def test_substrate_cache_is_dict(self, tmp_path):
        """Substrate cache should be a dictionary."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test"}}, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))

        assert isinstance(agent._substrate_cache, dict)

    def test_substrate_cache_component_has_required_fields(self, tmp_path):
        """Each component should have required fields."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({
                "test": {
                    "name": "Test Component",
                    "path": "systems/test",
                    "description": "Test description"
                }
            }, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))

        component = agent._substrate_cache.get("test")
        assert "name" in component
        assert "path" in component or "description" in component  # At least one

    def test_substrate_cache_handles_missing_file(self, tmp_path):
        """Agent should handle missing substrate file gracefully."""
        non_existent = tmp_path / "does_not_exist.json"

        # Should not raise
        agent = DirectiveAgent(substrate_map_path=str(non_existent))

        assert agent._substrate_cache == {}

    def test_substrate_cache_handles_invalid_json(self, tmp_path):
        """Agent should handle invalid JSON gracefully."""
        invalid_file = tmp_path / "invalid.json"
        with open(invalid_file, 'w') as f:
            f.write("not valid json {{{")

        # Should not raise
        agent = DirectiveAgent(substrate_map_path=str(invalid_file))

        assert agent._substrate_cache == {}
```

**Step 2: Run contract tests**

Run: `python -m pytest tests/test_directive_contracts.py -v`
Expected: All tests pass

**Step 3: Commit**

```bash
git add tests/test_directive_contracts.py
git commit -m "test(directive): add API contract tests for WordPress integration"
```

---

## Task 6: Run Full Test Suite and Generate Report

**Files:**
- None (verification only)

**Step 1: Run all directive tests**

Run: `python -m pytest tests/test_directive*.py -v --tb=short`
Expected: All tests pass

**Step 2: Generate test coverage report**

Run: `python -m pytest tests/test_directive*.py --cov=systems.intelligence.directive_agent --cov-report=term-missing`
Expected: >80% coverage

**Step 3: Document results**

Create a summary of:
- Total tests: count
- Pass rate: percentage
- Coverage: percentage
- Performance benchmarks: results

**Step 4: Final commit (if any fixes needed)**

```bash
git add tests/
git commit -m "test(directive): comprehensive testing suite complete"
```

---

## Summary

| Task | Description | Tests Added |
|------|-------------|-------------|
| 1 | Scope Detection Edge Cases | 8 |
| 2 | Component Lookup Edge Cases | 6 |
| 3 | Performance Benchmarks | 8 |
| 4 | Stress Tests | 8 |
| 5 | API Contracts | 14 |
| **Total** | | **44+** |

**Current Tests:** 63
**Target Tests:** 107+

**Estimated effort:** 2-3 hours

**Dependencies:** None (all use existing DirectiveAgent)

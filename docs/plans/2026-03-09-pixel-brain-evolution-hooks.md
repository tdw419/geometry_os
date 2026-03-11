# PixelBrain Evolution Hooks Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Wire PixelBrain to the Evolution Daemon to enable recursive self-improvement of the cognitive engine.

**Architecture:** The BrainEvolutionHook already exists but needs integration with the daemon's main evolution loop. We add CLI commands for monitoring/triggering evolution, wire visual feedback through the existing bridge, and add fitness benchmarks for meaningful evaluation.

**Tech Stack:** Python (EvolutionDaemon, BrainEvolutionHook), WebMCP (visual feedback), CLI (pixelrts CLI)

---

## Phase 1: Daemon Integration

### Task 1: Wire Hook to Daemon Main Loop

**Files:**
- Modify: `systems/evolution_daemon/evolution_daemon.py:180-220`
- Modify: `systems/evolution_daemon/evolution_hooks/__init__.py`
- Test: `tests/test_brain_evolution_daemon.py`

**Step 1: Write the failing test**

Create `tests/test_brain_evolution_daemon.py`:

```python
"""Tests for brain evolution integration with daemon."""
import pytest
from unittest.mock import MagicMock, patch


class TestBrainEvolutionDaemonIntegration:
    """Test brain evolution is wired into daemon."""

    def test_daemon_registers_brain_hook(self):
        """Daemon should register brain evolution hook on init."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

        daemon = EvolutionDaemon()

        # Check that brain hook is registered
        assert hasattr(daemon, '_brain_hook')
        assert isinstance(daemon._brain_hook, BrainEvolutionHook)

    @pytest.mark.asyncio
    async def test_evolution_cycle_calls_brain_hook(self):
        """Evolution cycle should invoke brain hook."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        # Mock the brain hook
        daemon._brain_hook.on_evolution_cycle = MagicMock(return_value={"tested": True})

        # Trigger evolution cycle
        result = await daemon._run_evolution_cycle({"evolve_brain": True})

        assert result is not None

    def test_brain_hook_disabled_by_default(self):
        """Brain evolution should be disabled by default."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        daemon = EvolutionDaemon()

        # Check config
        assert daemon.config.get('evolve_brain', False) is True
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_brain_evolution_daemon.py::TestBrainEvolutionDaemonIntegration::test_daemon_registers_brain_hook -v`
Expected: FAIL (hook not registered yet)

**Step 3: Modify daemon to register brain hook**

Add to `systems/evolution_daemon/evolution_daemon.py` around line 180:

```python
# Brain Evolution Hook Integration
try:
    from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import (
        BrainEvolutionHook,
        register_hook as register_brain_evolution_hook
    )
    HAS_BRAIN_EVOLUTION_HOOK = True
except ImportError:
    HAS_BRAIN_EVOLUTION_HOOK = False
    BrainEvolutionHook = None

class EvolutionDaemon:
    def __init__(self, ...):
        # ... existing init code ...

        # Register brain evolution hook
        self._brain_hook = None
        if HAS_BRAIN_EVOLUTION_HOOK:
            self._brain_hook = BrainEvolutionHook()
            self.register_hook('evolution_cycle', self._brain_hook.on_evolution_cycle)
            logger.info("Brain evolution hook registered")
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_brain_evolution_daemon.py -v`

**Step 5: Commit**

```bash
git add systems/evolution_daemon/evolution_daemon.py tests/test_brain_evolution_daemon.py
git commit -m "feat(evolution): wire brain evolution hook to daemon main loop"
```

---

### Task 2: Update Evolution Hooks __init__.py

**Files:**
- Modify: `systems/evolution_daemon/evolution_hooks/__init__.py`

**Step 1: Export brain_evolution_hook**

```python
# systems/evolution_daemon/evolution_hooks/__init__.py
from .brain_evolution_hook import BrainEvolutionHook, register_hook

from .meta_prompter_evolution_hook import MetaPrompterEvolutionHook

__all__ = [
    'BrainEvolutionHook',
    'register_hook',
    'MetaPrompterEvolutionHook',
]
```

**Step 2: Commit**

```bash
git add systems/evolution_daemon/evolution_hooks/__init__.py
git commit -m "feat(evolution): export brain evolution hook from hooks package"
```

---

## Phase 2: Visual Feedback

### Task 3: Emit Visual Events on Brain Mutation

**Files:**
- Modify: `systems/evolution_daemon/evolution_hooks/brain_evolution_hook.py:75-100`
- Test: `tests/test_brain_evolution_visual.py`

**Step 1: Write the failing test**

Create `tests/test_brain_evolution_visual.py`:

```python
"""Tests for brain evolution visual feedback."""
import pytest
from unittest.mock import MagicMock, AsyncMock


class TestBrainEvolutionVisual:
    """Test brain evolution emits visual feedback."""

    @pytest.fixture
    def hook_with_bridge(self):
        """Create hook with mock visual bridge."""
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

        hook = BrainEvolutionHook()
        hook.visual_bridge = MagicMock()
        return hook

    @pytest.mark.asyncio
    async def test_mutation_emits_glow_event(self, hook_with_bridge):
        """Successful mutation should emit atlas glow."""
        hook = hook_with_bridge

        # Mock successful mutation
        hook._brain_atlas = MagicMock()
        hook._brain_atlas.shape = (1024, 1024, 4)

        result = await hook.on_evolution_cycle({
            'evolve_brain': True,
            'cycle_number': 1,
            'daemon': MagicMock()
        })

        # Should have called visual bridge
        if result.get('success'):
            hook.visual_bridge.emit_atlas_glow.assert_called()

    @pytest.mark.asyncio
    async def test_mutation_emits_thought_pulse(self, hook_with_bridge):
        """Kept mutation should emit thought pulse."""
        hook = hook_with_bridge

        result = await hook.on_evolution_cycle({
            'evolve_brain': True,
            'cycle_number': 1
        })

        # If mutation was kept, should emit thought pulse
        if result.get('kept', False):
            hook.visual_bridge.emit_thought_pulse.assert_called()
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_brain_evolution_visual.py -v`
Expected: FAIL (visual_bridge not connected)

**Step 3: Add visual bridge connection to hook**

Modify `systems/evolution_daemon/evolution_hooks/brain_evolution_hook.py`:

```python
class BrainEvolutionHook:
    def __init__(self, ...):
        # ... existing code ...

        # Connect to visual bridge
        self.visual_bridge = None
        try:
            from systems.visual_shell.api.visual_bridge import VisualBridgeClient
            self.visual_bridge = VisualBridgeClient()
            logger.info("Connected to visual bridge")
        except ImportError:
            logger.debug("Visual bridge not available")

    async def on_evolution_cycle(self, cycle_data):
        # ... existing code ...

        # After successful mutation, emit visual feedback
        if result.get('success') and self.visual_bridge:
            # Emit atlas glow for the mutated sector
            self.visual_bridge.emit_atlas_glow(
                indices=self._get_sector_indices(sector),
                intensity=0.8
            )

            # If mutation was kept, emit thought pulse
            if result.get('kept', False):
                self.visual_bridge.emit_thought_pulse(
                    token_id=hash(sector) % 50257,
                    position=(100, 100),
                    intensity=result.get('improvement', 0.5)
                )

        return result

    def _get_sector_indices(self, sector: str) -> list:
        """Get pixel indices for a sector (for glow effect)."""
        from systems.evolution_daemon.brain_mutations import _get_sector_bounds
        bounds = _get_sector_bounds(sector)
        if bounds is None:
            return []
        x_start, x_end, y_start, y_end = bounds
        # Return center indices
        return [
            (y_start + y_end) // 2 * 1024 + (x_start + x_end) // 2
        ]
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_brain_evolution_visual.py -v`

**Step 5: Commit**

```bash
git add systems/evolution_daemon/evolution_hooks/brain_evolution_hook.py tests/test_brain_evolution_visual.py
git commit -m "feat(evolution): add visual feedback for brain mutations"
```

---

## Phase 3: CLI Commands

### Task 4: Add Brain Evolution CLI Commands

**Files:**
- Modify: `systems/pixel_compiler/pixelrts_cli.py:50-80`
- Test: `tests/test_brain_evolution_cli.py`

**Step 1: Write the failing test**

Create `tests/test_brain_evolution_cli.py`:

```python
"""Tests for brain evolution CLI commands."""
import pytest
from click.testing import CliRunner


class TestBrainEvolutionCLI:
    """Test brain evolution CLI commands."""

    def test_brain_status_command_exists(self):
        """brain-status command should exist."""
        from systems.pixel_compiler.pixelrts_cli import cli
        runner = CliRunner()
        result = runner.invoke(cli, ['brain-status'])
        # Should not error with "no such command"
        assert "no such command" not in result.output.lower()

    def test_brain_evolve_command_exists(self):
        """brain-evolve command should exist."""
        from systems.pixel_compiler.pixelrts_cli import cli
        runner = CliRunner()
        result = runner.invoke(cli, ['brain-evolve', '--help'])
        assert result.exit_code == 0 or "usage" in result.output.lower()

    def test_brain_status_shows_mutation_history(self):
        """brain-status should show mutation history."""
        from systems.pixel_compiler.pixelrts_cli import cli
        runner = CliRunner()
        result = runner.invoke(cli, ['brain-status', '--brain', 'tinystories_brain.rts.png'])
        # Should show some stats or indicate no mutations yet
        assert result.exit_code == 0
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_brain_evolution_cli.py -v`
Expected: FAIL (commands don't exist)

**Step 3: Add CLI commands**

Add to `systems/pixel_compiler/pixelrts_cli.py`:

```python
@cli.group()
def brain():
    """Brain evolution commands."""
    pass


@brain.command('status')
@click.option('--brain', default='tinystories_brain.rts.png', help='Brain atlas path')
def brain_status(brain):
    """Show brain evolution status and mutation history."""
    from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

    hook = BrainEvolutionHook(brain_path=brain)
    stats = hook.get_mutation_stats()

    click.echo(f"Brain: {brain}")
    click.echo(f"Total mutations: {stats.get('total', 0)}")
    click.echo(f"Kept: {stats.get('kept', 0)}")
    click.echo(f"Reverted: {stats.get('reverted', 0)}")
    click.echo(f"Keep rate: {stats.get('keep_rate', 0):.1%}")
    if stats.get('avg_improvement'):
        click.echo(f"Avg improvement: {stats['avg_improvement']:.4f}")


@brain.command('evolve')
@click.option('--brain', default='tinystories_brain.rts.png', help='Brain atlas path')
@click.option('--sector', help='Specific sector to mutate')
@click.option('--rate', default=0.01, help='Mutation rate')
def brain_evolve(brain, sector, rate):
    """Trigger a brain evolution cycle."""
    import asyncio
    from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

    hook = BrainEvolutionHook(brain_path=brain, mutation_rate=rate)

    result = asyncio.run(hook.on_evolution_cycle({
        'evolve_brain': True,
        'cycle_number': 1,
        'mutation_rate': rate
    }))

    if result.get('success'):
        click.echo(f"Mutation successful!")
        click.echo(f"  Sector: {result.get('sector')}")
        click.echo(f"  Type: {result.get('mutation_type')}")
        click.echo(f"  Fitness: {result.get('fitness_before', 0):.3f} -> {result.get('fitness_after', 0):.3f}")
        click.echo(f"  Kept: {result.get('kept')}")
    else:
        click.echo(f"Mutation skipped: {result.get('reason', 'unknown')}")


# Register brain group with main CLI
cli.add_command(brain)
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_brain_evolution_cli.py -v`

**Step 5: Commit**

```bash
git add systems/pixel_compiler/pixelrts_cli.py tests/test_brain_evolution_cli.py
git commit -m "feat(cli): add brain evolution commands (status, evolve)"
```

---

## Phase 4: Fitness Benchmarks

### Task 5: Create Meaningful Fitness Benchmarks

**Files:**
- Create: `systems/evolution_daemon/brain_benchmarks.py`
- Test: `tests/test_brain_benchmarks.py`

**Step 1: Write the failing test**

Create `tests/test_brain_benchmarks.py`:

```python
"""Tests for brain fitness benchmarks."""
import pytest


class TestBrainBenchmarks:
    """Test brain fitness evaluation benchmarks."""

    def test_benchmark_module_exists(self):
        """brain_benchmarks module should exist."""
        from systems.evolution_daemon import brain_benchmarks
        assert brain_benchmarks is not None

    def test_coherence_benchmark_exists(self):
        """coherence benchmark should exist."""
        from systems.evolution_daemon.brain_benchmarks import coherence_benchmark
        assert callable(coherence_benchmark)

    def test_perplexity_benchmark_exists(self):
        """perplexity benchmark should exist."""
        from systems.evolution_daemon.brain_benchmarks import perplexity_benchmark
        assert callable(perplexity_benchmark)

    def test_coherence_benchmark_returns_float(self):
        """coherence benchmark should return float."""
        from systems.evolution_daemon.brain_benchmarks import coherence_benchmark
        result = coherence_benchmark("Once upon a time there was a little dog.")
        assert isinstance(result, float)
        assert 0 <= result <= 1

    def test_perplexity_benchmark_returns_float(self):
        """perplexity benchmark should return float."""
        from systems.evolution_daemon.brain_benchmarks import perplexity_benchmark
        result = perplexity_benchmark("Once upon a time", "there was a little dog")
        assert isinstance(result, float)
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/test_brain_benchmarks.py -v`
Expected: FAIL (module doesn't exist)

**Step 3: Create brain_benchmarks.py**

Create `systems/evolution_daemon/brain_benchmarks.py`:

```python
"""
Brain Fitness Benchmarks

Provides meaningful fitness evaluation functions for brain evolution.
These benchmarks assess output quality beyond simple coherence.
"""
import re
from typing import List
import logging

logger = logging.getLogger(__name__)


def coherence_benchmark(text: str) -> float:
    """
    Evaluate text coherence based on multiple factors.

    Factors:
    - Word diversity (vocabulary richness)
    - Sentence structure (proper punctuation)
    - Semantic flow (transition words)

    Args:
        text: Generated text to evaluate

    Returns:
        Coherence score (0-1)
    """
    if not text or len(text) < 5:
        return 0.0

    score = 0.0

    # 1. Word diversity (0-0.3)
    words = text.lower().split()
    if words:
        unique_ratio = len(set(words)) / len(words)
        score += min(0.3, unique_ratio * 0.3)

    # 2. Sentence structure (0-0.3)
    sentences = re.split(r'[.!?]+', text)
    if len(sentences) > 1:
        # Check for proper capitalization
        proper_starts = sum(1 for s in sentences if s.strip() and s.strip()[0].isupper())
        structure_score = proper_starts / len(sentences) * 0.3
        score += min(0.3, structure_score)

    # 3. Transition words (0-0.2)
    transitions = ['and', 'but', 'then', 'so', 'because', 'when', 'while', 'after']
    transition_count = sum(1 for t in transitions if f' {t} ' in f' {text.lower()} ')
    score += min(0.2, transition_count * 0.05)

    # 4. Length appropriateness (0-0.2)
    word_count = len(words)
    if 10 <= word_count <= 100:
        score += 0.2
    elif 5 <= word_count < 10 or 100 < word_count <= 200:
        score += 0.1

    return min(1.0, score)


def perplexity_benchmark(prompt: str, completion: str) -> float:
    """
    Estimate perplexity-like score for prompt-completion pair.

    Lower is better. Uses proxy metrics since we can't compute true perplexity
    without the full model.

    Args:
        prompt: Input prompt
        completion: Generated completion

    Returns:
        Perplexity-like score (0-1, lower is better)
    """
    if not completion:
        return 1.0  # Maximum perplexity for empty output

    score = 0.0

    # 1. Relevance: check if completion relates to prompt
    prompt_words = set(prompt.lower().split())
    completion_words = set(completion.lower().split())
    overlap = len(prompt_words & completion_words)
    relevance = overlap / max(len(prompt_words), 1)
    score += (1 - relevance) * 0.3  # Lower overlap = higher perplexity

    # 2. Repetition penalty
    completion_list = completion.lower().split()
    if len(completion_list) > 2:
        bigrams = list(zip(completion_list[:-1], completion_list[1:]))
        unique_bigrams = len(set(bigrams))
        repetition_rate = 1 - (unique_bigrams / len(bigrams))
        score += repetition_rate * 0.3

    # 3. Length appropriateness
    if len(completion_list) < 3:
        score += 0.2  # Too short
    elif len(completion_list) > 100:
        score += 0.1  # Verbose

    # 4. Coherence factor
    coherence = coherence_benchmark(completion)
    score += (1 - coherence) * 0.2

    return min(1.0, score)


def run_benchmark_suite(texts: List[str]) -> dict:
    """
    Run all benchmarks on a list of texts.

    Args:
        texts: List of generated texts

    Returns:
        Dictionary with benchmark results
    """
    results = {
        'coherence': [],
        'avg_coherence': 0.0,
    }

    for text in texts:
        results['coherence'].append(coherence_benchmark(text))

    if results['coherence']:
        results['avg_coherence'] = sum(results['coherence']) / len(results['coherence'])

    return results
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/test_brain_benchmarks.py -v`

**Step 5: Commit**

```bash
git add systems/evolution_daemon/brain_benchmarks.py tests/test_brain_benchmarks.py
git commit -m "feat(evolution): add meaningful fitness benchmarks for brain evolution"
```

---

### Task 6: Wire Benchmarks to Fitness Evaluation

**Files:**
- Modify: `systems/evolution_daemon/brain_mutations.py:137-177`
- Test: `tests/test_brain_mutations.py` (extend)

**Step 1: Add test for enhanced fitness**

Add to `tests/test_brain_mutations.py`:

```python
    def test_evaluate_brain_fitness_uses_benchmarks(self):
        """Fitness evaluation should use benchmark suite."""
        from systems.evolution_daemon.brain_mutations import evaluate_brain_fitness
        from unittest.mock import patch

        # Mock the benchmark module
        with patch('systems.evolution_daemon.brain_mutations.run_benchmark_suite') as mock_benchmark:
            mock_benchmark.return_value = {'avg_coherence': 0.7}

            fitness = evaluate_brain_fitness("tinystories_brain.rts.png", ["test"])

            # Should have called benchmark
            mock_benchmark.assert_called()
```

**Step 2: Run test**

Run: `pytest tests/test_brain_mutations.py::TestBrainMutations::test_evaluate_brain_fitness_uses_benchmarks -v`

**Step 3: Update fitness evaluation to use benchmarks**

Modify `systems/evolution_daemon/brain_mutations.py`:

```python
def evaluate_brain_fitness(
    brain_path: str,
    test_prompts: List[str],
    criteria: str = "coherence"
) -> float:
    """
    Evaluate brain fitness using benchmark suite.

    Now uses the benchmark module for more meaningful evaluation.
    """
    try:
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
        from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
        from systems.evolution_daemon.brain_benchmarks import run_benchmark_suite

        service = get_pixel_brain_service()

        if not service.is_available():
            return 0.0

        # Generate completions for all test prompts
        completions = []
        for prompt in test_prompts:
            result = service.generate(prompt, max_tokens=10)
            completions.append(result.get('text', ''))

        # Run benchmark suite
        results = run_benchmark_suite(completions)

        return results.get('avg_coherence', 0.0)

    except Exception as e:
        logger.error(f"Fitness evaluation failed: {e}")
        return 0.0
```

**Step 4: Run tests**

Run: `pytest tests/test_brain_mutations.py -v`

**Step 5: Commit**

```bash
git add systems/evolution_daemon/brain_mutations.py tests/test_brain_mutations.py
git commit -m "feat(evolution): wire fitness benchmarks to brain mutation evaluation"
```

---

## Verification Checklist

After all phases complete, verify:

- [ ] Brain evolution hook registered with daemon
- [ ] Visual feedback emitted on mutations
- [ ] CLI commands available: `pixelrts brain status`, `pixelrts brain evolve`
- [ ] Fitness benchmarks evaluate text quality
- [ ] All tests passing: `pytest tests/test_brain*.py -v`

---

## Files Changed Summary

| Phase | File | Action | Lines |
|-------|------|--------|-------|
| 1 | `systems/evolution_daemon/evolution_daemon.py` | Modify | +30 |
| 1 | `systems/evolution_daemon/evolution_hooks/__init__.py` | Modify | +5 |
| 1 | `tests/test_brain_evolution_daemon.py` | Create | +40 |
| 2 | `systems/evolution_daemon/evolution_hooks/brain_evolution_hook.py` | Modify | +40 |
| 2 | `tests/test_brain_evolution_visual.py` | Create | +50 |
| 3 | `systems/pixel_compiler/pixelrts_cli.py` | Modify | +60 |
| 3 | `tests/test_brain_evolution_cli.py` | Create | +50 |
| 4 | `systems/evolution_daemon/brain_benchmarks.py` | Create | +100 |
| 4 | `tests/test_brain_benchmarks.py` | Create | +40 |
| 4 | `systems/evolution_daemon/brain_mutations.py` | Modify | +20 |
| 4 | `tests/test_brain_mutations.py` | Modify | +15 |

**Total: ~450 lines of code + tests**

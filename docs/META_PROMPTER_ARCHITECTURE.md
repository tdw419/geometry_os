# Self-Optimizing Meta-Prompter Architecture

> The brain that prompts the brain, evolving with every success.

## Overview

The Meta-Prompter is a self-improving system that:
1. **Observes** conversation history
2. **Thinks** using PixelBrain (visible on desktop)
3. **Prompts** the main Claude session
4. **Learns** from outcomes via Evolution Daemon

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         GEOMETRY OS DESKTOP                             │
│                                                                         │
│   💠 THOUGHT_PULSE glyphs appear during meta-cognition                  │
│   🌟 ATLAS_GLOW shows which brain weights are being accessed            │
│   📊 ATTENTION heatmaps visualize reasoning patterns                    │
│                                                                         │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │  tinystories_brain.rts.png (Hilbert-folded weight atlas)        │  │
│   │  ┌─────────┬─────────┬─────────┬─────────┬─────────┐           │  │
│   │  │ EMBED   │ L0 ATT  │ L1 ATT  │ L0 FFN  │ LM_HEAD │           │  │
│   │  │ 🌟      │ 🌟      │         │         │         │           │  │
│   │  └─────────┴─────────┴─────────┴─────────┴─────────┘           │  │
│   └─────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                         HOOK EVENT FLOW                                 │
│                                                                         │
│   ┌──────────┐     ┌───────────────────────┐     ┌──────────────────┐  │
│   │  Stop    │────▶│ meta-prompter-        │────▶│ PixelBrain       │  │
│   │  Event   │     │ pixelbrain.py         │     │ .generate()      │  │
│   └──────────┘     │                       │     │                  │  │
│                    │ • Read history        │     │ EMBED → ATTEND   │  │
│   ┌──────────┐     │ • Spawn PixelBrain    │     │ → PROJECT →      │  │
│   │Notification│───▶│ • Generate prompt     │────▶│   SAMPLE         │  │
│   │(idle)    │     │ • Track for evolution │     │                  │  │
│   └──────────┘     └───────────────────────┘     └──────────────────┘  │
│                              │                            │             │
│                              ▼                            ▼             │
│                    ┌──────────────────┐         ┌──────────────────┐   │
│                    │ Save prompt state│         │ THOUGHT_PULSE    │   │
│                    │ for tracking     │         │ emissions        │   │
│                    └──────────────────┘         └──────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                         OUTCOME TRACKING                                │
│                                                                         │
│   ┌──────────────┐     ┌───────────────────────┐                       │
│   │PostToolUse   │────▶│ track-tool-outcome.py │                       │
│   │ (success)    │     │                       │                       │
│   └──────────────┘     │ • Load prompt state   │                       │
│                        │ • Record success +1   │                       │
│   ┌──────────────┐     │ • Notify evolution    │                       │
│   │PostToolUse   │────▶│   hook                │                       │
│   │Failure       │     │ • Record failure +1   │                       │
│   └──────────────┘     └───────────────────────┘                       │
│                                    │                                    │
│                                    ▼                                    │
│                    ┌───────────────────────────────┐                    │
│                    │ meta_prompter_tracking.json   │                    │
│                    │                               │                    │
│                    │ • prompt: "..."               │                    │
│                    │ • successes: 3                │                    │
│                    │ • failures: 1                 │                    │
│                    │ • final_status: "success"     │                    │
│                    └───────────────────────────────┘                    │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                         EVOLUTION FEEDBACK                              │
│                                                                         │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │  MetaPrompterEvolutionHook                                       │  │
│   │                                                                   │  │
│   │  • Collects N outcomes (batch_size=10)                          │  │
│   │  • Calculates success_rate                                       │  │
│   │  • Determines mutation strategy:                                 │  │
│   │                                                                   │  │
│   │    success_rate > 0.7: Small reinforcement mutation              │  │
│   │      → sector: attention_layer_0, rate: 0.1, type: gaussian     │  │
│   │                                                                   │  │
│   │    success_rate < 0.3: Large exploratory mutation                │  │
│   │      → sector: ffn_layer_0, rate: 0.1, type: uniform            │  │
│   │                                                                   │  │
│   │    0.3 <= rate <= 0.7: Moderate exploration                      │  │
│   │      → sector: attention_layer_1, rate: 0.05, type: gaussian    │  │
│   │                                                                   │  │
│   └─────────────────────────────────────────────────────────────────┘  │
│                                    │                                    │
│                                    ▼                                    │
│   ┌─────────────────────────────────────────────────────────────────┐  │
│   │  BrainEvolutionHook                                              │  │
│   │                                                                   │  │
│   │  • Applies mutation to tinystories_brain.rts.png                │  │
│   │  • Evaluates fitness (coherence test)                           │  │
│   │  • Keeps if improved, reverts if regressed                      │  │
│   │  • Records mutation history                                      │  │
│   │                                                                   │  │
│   └─────────────────────────────────────────────────────────────────┘  │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

## File Structure

```
.claude/
├── settings.json                    # Hook configuration
└── hooks/
    ├── meta-prompter-pixelbrain.py  # Main meta-cognition hook
    ├── track-tool-outcome.py        # Outcome tracking hook
    ├── meta-prompter.sh             # Bash fallback (CLI-based)
    └── test-hook.sh                 # Test runner

systems/evolution_daemon/
├── brain_mutations.py               # Weight/shader mutations
└── evolution_hooks/
    ├── brain_evolution_hook.py      # General brain evolution
    └── meta_prompter_evolution_hook.py  # Meta-prompter specific

.geometry/
├── meta_prompter_state.json         # Current prompt tracking
└── meta_prompter_tracking.json      # Historical outcomes
```

## Hook Configuration

```json
{
  "hooks": {
    "Stop": [{"matcher": "", "hooks": [".claude/hooks/meta-prompter-pixelbrain.py"]}],
    "Notification": [
      {"matcher": "idle_prompt", "hooks": [".claude/hooks/meta-prompter-pixelbrain.py"]},
      {"matcher": "permission_prompt", "hooks": [".claude/hooks/meta-prompter-pixelbrain.py"]}
    ],
    "PostToolUse": [{"matcher": "", "hooks": [".claude/hooks/track-tool-outcome.py"]}],
    "PostToolUseFailure": [{"matcher": "", "hooks": [".claude/hooks/track-tool-outcome.py"]}]
  }
}
```

## Evolution Strategy

The brain evolves based on meta-prompter performance:

| Success Rate | Strategy | Sector | Rate |
|-------------|----------|--------|------|
| > 70% | Reinforce | attention_layer_0 | 0.1 (gaussian) |
| < 30% | Explore | ffn_layer_0 | 0.1 (uniform) |
| 30-70% | Moderate | attention_layer_1 | 0.05 (gaussian) |

## Testing

```bash
# Test meta-prompter hook
echo '{"hook_event_name":"Stop","session_id":"test"}' | \
  .claude/hooks/meta-prompter-pixelbrain.py

# Test outcome tracking
echo '{"hook_event_name":"PostToolUse","tool_name":"Bash"}' | \
  .claude/hooks/track-tool-outcome.py

# View logs
tail -f .claude/hooks/meta-prompter-pixelbrain.log
tail -f .claude/hooks/tool_outcomes.log

# View tracking data
cat .geometry/meta_prompter_tracking.json | jq .
```

## Key Benefits

1. **Visible Cognition** - THOUGHT_PULSE glyphs show meta-analysis in real-time
2. **Self-Improving** - Brain evolves based on actual outcomes
3. **Hardware Native** - GPU inference keeps CPU free for main session
4. **Graceful Fallback** - Falls back to CLI if PixelBrain unavailable
5. **Observable** - All tracking data is human-readable JSON

---

*Part of Geometry OS - The Screen is the Brain*

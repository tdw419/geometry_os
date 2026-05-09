# Recursive Self-Improvement Evaluator Template

## System Observation Summary
(Auto-filled by Evaluator script reading .autodev/metrics_history.jsonl)

- **Velocity:** [X] commits/hr, [Y] phases/hr
- **Health:** [Z]% build success rate
- **Performance Trends:** [A] ops/s in core VM, [B]% change from baseline

## bottleneck_analysis
(The LLM identifies the tightest constraint in the development loop)

1. **Current Constraint:** (e.g., "Phase completion is slowed by manual preflight checks")
2. **Evidence:** (e.g., "Metrics show build health is 100% but roadmap completion is flat for 3 hours")

## improvement_proposal
(Actionable changes to the system's own meta-data)

- **Target:** (e.g., `AI_GUIDE.md`, `.autodev/preflight.sh`, `prompts/drafter.txt`)
- **Action:** (e.g., "Simplify the preflight check for documentation-only changes")
- **Hypothesis:** "This will increase phase throughput by 20% by reducing wait times on low-risk edits."

## validation_strategy
- **Method:** Canary (Run 5 cycles with change)
- **KPI:** Phase completion count
- **Success Condition:** >Baseline velocity with no health regressions

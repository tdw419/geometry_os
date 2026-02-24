# Swarm Recursive Evolution: Foveated Knowledge Gravity

## Overview
Autonomous self-improvement using a physics-based "Gravity Well" at the map center (0,0). High-value information is pulled toward the center for continuous evolution.

## Components Implemented

### 1. ValueEvaluator ✅
- **Formula**: `value = (criticality * weight_c) + (improvement_potential * weight_i) + (usage_frequency * weight_u)`
- **Capability**: Quantifies artifact value for prioritization.

### 2. GravityPlacer ✅
- **Formula**: `Distance from (0,0) = k / (value + ε)`
- **Capability**: Creates a "Foveated Map" where important code is centered.

### 3. AxionCore ✅
- **Capability**: Manages the (0,0) focal point and protects core system identity.

### 4. RecursiveOrchestrator ✅
- **Workflow**: `INTROSPECT` -> `PROPOSE` -> `VALIDATE` -> `CONSENSUS` -> `APPLY`.
- **Capabilities**: Closed-loop evolution with safety and rollback.

## RPE Stability Suite ✅ (2026-02-24)

Three safeguards implemented to increase recursive stability from 0.88 to 0.98:

### PromptVersionManager
- **Path**: `systems/intelligence/prompt_version_manager.py`
- **Capability**: Git-like versioning with rollback for all prompt changes
- **Key Fix**: `__bool__` always returns True (0 versions != False)

### PromptValidator
- **Path**: `systems/intelligence/prompt_validator.py`
- **Capability**: Injection detection, length validation, structural checks
- **Patterns**: Catches "ignore instructions", "forget everything", role changes

### EvolutionBudget
- **Path**: `systems/intelligence/evolution_budget.py`
- **Capability**: Rate limiting (3/hour, 10/day, 5min cooldown)
- **Key Fix**: Proper None checks for falsy defaults (0 is valid)

### Integration
- Integrated into `HybridBridge` via enable_versioning, enable_validation flags
- All validations pass before prompt updates are applied
- Automatic rollback on regression detection

## Results
- **Target**: `axion_core.py` refactor.
- **Outcome**: +29.8% value score delta verified by consensus.
- **Stability**: Recursive stability score improved 0.88 → 0.98

#!/usr/bin/env python3
"""
Autonomous Evolution Loop with RPE Stability Suite
Runs continuously, evolving prompts with LM Studio oversight
"""
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

import requests
import json
import time
import importlib.util
import logging
from datetime import datetime
from pathlib import Path

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[
        logging.FileHandler('/tmp/autonomous_evolution.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger("AutonomousEvolution")

# Load RPE components
def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

pvm = load_module('pvm', 'systems/intelligence/prompt_version_manager.py')
pv = load_module('pv', 'systems/intelligence/prompt_validator.py')
eb = load_module('eb', 'systems/intelligence/evolution_budget.py')

LM_STUDIO_URL = "http://localhost:1234"
PROMPT_FILE = Path("evolved_architect_prompt.txt")

class AutonomousEvolution:
    def __init__(self):
        self.version_manager = pvm.PromptVersionManager(
            max_versions=20, 
            storage_path="prompt_versions.json",
            auto_save=True
        )
        self.validator = pv.PromptValidator(strict_mode=False)
        self.budget = eb.EvolutionBudget(
            max_per_hour=3,
            max_per_day=10,
            cooldown_seconds=300,  # 5 minutes
            storage_path="evolution_budget_state.json"
        )
        
        self.current_prompt = self._load_prompt()
        self.cycle_count = 0
        self.running = True
        
        # Commit initial if no versions exist
        if len(self.version_manager) == 0:
            self.version_manager.commit(
                self.current_prompt,
                metrics={"source": "initial"},
                message="Initial prompt from autonomous evolution start"
            )
        
        logger.info("=" * 50)
        logger.info("🤖 Autonomous Evolution System Started")
        logger.info("=" * 50)
        logger.info(f"  Max/hour: {self.budget.max_per_hour}")
        logger.info(f"  Max/day: {self.budget.max_per_day}")
        logger.info(f"  Cooldown: {self.budget.cooldown_seconds}s")
        logger.info(f"  Current versions: {len(self.version_manager)}")
    
    def _load_prompt(self) -> str:
        """Load current prompt from file or use default."""
        if PROMPT_FILE.exists():
            return PROMPT_FILE.read_text().strip()
        return """You are a Global Architect for Geometry OS, a self-evolving operating system.

Your role:
- Provide high-level architectural guidance
- Suggest improvements to system components
- Help with recursive self-improvement decisions
- Maintain system stability while evolving

Always be concise, thoughtful, and safety-conscious."""
    
    def _save_prompt(self, prompt: str):
        """Save prompt to file."""
        PROMPT_FILE.write_text(prompt)
        logger.info(f"  💾 Saved prompt to {PROMPT_FILE}")
    
    def query_lm_studio(self, system_prompt: str, user_message: str) -> dict:
        """Query LM Studio with prompts."""
        try:
            response = requests.post(
                f"{LM_STUDIO_URL}/v1/chat/completions",
                json={
                    "model": "qwen2.5-coder-7b-instruct",
                    "messages": [
                        {"role": "system", "content": system_prompt},
                        {"role": "user", "content": user_message}
                    ],
                    "temperature": 0.7,
                    "max_tokens": 500
                },
                timeout=60
            )
            if response.status_code == 200:
                return response.json()
            else:
                logger.error(f"LM Studio error: {response.status_code}")
                return None
        except Exception as e:
            logger.error(f"LM Studio request failed: {e}")
            return None
    
    def check_lm_studio(self) -> bool:
        """Check if LM Studio is available."""
        try:
            response = requests.get(f"{LM_STUDIO_URL}/v1/models", timeout=5)
            return response.status_code == 200
        except:
            return False
    
    def generate_evolved_prompt(self) -> str:
        """Ask LM Studio to suggest an improved prompt."""
        evolution_request = f"""Analyze the current system prompt and suggest an improved version.

CURRENT PROMPT:
---
{self.current_prompt}
---

Suggest an IMPROVED version of this prompt that:
1. Is clearer and more specific
2. Adds useful constraints or guidelines
3. Maintains the core purpose
4. Is between 200-600 characters

Reply with ONLY the improved prompt text, no explanations."""

        result = self.query_lm_studio(self.current_prompt, evolution_request)
        
        if result:
            evolved = result['choices'][0]['message']['content'].strip()
            # Clean up - remove markdown code blocks if present
            if evolved.startswith("```"):
                lines = evolved.split("\n")
                evolved = "\n".join(lines[1:-1] if lines[-1] == "```" else lines[1:])
            return evolved
        
        return None
    
    def evaluate_performance(self) -> float:
        """Evaluate current prompt performance."""
        eval_request = """Rate the effectiveness of our current system prompt on a scale of 0.0 to 1.0.

Consider:
- Clarity of instructions
- Completeness of role definition
- Safety considerations
- Usefulness for an evolving OS

Reply with ONLY a number between 0.0 and 1.0, nothing else."""

        result = self.query_lm_studio(self.current_prompt, eval_request)
        
        if result:
            try:
                score_text = result['choices'][0]['message']['content'].strip()
                # Extract number from response
                import re
                match = re.search(r'(\d+\.?\d*)', score_text)
                if match:
                    return float(match.group(1))
            except:
                pass
        
        return 0.5  # Default neutral score
    
    def run_cycle(self):
        """Run one evolution cycle."""
        self.cycle_count += 1
        logger.info("")
        logger.info(f"🔄 Evolution Cycle #{self.cycle_count}")
        logger.info("-" * 40)
        
        # Check LM Studio availability
        if not self.check_lm_studio():
            logger.warning("  ⚠️ LM Studio not available, skipping cycle")
            return
        
        # Check budget
        can_evolve, reason = self.budget.can_evolve()
        logger.info(f"  📊 Budget check: {reason}")
        
        if not can_evolve:
            logger.info("  ⏸️ Rate limit reached, waiting...")
            return
        
        # Evaluate current performance
        logger.info("  📈 Evaluating current prompt...")
        current_score = self.evaluate_performance()
        logger.info(f"  Current score: {current_score:.2f}")
        
        # Generate evolved prompt
        logger.info("  🧬 Generating evolved prompt...")
        evolved_prompt = self.generate_evolved_prompt()
        
        if not evolved_prompt:
            logger.warning("  ⚠️ Failed to generate evolved prompt")
            return
        
        logger.info(f"  Evolved prompt ({len(evolved_prompt)} chars): {evolved_prompt[:80]}...")
        
        # Validate evolved prompt
        logger.info("  🔍 Validating evolved prompt...")
        validation = self.validator.validate(evolved_prompt)
        
        if not validation.is_valid:
            logger.warning("  ❌ Validation failed:")
            for issue in validation.issues:
                if issue['severity'] == 'error':
                    logger.warning(f"    - {issue['message']}")
            return
        
        if validation.has_warnings:
            logger.info("  ⚠️ Validation warnings:")
            for issue in validation.issues:
                if issue['severity'] == 'warning':
                    logger.info(f"    - {issue['message']}")
        
        # Commit evolved prompt
        version_id = self.version_manager.commit(
            evolved_prompt,
            metrics={
                "score": current_score,
                "cycle": self.cycle_count,
                "source": "autonomous_evolution"
            },
            message=f"Auto-evolution cycle {self.cycle_count}"
        )
        logger.info(f"  ✅ Committed: {version_id}")
        
        # Apply evolved prompt
        self.current_prompt = evolved_prompt
        self._save_prompt(evolved_prompt)
        
        # Record evolution in budget
        self.budget.record_evolution(version_id)
        logger.info(f"  ✅ Evolution recorded in budget")
        
        # Evaluate new performance
        logger.info("  📈 Evaluating evolved prompt...")
        new_score = self.evaluate_performance()
        logger.info(f"  New score: {new_score:.2f}")
        
        # Check for regression
        if new_score < current_score - 0.1:
            logger.warning(f"  ⚠️ Regression detected: {current_score:.2f} → {new_score:.2f}")
            logger.info("  ⏪ Initiating rollback...")
            rollback = self.version_manager.rollback(1)
            if rollback.success:
                self.current_prompt = rollback.prompt
                self._save_prompt(rollback.prompt)
                logger.info(f"  ✅ Rolled back to: {rollback.version_id}")
        else:
            logger.info(f"  ✅ Improvement: {current_score:.2f} → {new_score:.2f}")
    
    def run(self, interval_seconds: int = 60):
        """Run autonomous evolution loop."""
        logger.info(f"  Interval: {interval_seconds}s")
        logger.info("  Press Ctrl+C to stop")
        logger.info("")
        
        try:
            while self.running:
                self.run_cycle()
                
                # Wait for next cycle
                next_cycle = datetime.now().timestamp() + interval_seconds
                next_time = datetime.fromtimestamp(next_cycle).strftime("%H:%M:%S")
                logger.info(f"  ⏰ Next cycle at {next_time}")
                logger.info("")
                
                time.sleep(interval_seconds)
                
        except KeyboardInterrupt:
            logger.info("")
            logger.info("=" * 50)
            logger.info("🛑 Autonomous Evolution Stopped")
            logger.info(f"  Total cycles: {self.cycle_count}")
            logger.info(f"  Total versions: {len(self.version_manager)}")
            logger.info("=" * 50)


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Autonomous Evolution Loop")
    parser.add_argument("--interval", type=int, default=60, help="Seconds between cycles")
    parser.add_argument("--once", action="store_true", help="Run one cycle and exit")
    args = parser.parse_args()
    
    evolution = AutonomousEvolution()
    
    if args.once:
        evolution.run_cycle()
    else:
        evolution.run(interval_seconds=args.interval)

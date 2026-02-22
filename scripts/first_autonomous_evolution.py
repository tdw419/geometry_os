#!/usr/bin/env python3
"""
First Autonomous Evolution Run

This script executes the first real self-modification of Geometry OS.
The AI will add 'notification_badge' as a RELAXED criticality type
to its VisualVerificationService.

Usage:
    PYTHONPATH=. python scripts/first_autonomous_evolution.py
"""

import asyncio
import logging
import sys
from pathlib import Path
from datetime import datetime

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.evolution_daemon.evolution_daemon import (
    EvolutionDaemon,
    EvolutionTask
)
from systems.evolution_daemon.visual_verification_service import (
    VisualIntent,
    CriticalityLevel
)
from systems.evolution_daemon.stages.master_stage import (
    MasterStage,
    CapabilityType,
    VisualCapabilityProposal
)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler('first_evolution.log')
    ]
)
logger = logging.getLogger("first_evolution")


async def main():
    """Execute the first autonomous evolution run."""
    logger.info("=" * 60)
    logger.info("FIRST AUTONOMOUS EVOLUTION RUN")
    logger.info(f"Started: {datetime.now().isoformat()}")
    logger.info("=" * 60)

    # Create the evolution daemon (mock mode for safety)
    logger.info("Phase 0: Initializing EvolutionDaemon...")
    daemon = EvolutionDaemon()

    # Define the capability upgrade goal
    goal = "Add notification_badge as RELAXED criticality type"

    # Create the visual intent for verification
    visual_intent = VisualIntent(
        element_type="notification_badge",
        position=(100, 100),
        size=(24, 24),
        critical=False,
        properties={
            "text": "3",
            "type": "badge"
        }
    )

    # Create the evolution task
    task = EvolutionTask(
        task_id="first-evolution-001",
        goal=goal,
        target_file="systems/evolution_daemon/visual_verification_service.py",
        visual_intent=visual_intent,
        priority=10  # Master Stage priority
    )

    logger.info(f"Task created: {task.task_id}")
    logger.info(f"Goal: {goal}")

    # Execute the evolution
    logger.info("Starting safe_evolve pipeline...")
    logger.info("Expected phases: ORIGINATE -> SANDBOX -> MIRROR_VALIDATE -> GUARDIAN -> TIER -> COMMIT -> VISUAL_VERIFY -> MONITOR -> RECOVER")

    try:
        success = await daemon.safe_evolve(task)

        if success:
            logger.info("EVOLUTION SUCCESSFUL")
            logger.info(f"Result: {task.result}")

            # Verify the change was applied
            from systems.evolution_daemon.visual_verification_service import CriticalityClassifier
            classifier = CriticalityClassifier()

            # Check if notification_badge is now recognized
            test_intent = VisualIntent(
                element_type="notification_badge",
                position=(0, 0),
                size=(24, 24)
            )
            criticality = classifier.classify(test_intent)
            logger.info(f"Verification: notification_badge classified as {criticality}")

            if criticality == CriticalityLevel.RELAXED:
                logger.info("VERIFICATION PASSED: notification_badge is RELAXED")
            else:
                logger.warning(f"VERIFICATION WARNING: Expected RELAXED, got {criticality}")
        else:
            logger.error("EVOLUTION FAILED")
            logger.error(f"Failure reason: {task.result}")

    except Exception as e:
        logger.error(f"EVOLUTION ERROR: {e}")
        import traceback
        traceback.print_exc()

    logger.info("=" * 60)
    logger.info("EVOLUTION COMPLETE")
    logger.info(f"Ended: {datetime.now().isoformat()}")
    logger.info("=" * 60)


if __name__ == "__main__":
    asyncio.run(main())

#!/usr/bin/env python3
"""
Geometry OS Task Execution CLI (Non-Interactive Mode)

Execute pending tasks from the roadmap to build Geometry OS.
This version runs automatically without prompting for confirmation.
"""

import asyncio
import sys
from pathlib import Path

# Add src to path
sys.path.insert(0, str(Path(__file__).parent / "src"))

from src.ai_project_management.orchestrator import AIProjectManagerOrchestrator, OrchestratorConfig
from src.ai_project_management.geometry_executor import execute_pending_tasks
from src.ai_project_management.roadmap import parse_roadmap_file


async def main():
    """Execute pending tasks."""
    repo_root = Path("/home/jericho/zion/projects/geometry_os/geometry_os")

    # Load config
    config_path = repo_root / ".ai-pm-config.yaml"
    if config_path.exists():
        config = OrchestratorConfig.from_file(config_path)
    else:
        config = OrchestratorConfig()

    # Parse roadmap
    roadmap_path = repo_root / "UNIFIED_ROADMAP_2026.md"
    if not roadmap_path.exists():
        print(f"Error: Roadmap not found: {roadmap_path}")
        sys.exit(1)

    print(f"Loading roadmap: {roadmap_path}")
    roadmap = parse_roadmap_file(roadmap_path)

    # Collect all pending tasks
    pending_tasks = []
    for phase in roadmap.phases:
        for feature in phase.features:
            for task in feature.tasks:
                if task.status.value == "pending":
                    pending_tasks.append(task)

    print(f"\nFound {len(pending_tasks)} pending tasks")
    print(f"Roadmap: {roadmap.metadata.title}")
    print(f"Phases: {len(roadmap.phases)}")
    print(f"Features: {sum(len(p.features) for p in roadmap.phases)}")

    if not pending_tasks:
        print("\n✅ No pending tasks - roadmap is complete!")
        return

    # Show top pending tasks
    print("\nTop pending tasks:")
    for i, task in enumerate(pending_tasks[:10], 1):
        print(f"{i}. [{task.priority.value}] {task.title}")
        if task.description:
            print(f"   {task.description[:80]}...")

    # Auto-confirm execution (non-interactive mode)
    print(f"\n🔨 Executing up to 5 tasks automatically...")

    # Execute tasks
    results = await execute_pending_tasks(repo_root, pending_tasks, max_tasks=5)

    # Show results
    print(f"\n📊 Results:")
    for i, result in enumerate(results, 1):
        status = "✅" if result.success else "❌"
        print(f"{status} Task {i}: {result.output[:100]}")
        if result.error:
            print(f"   Error: {result.error[:100]}")


if __name__ == "__main__":
    asyncio.run(main())

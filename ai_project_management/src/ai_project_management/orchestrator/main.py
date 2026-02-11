"""
Main AI Project Management Orchestrator

Integrates all modules for autonomous, recursive project management.
Coordinates roadmap processing, OpenSpec generation, task execution,
iteration, and continuous improvement.
"""

import asyncio
import signal
from pathlib import Path
from typing import Optional, List, Dict, Any, Callable
from datetime import datetime
from dataclasses import dataclass, field
import structlog
import yaml

from ..models import (
    Roadmap,
    OpenSpecChange,
    ExecutionState,
    TaskStatus,
    TelemetryEvent,
    MCPTaskRequest,
    MCPAgentType,
    AutocompletePolicy,
    TaskItem,
    Feature,
    Phase,
    PriorityLevel,
    PhaseStatus,
)
from ..geometry_executor import GeometryOSTaskExecutor, ExecutionResult
from ..execution_state import (
    TaskExecutionTracker,
    ExecutionOutcome,
    execute_with_tracking,
)
from ..safety import SafetyManager, execute_with_safety, SafetyCheckResult
from ..roadmap import RoadmapParser, parse_roadmap_file
from ..openspec import OpenSpecGenerator
from ..mcp import MCPExecutor, MCPServerConfig, MCPAgentConfig
from ..iteration import IterationEngine, IterationMode
from ..improvement import ContinuousImprovementModule, ImprovementRecommendation
from ..questioning import QuestionHandler, QuestionStrategy
from ..llm_autocomplete import LLMResolver, AutocompleteModuleConfig
from ..research.agents import ResearchTeamCoordinator


@dataclass
class OrchestratorConfig:
    """Configuration for the AI PM Orchestrator."""
    # Roadmap configuration
    roadmap_path: Path = Path("roadmap.md")
    openspec_output_dir: Path = Path("openspec/changes")
    discover_roadmap: bool = False  # Enable auto-discovery of roadmap files
    roadmap_search_depth: int = 3  # Max depth for roadmap discovery

    # Iteration configuration
    iteration_mode: IterationMode = IterationMode.UNTIL_COMPLETE
    max_iterations: int = 10
    convergence_threshold: float = 0.95
    state_file: Path = Path(".ai-pm-state.json")

    # MCP configuration
    mcp_enabled: bool = True
    mcp_workers: int = 4
    mcp_servers: List[MCPServerConfig] = field(default_factory=list)

    # Improvement configuration
    improvement_enabled: bool = True
    recursive_self_improvement: bool = True  # Generate new tasks from recommendations
    recursive_improvement_min_confidence: float = 0.7
    recursive_improvement_min_priority: PriorityLevel = PriorityLevel.MEDIUM
    telemetry_path: Path = Path(".ai-pm-telemetry")
    knowledge_base_path: Path = Path(".ai-pm-knowledge")
    research_path: Path = Path(".ai-pm-research")

    # Question configuration
    questioning_enabled: bool = True
    question_db: Path = Path(".ai-pm-questions.db")
    question_strategy: QuestionStrategy = QuestionStrategy.DEFERRED

    # LLM Autocomplete configuration
    llm_autocomplete_enabled: bool = True
    llm_autocomplete_bridge: str = "auto"  # auto, lm_studio, zai
    llm_autocomplete_policy: AutocompletePolicy = AutocompletePolicy.MANUAL_REVIEW
    llm_autocomplete_confidence: float = 0.7
    llm_autocomplete_lm_studio_url: str = "http://localhost:1234"
    llm_autocomplete_zai_model: str = "GLM-4.7"

    # Logging
    log_level: str = "INFO"

    # Task execution configuration
    auto_execute: bool = True
    max_tasks_per_cycle: int = 5
    repo_root: Path = Path(".")
    execution_state_file: Path = Path(".ai-pm-execution-state.json")
    execution_history_dir: Path = Path(".ai-pm-execution-history")

    # Safety configuration
    protected_branches: List[str] = field(default_factory=lambda: ["main", "master"])
    max_tasks_per_hour: int = 20
    max_consecutive_failures: int = 3
    cooldown_seconds: int = 300
    auto_rollback: bool = True
    require_clean_workspace: bool = False

    # Research configuration
    research_enabled: bool = True
    research_interval_seconds: int = 3600
    research_codebase_path: Path = field(default_factory=lambda: Path("/home/jericho/projects/geometry_os/geometry_os/"))
    research_conversations_path: Path = field(default_factory=lambda: Path("/home/jericho/.claude/projects/"))
    research_logs_path: Path = field(default_factory=lambda: Path("/home/jericho/.lmstudio/server-logs/"))
    research_output_file: Path = field(default_factory=lambda: Path(".ai-pm-research-findings.json"))
    research_max_tasks_per_cycle: int = 50
    research_min_priority: str = "MEDIUM"

    @classmethod
    def from_file(cls, config_path: Path) -> "OrchestratorConfig":
        """Load configuration from YAML file."""
        if not config_path.exists():
            return cls()

        with open(config_path) as f:
            data = yaml.safe_load(f)

        # Resolve paths relative to config file directory
        # Support both old roadmap_path and new roadmap.primary_path
        roadmap_config = data.get("roadmap", {})
        if roadmap_config and "primary_path" in roadmap_config:
            roadmap_path = Path(roadmap_config.get("primary_path", "roadmap.md"))
        else:
            roadmap_path = Path(data.get("roadmap_path", "roadmap.md"))
        if not roadmap_path.is_absolute():
            roadmap_path = config_path.parent / roadmap_path

        repo_root_raw = data.get("execution", {}).get("repo_root", ".")
        repo_root = Path(repo_root_raw)
        if not repo_root.is_absolute():
            repo_root = config_path.parent / repo_root
            repo_root = repo_root.resolve()

        # Convert to config
        config = cls(
            roadmap_path=roadmap_path,
            openspec_output_dir=Path(data.get("openspec_output_dir", "openspec/changes")),
            discover_roadmap=roadmap_config.get("discovery_enabled", data.get("discover_roadmap", False)),
            roadmap_search_depth=data.get("roadmap_search_depth", 3),
            iteration_mode=IterationMode(data.get("iteration_mode", "until_complete")),
            max_iterations=data.get("max_iterations", 10),
            convergence_threshold=data.get("convergence_threshold", 0.95),
            state_file=Path(data.get("state_file", ".ai-pm-state.json")),
            mcp_enabled=data.get("mcp", {}).get("enabled", True),
            mcp_workers=data.get("mcp", {}).get("workers", 4),
            improvement_enabled=data.get("improvement", {}).get("enabled", True),
            recursive_self_improvement=data.get("improvement", {}).get("recursive_self_improvement", True),
            recursive_improvement_min_confidence=data.get("improvement", {}).get("recursive_improvement_min_confidence", 0.7),
            recursive_improvement_min_priority=PriorityLevel(data.get("improvement", {}).get("recursive_improvement_min_priority", "MEDIUM")),
            telemetry_path=Path(data.get("improvement", {}).get("telemetry_path", ".ai-pm-telemetry")),
            knowledge_base_path=Path(data.get("improvement", {}).get("knowledge_base_path", ".ai-pm-knowledge")),
            # Research path can be specified in either improvement or questioning section
            research_path=Path(
                data.get("questioning", {}).get("research_path") or
                data.get("improvement", {}).get("research_path", ".ai-pm-research")
            ),
            questioning_enabled=data.get("questioning", {}).get("enabled", True),
            question_db=Path(data.get("questioning", {}).get("question_db", ".ai-pm-questions.db")),
            llm_autocomplete_enabled=data.get("llm_autocomplete", {}).get("enabled", True),
            llm_autocomplete_bridge=data.get("llm_autocomplete", {}).get("bridge_type", "auto"),
            llm_autocomplete_policy=AutocompletePolicy(data.get("llm_autocomplete", {}).get("policy", "manual_review")),
            llm_autocomplete_confidence=data.get("llm_autocomplete", {}).get("confidence_threshold", 0.7),
            llm_autocomplete_lm_studio_url=data.get("llm_autocomplete", {}).get("lm_studio_url", "http://localhost:1234"),
            llm_autocomplete_zai_model=data.get("llm_autocomplete", {}).get("zai_model", "GLM-4.7"),
            log_level=data.get("log_level", "INFO"),
            auto_execute=data.get("execution", {}).get("auto_execute", True),
            max_tasks_per_cycle=data.get("execution", {}).get("max_tasks_per_cycle", 5),
            repo_root=repo_root,
            execution_state_file=Path(data.get("execution", {}).get("state_file", ".ai-pm-execution-state.json")),
            execution_history_dir=Path(data.get("execution", {}).get("history_dir", ".ai-pm-execution-history")),
            protected_branches=data.get("safety", {}).get("protected_branches", ["main", "master"]),
            max_tasks_per_hour=data.get("safety", {}).get("max_tasks_per_hour", 20),
            max_consecutive_failures=data.get("safety", {}).get("max_consecutive_failures", 3),
            cooldown_seconds=data.get("safety", {}).get("cooldown_seconds", 300),
            auto_rollback=data.get("safety", {}).get("auto_rollback", True),
            require_clean_workspace=data.get("safety", {}).get("require_clean_workspace", False),
        )

        # Load research configuration
        research_config = data.get("research", {})
        config_path_str = str(config_path.parent)

        # Resolve research paths
        codebase_path = Path(research_config.get("codebase", {}).get("path", "/home/jericho/projects/geometry_os/geometry_os/"))
        conversations_path = Path(research_config.get("conversations", {}).get("path", "/home/jericho/.claude/projects/"))
        logs_path = Path(research_config.get("logs", {}).get("path", "/home/jericho/.lmstudio/server-logs/"))

        if not codebase_path.is_absolute():
            codebase_path = config_path.parent / codebase_path
        if not conversations_path.is_absolute():
            conversations_path = Path(conversations_path)  # Keep absolute paths for home dir
        if not logs_path.is_absolute():
            logs_path = Path(logs_path)  # Keep absolute paths for home dir

        # Update research config
        config.research_enabled = research_config.get("enabled", True)
        config.research_interval_seconds = research_config.get("interval_seconds", 3600)
        config.research_codebase_path = codebase_path
        config.research_conversations_path = conversations_path
        config.research_logs_path = logs_path
        config.research_output_file = Path(research_config.get("output_file", ".ai-pm-research-findings.json"))
        config.research_max_tasks_per_cycle = research_config.get("max_tasks_per_cycle", 50)
        config.research_min_priority = research_config.get("min_priority", "MEDIUM")

        return config


class AIProjectManagerOrchestrator:
    """
    Main orchestrator for AI-driven project management.

    Coordinates all modules:
    - Roadmap parsing
    - OpenSpec generation
    - MCP task execution
    - Recursive iteration
    - Continuous improvement
    - LLM questioning
    """

    def __init__(
        self,
        config: Optional[OrchestratorConfig] = None,
    ):
        """
        Initialize the orchestrator.

        Args:
            config: Orchestrator configuration
        """
        self.config = config or OrchestratorConfig()

        # Setup logging
        structlog.configure(
            wrapper_class=structlog.make_filtering_bound_logger(self.config.log_level.lower()),
        )
        self.logger = structlog.get_logger()

        # Initialize modules
        self.parser = RoadmapParser()
        self.generator = OpenSpecGenerator(
            output_base_dir=self.config.openspec_output_dir,
        )
        self.mcp_executor: Optional[MCPExecutor] = None
        self.iteration_engine = IterationEngine(
            mode=self.config.iteration_mode,
            max_iterations=self.config.max_iterations,
            convergence_threshold=self.config.convergence_threshold,
            state_file=self.config.state_file,
            telemetry_callback=self._handle_telemetry,
        )
        self.improvement_module = ContinuousImprovementModule(
            telemetry_path=self.config.telemetry_path,
            knowledge_base_path=self.config.knowledge_base_path,
            research_path=self.config.research_path,
            telemetry_callback=self._handle_telemetry,
        )

        # Initialize LLM resolver if enabled
        self.llm_resolver: Optional[LLMResolver] = None
        if self.config.llm_autocomplete_enabled:
            autocomplete_config = AutocompleteModuleConfig(
                enabled=self.config.llm_autocomplete_enabled,
                bridge_type=self.config.llm_autocomplete_bridge,
                policy=self.config.llm_autocomplete_policy,
                confidence_threshold=self.config.llm_autocomplete_confidence,
                lm_studio_url=self.config.llm_autocomplete_lm_studio_url,
                zai_model=self.config.llm_autocomplete_zai_model,
                knowledge_base_path=self.config.knowledge_base_path,
                research_path=self.config.research_path,
            )
            self.llm_resolver = LLMResolver(autocomplete_config)
            self.logger.info("LLM autocomplete enabled", bridge=self.config.llm_autocomplete_bridge)

        self.question_handler = QuestionHandler(
            question_db=self.config.question_db,
            knowledge_base_path=self.config.knowledge_base_path,
            strategy=self.config.question_strategy,
            llm_resolver=self.llm_resolver,
            autocomplete_policy=self.config.llm_autocomplete_policy,
            research_path=self.config.research_path,
            telemetry_callback=self._handle_telemetry,
        )

        # Initialize Geometry OS task executor
        self.task_executor = GeometryOSTaskExecutor(
            repo_root=self.config.repo_root,
            log_level=self.config.log_level
        )

        # Initialize task execution tracker
        self.execution_tracker = TaskExecutionTracker(
            state_file=self.config.execution_state_file,
            history_dir=self.config.execution_history_dir,
        )
        self.logger.info("Task execution tracker initialized")

        # Initialize safety manager
        self.safety_manager = SafetyManager(
            repo_root=self.config.repo_root,
            protected_branches=self.config.protected_branches,
            max_tasks_per_hour=self.config.max_tasks_per_hour,
            max_consecutive_failures=self.config.max_consecutive_failures,
            cooldown_seconds=self.config.cooldown_seconds,
            auto_rollback=self.config.auto_rollback,
            require_clean_workspace=self.config.require_clean_workspace,
        )
        self.logger.info("Safety manager initialized")

        # Initialize research coordinator
        self.research_coordinator: Optional[ResearchTeamCoordinator] = None
        if self.config.research_enabled:
            self.research_coordinator = ResearchTeamCoordinator(
                codebase_root=self.config.research_codebase_path,
                conversations_root=self.config.research_conversations_path,
                logs_root=self.config.research_logs_path,
                output_file=self.config.research_output_file,
            )
            self.logger.info("Research coordinator initialized", research_enabled=True)
        else:
            self.logger.info("Research coordinator disabled")

        # Execution state
        self.execution_state = ExecutionState()
        self.current_roadmap: Optional[Roadmap] = None
        self.current_changes: List[OpenSpecChange] = []
        self.telemetry_events: List[TelemetryEvent] = []

        # Control flags
        self._running = False
        self._shutdown_event = asyncio.Event()

    async def initialize(self) -> None:
        """Initialize the orchestrator and all modules."""
        self.logger.info("Initializing AI Project Manager Orchestrator")

        # Initialize MCP executor if enabled
        if self.config.mcp_enabled:
            self.mcp_executor = MCPExecutor(
                servers=self.config.mcp_servers,
                agents=self._get_default_agents(),
                telemetry_callback=self._handle_telemetry,
            )
            await self.mcp_executor.start(self.config.mcp_workers)

        # Load previous state if available
        await self.iteration_engine.load_state()

        self.logger.info("Orchestrator initialized")

    async def shutdown(self) -> None:
        """Shutdown the orchestrator gracefully."""
        self.logger.info("Shutting down orchestrator")

        self._running = False
        self._shutdown_event.set()

        # Stop MCP executor
        if self.mcp_executor:
            await self.mcp_executor.stop()

        # Save state
        await self.iteration_engine.save_state()

        self.logger.info("Orchestrator shutdown complete")

    async def process_roadmap(
        self,
        roadmap_path: Optional[Path] = None,
    ) -> Roadmap:
        """
        Process a roadmap file.

        Args:
            roadmap_path: Path to roadmap file (uses config default if None)

        Returns:
            Parsed roadmap model
        """
        path = roadmap_path or self.config.roadmap_path

        self.logger.info("Processing roadmap", path=str(path))

        # Parse roadmap
        self.current_roadmap = self.parser.parse_file(path)

        # Generate OpenSpec changes
        self.current_changes = await self._generate_openspec_from_roadmap(self.current_roadmap)

        self.logger.info(
            "Roadmap processed",
            phases=len(self.current_roadmap.phases),
            changes=len(self.current_changes),
        )

        return self.current_roadmap

    async def execute_until_completion(self) -> ExecutionState:
        """
        Execute tasks until completion or convergence.

        Returns:
            Final execution state
        """
        if not self.current_changes:
            raise RuntimeError("No changes to execute. Process a roadmap first.")

        self.logger.info("Starting execution until completion")
        self._running = True

        # Collect all tasks
        all_tasks = []
        for change in self.current_changes:
            all_tasks.extend(change.tasks)

        # Setup iteration callbacks
        def check_complete() -> bool:
            return all(t.status == TaskStatus.COMPLETED for t in all_tasks)

        async def execute_iteration(iteration: int) -> Dict[str, Any]:
            return await self._execute_iteration(iteration, all_tasks)

        # Run iteration engine
        await self.iteration_engine.run(execute_iteration, check_complete)

        # Run final improvement cycle
        if self.config.improvement_enabled:
            recommendations = await self.improvement_module.run_improvement_cycle(
                self.execution_state
            )
            self.logger.info("Improvement recommendations", count=len(recommendations))

            # Create new tasks from high-confidence recommendations
            if self.config.recursive_self_improvement and recommendations:
                tasks_created = await self._create_self_improvement_tasks(
                    recommendations,
                    min_confidence=self.config.recursive_improvement_min_confidence,
                    min_priority=self.config.recursive_improvement_min_priority
                )
                if tasks_created > 0:
                    self.logger.info(
                        "Created self-improvement tasks",
                        count=tasks_created
                    )

        return self.execution_state

    async def run_daemon(
        self,
        interval_seconds: int = 60,
    ) -> None:
        """
        Run the orchestrator as a continuous daemon.

        Args:
            interval_seconds: Interval between daemon cycles
        """
        self.logger.info("Starting daemon mode", interval=interval_seconds)

        self._running = True

        # Setup signal handlers
        loop = asyncio.get_running_loop()
        for sig in (signal.SIGINT, signal.SIGTERM):
            loop.add_signal_handler(sig, lambda: asyncio.create_task(self.shutdown()))

        while self._running:
            try:
                # Process roadmap if loaded
                if self.current_roadmap:
                    # Execute pending tasks (NEW: autonomous execution)
                    if self.config.auto_execute:
                        execution_result = await self._execute_roadmap_tasks(
                            max_tasks=self.config.max_tasks_per_cycle
                        )
                        if execution_result.get("executed", 0) > 0:
                            self.logger.info(
                                "Daemon: Executed roadmap tasks",
                                count=execution_result["executed"],
                                results=execution_result.get("results", [])[:3]  # Log first 3
                            )

                    # Check for pending work (legacy MCP execution)
                    pending_phases = self.current_roadmap.get_pending_phases()

                    if pending_phases:
                        self.logger.info("Daemon: Processing pending phases", count=len(pending_phases))

                        # Process and execute via MCP (for complex tasks)
                        await self._execute_pending_work()

                # Run improvement cycle
                if self.config.improvement_enabled:
                    recommendations = await self.improvement_module.run_improvement_cycle(
                        self.execution_state
                    )

                    # Create new tasks from high-confidence recommendations
                    # This enables recursive self-improvement
                    if self.config.recursive_self_improvement and recommendations:
                        tasks_created = await self._create_self_improvement_tasks(
                            recommendations,
                            min_confidence=self.config.recursive_improvement_min_confidence,
                            min_priority=self.config.recursive_improvement_min_priority
                        )
                        if tasks_created > 0:
                            self.logger.info(
                                "Daemon: Created self-improvement tasks",
                                count=tasks_created
                            )

                # Auto-resolve questions
                if self.config.questioning_enabled:
                    resolved = await self.question_handler.auto_resolve_questions()
                    if resolved > 0:
                        self.logger.info("Daemon: Auto-resolved questions", count=resolved)

                # Run research cycle (less frequently than main daemon cycle)
                if self.research_coordinator and self.config.research_enabled:
                    # Only run research every N cycles (based on interval)
                    # research_interval_seconds / interval_seconds = number of daemon cycles between research
                    cycles_between_research = max(1, self.config.research_interval_seconds // interval_seconds)

                    if not hasattr(self, '_daemon_cycle_count'):
                        self._daemon_cycle_count = 0

                    self._daemon_cycle_count += 1

                    if self._daemon_cycle_count >= cycles_between_research:
                        self._daemon_cycle_count = 0  # Reset counter

                        self.logger.info("Daemon: Starting research cycle")

                        try:
                            research_tasks = await self.research_coordinator.run_research_cycle()

                            # Filter by minimum priority
                            priority_order = {"CRITICAL": 0, "HIGH": 1, "MEDIUM": 2, "LOW": 3}
                            min_priority_level = priority_order.get(self.config.research_min_priority, 2)

                            filtered_tasks = [
                                t for t in research_tasks
                                if priority_order.get(t.get("priority", "LOW"), 99) <= min_priority_level
                            ][:self.config.research_max_tasks_per_cycle]

                            if filtered_tasks:
                                # Add tasks to roadmap
                                tasks_added = await self._add_research_tasks_to_roadmap(filtered_tasks)

                                self.logger.info(
                                    "Daemon: Research cycle complete",
                                    total_found=len(research_tasks),
                                    filtered=len(filtered_tasks),
                                    added=tasks_added
                                )
                            else:
                                self.logger.info("Daemon: Research cycle complete", no_tasks=True)

                        except Exception as e:
                            self.logger.error("Daemon: Research cycle failed", error=str(e))

                # Wait for next cycle or shutdown
                try:
                    await asyncio.wait_for(
                        self._shutdown_event.wait(),
                        timeout=interval_seconds,
                    )
                    break
                except asyncio.TimeoutError:
                    continue

            except Exception as e:
                self.logger.error("Daemon error", error=str(e))
                await asyncio.sleep(5)  # Brief pause before retry

        self.logger.info("Daemon stopped")

    async def _execute_roadmap_tasks(
        self,
        max_tasks: int = None,
    ) -> Dict[str, Any]:
        """
        Execute pending roadmap tasks directly with tracking.

        Args:
            max_tasks: Maximum number of tasks to execute (uses config default if None)

        Returns:
            Execution results summary
        """
        if not self.current_roadmap:
            return {"executed": 0, "results": [], "error": "No roadmap loaded"}

        max_tasks = max_tasks or self.config.max_tasks_per_cycle

        # Collect pending tasks from all phases
        pending_tasks = []
        for phase in self.current_roadmap.phases:
            for feature in phase.features:
                for task in feature.tasks:
                    if task.status == TaskStatus.PENDING:
                        pending_tasks.append(task)

        if not pending_tasks:
            return {"executed": 0, "results": []}

        # Filter tasks based on execution patterns
        filtered_tasks = []
        for task in pending_tasks[:max_tasks]:
            should_skip, reason = self.execution_tracker.should_skip_task(task)
            if should_skip:
                self.logger.info("Skipping task", task_id=task.id, reason=reason)
                continue
            filtered_tasks.append(task)

        tasks_to_execute = filtered_tasks[:max_tasks]

        self.logger.info(
            "Executing roadmap tasks",
            total_pending=len(pending_tasks),
            filtered=len(filtered_tasks),
            executing=len(tasks_to_execute)
        )

        # Execute tasks with tracking and safety
        results = []
        for task in tasks_to_execute:
            try:
                # Quick rate limit check
                can_execute, skip_reason = self.safety_manager.can_execute_task(task)
                if not can_execute:
                    self.logger.info("Skipping task (rate limit)", task_id=task.id, reason=skip_reason)
                    results.append({
                        "task_id": task.id,
                        "title": task.title,
                        "success": False,
                        "skipped": True,
                        "error": skip_reason,
                    })
                    continue

                # Execute with safety and tracking
                result = await execute_with_safety(
                    safety_manager=self.safety_manager,
                    task=task,
                    execute_func=lambda t: execute_with_tracking(
                        tracker=self.execution_tracker,
                        task=t,
                        execute_func=self.task_executor.execute_task,
                    ),
                    create_rollback=True,
                )

                results.append({
                    "task_id": task.id,
                    "title": task.title,
                    "success": result.success,
                    "output": result.output[:200] if result.output else None,
                    "error": result.error[:200] if result.error else None,
                })

                # Update task status
                if result.success:
                    task.status = TaskStatus.COMPLETED
                    task.completed = True
                    self.execution_state.completed_tasks.append(task.id)
                    self.logger.info("Task completed", task_id=task.id, title=task.title)
                elif result.error and "fatal" in result.error.lower():
                    task.status = TaskStatus.FAILED
                    self.execution_state.failed_tasks.append(task.id)
                    self.logger.warning("Task failed", task_id=task.id, error=result.error)
                else:
                    # Non-fatal errors mark as in_progress
                    task.status = TaskStatus.IN_PROGRESS

                # Emit telemetry
                self._handle_telemetry(TelemetryEvent(
                    event_type="task_execution",
                    source="orchestrator",
                    data={
                        "task_id": task.id,
                        "success": result.success,
                        "execution_time": result.execution_time,
                    }
                ))

            except Exception as e:
                self.logger.error("Task execution error", task_id=task.id, error=str(e))
                # Record the failure (already done by execute_with_safety)
                results.append({
                    "task_id": task.id,
                    "title": task.title,
                    "success": False,
                    "error": str(e),
                })
                task.status = TaskStatus.FAILED
                self.execution_state.failed_tasks.append(task.id)

                results.append({
                    "task_id": task.id,
                    "title": task.title,
                    "success": False,
                    "error": str(e),
                })
                task.status = TaskStatus.FAILED
                self.execution_state.failed_tasks.append(task.id)

        return {
            "executed": len(results),
            "results": results,
        }

    async def _execute_pending_work(self) -> None:
        """Execute pending work from the roadmap."""
        # Get pending phases
        pending = self.current_roadmap.get_pending_phases()

        for phase in pending:
            # Find corresponding change
            change = next(
                (c for c in self.current_changes if c.name == phase.name),
                None,
            )

            if change and change.tasks:
                # Execute tasks via MCP
                if self.mcp_executor:
                    for task in change.tasks:
                        if task.status == TaskStatus.PENDING:
                            await self._execute_task_via_mcp(task)

    async def _execute_iteration(
        self,
        iteration: int,
        tasks: List,
    ) -> Dict[str, Any]:
        """Execute a single iteration."""
        self.logger.info("Executing iteration", iteration=iteration)

        artifacts = {}
        completed_count = 0

        # Execute pending tasks
        for task in tasks:
            if task.status == TaskStatus.PENDING:
                if self.mcp_executor:
                    await self._execute_task_via_mcp(task)

                # Check if completed
                if task.status == TaskStatus.COMPLETED:
                    completed_count += 1

        # Generate telemetry
        metrics = await self.improvement_module.analyze_telemetry(self.telemetry_events)
        self.telemetry_events.clear()

        return {
            "artifacts": artifacts,
            "metrics": metrics,
        }

    async def _execute_task_via_mcp(self, task) -> None:
        """Execute a task via MCP."""
        if not self.mcp_executor:
            return

        request = MCPTaskRequest(
            task_id=task.id,
            agent_type=MCPAgentType.EXECUTOR,
            task_description=task.title,
            context={"description": task.description} if task.description else {},
        )

        try:
            task_id = await self.mcp_executor.submit_task(request)
            # In real implementation, would wait for result
            task.status = TaskStatus.IN_PROGRESS
        except Exception as e:
            self.logger.error("Task submission failed", task_id=task.id, error=str(e))
            task.status = TaskStatus.FAILED
            self.execution_state.failed_tasks.append(task.id)

    async def _generate_openspec_from_roadmap(self, roadmap: Roadmap) -> List[OpenSpecChange]:
        """Generate OpenSpec changes from roadmap."""
        changes = []

        for phase in roadmap.phases:
            # Detect ambiguities
            if self.config.questioning_enabled:
                detection = await self.question_handler.detect_ambiguities(
                    phase.description or "",
                    {"phase": phase.name},
                )

                if detection.questions:
                    await self.question_handler.queue_questions(
                        detection.questions,
                        related_change_id=phase.name,
                    )

            # Generate OpenSpec
            change = await self._generate_phase_change(phase, roadmap)
            if change:
                changes.append(change)

        return changes

    async def _generate_phase_change(
        self,
        phase,
        roadmap: Roadmap,
    ) -> Optional[OpenSpecChange]:
        """Generate an OpenSpec change for a phase."""
        try:
            changes = self.generator.generate_from_roadmap(
                roadmap,
                phases=[phase.name],
            )
            return changes[0] if changes else None
        except Exception as e:
            self.logger.error("Change generation failed", phase=phase.name, error=str(e))
            return None

    def _get_default_agents(self) -> List[MCPAgentConfig]:
        """Get default MCP agent configurations."""
        return [
            MCPAgentConfig(
                id="orchestrator",
                name="Orchestrator",
                type=MCPAgentType.ORCHESTRATOR,
                capabilities=["coordinate", "plan", "schedule"],
            ),
            MCPAgentConfig(
                id="executor",
                name="Executor",
                type=MCPAgentType.EXECUTOR,
                capabilities=["execute", "test", "build"],
            ),
            MCPAgentConfig(
                id="guardian",
                name="Guardian",
                type=MCPAgentType.GUARDIAN,
                capabilities=["validate", "security_check"],
            ),
        ]

    def _handle_telemetry(self, event: TelemetryEvent) -> None:
        """Handle telemetry events from modules."""
        self.telemetry_events.append(event)

        # Keep only recent events
        if len(self.telemetry_events) > 1000:
            self.telemetry_events = self.telemetry_events[-1000:]

    async def _create_self_improvement_tasks(
        self,
        recommendations: List[ImprovementRecommendation],
        min_confidence: float = 0.7,
        min_priority: PriorityLevel = PriorityLevel.MEDIUM,
    ) -> int:
        """
        Convert improvement recommendations into new roadmap tasks.

        This enables recursive self-improvement: the system generates its own
        improvement tasks based on performance analysis and neuromodulation state.

        Args:
            recommendations: List of improvement recommendations
            min_confidence: Minimum confidence threshold for creating tasks
            min_priority: Minimum priority level for creating tasks

        Returns:
            Number of tasks created
        """
        if not self.current_roadmap:
            self.logger.warning("No roadmap loaded, cannot create improvement tasks")
            return 0

        # Filter recommendations by confidence
        high_confidence = [
            r for r in recommendations
            if r.confidence >= min_confidence
        ]

        if not high_confidence:
            self.logger.debug("No high-confidence recommendations to convert to tasks")
            return 0

        # Find or create self-improvement phase
        improvement_phase = next(
            (p for p in self.current_roadmap.phases if "self-improvement" in p.name.lower()),
            None
        )

        if not improvement_phase:
            # Create new self-improvement phase
            improvement_phase = Phase(
                name=f"Self-Improvement Cycle {datetime.now().strftime('%Y%m%d-%H%M%S')}",
                description=f"Automatically generated improvement tasks based on neuromodulation state",
                status=PhaseStatus.IN_PROGRESS,
                priority=PriorityLevel.HIGH,
                order=len(self.current_roadmap.phases) + 1,
                metadata={
                    "generated_by": "continuous_improvement_daemon",
                    "neuromodulation": self.improvement_module.get_modulation_state().model_dump(),
                }
            )
            self.current_roadmap.phases.append(improvement_phase)
            self.logger.info("Created self-improvement phase", phase=improvement_phase.name)

        # Find or create feature for this cycle
        feature_name = f"Improvement Cycle {self.execution_state.iteration_state.iteration_number}"
        feature = next(
            (f for f in improvement_phase.features if f.name == feature_name),
            None
        )

        if not feature:
            feature = Feature(
                name=feature_name,
                description=f"Improvements generated at {datetime.now().isoformat()}",
                priority=PriorityLevel.HIGH,
                metadata={"generated_by": "continuous_improvement_daemon"}
            )
            improvement_phase.features.append(feature)

        # Get existing recommendation IDs to prevent duplicates
        existing_rec_ids = set()
        for task in feature.tasks:
            if task.metadata and "recommendation_id" in task.metadata:
                existing_rec_ids.add(task.metadata["recommendation_id"])

        tasks_created = 0
        for rec in high_confidence:
            # Check for duplicates
            if rec.id in existing_rec_ids:
                continue

            # Map priority string to enum
            priority_map = {
                "HIGH": PriorityLevel.HIGH,
                "MEDIUM": PriorityLevel.MEDIUM,
                "LOW": PriorityLevel.LOW,
            }
            priority = priority_map.get(rec.priority, PriorityLevel.MEDIUM)

            # Skip if below minimum priority
            if priority < min_priority:
                continue

            # Create task
            task = TaskItem(
                title=f"[AI-Generated] {rec.description}",
                description=f"{rec.description}\n\nGenerated by AI PM continuous improvement.\nType: {rec.type}\nEstimated Impact: {rec.estimated_impact:.2f}\nConfidence: {rec.confidence:.2f}",
                priority=priority,
                metadata={
                    "generated_by": "continuous_improvement_daemon",
                    "recommendation_id": rec.id,
                    "recommendation_type": rec.type,
                    "estimated_impact": rec.estimated_impact,
                    "confidence": rec.confidence,
                    "neuromodulation_state": self.improvement_module.get_modulation_state().model_dump(),
                }
            )

            feature.tasks.append(task)
            tasks_created += 1
            existing_rec_ids.add(rec.id)

        if tasks_created > 0:
            self.logger.info(
                "Created self-improvement tasks",
                count=tasks_created,
                phase=improvement_phase.name,
                feature=feature.name
            )

        return tasks_created

    async def _add_research_tasks_to_roadmap(
        self,
        research_tasks: List[Dict[str, Any]]
    ) -> int:
        """
        Add research-discovered tasks to the roadmap.

        Args:
            research_tasks: List of task dictionaries from research agents

        Returns:
            Number of tasks added
        """
        if not self.current_roadmap:
            self.logger.warning("No roadmap loaded, cannot add research tasks")
            return 0

        if not research_tasks:
            return 0

        # Find or create research-generated phase
        research_phase = next(
            (p for p in self.current_roadmap.phases if "research" in p.name.lower()),
            None
        )

        if not research_phase:
            # Create new research phase
            research_phase = Phase(
                name=f"Research-Generated Tasks {datetime.now().strftime('%Y%m%d-%H%M%S')}",
                description="Tasks discovered by autonomous research agents analyzing codebase, conversations, and logs",
                status=PhaseStatus.IN_PROGRESS,
                priority=PriorityLevel.MEDIUM,
                order=len(self.current_roadmap.phases) + 1,
                metadata={
                    "generated_by": "research_agents",
                    "timestamp": datetime.now().isoformat(),
                }
            )
            self.current_roadmap.phases.append(research_phase)
            self.logger.info("Created research-generated phase", phase=research_phase.name)

        # Find or create feature for this batch
        feature_name = f"Research Batch {datetime.now().strftime('%Y%m%d-%H%M%S')}"
        feature = next(
            (f for f in research_phase.features if f.name == feature_name),
            None
        )

        if not feature:
            feature = Feature(
                name=feature_name,
                description=f"Research findings from {datetime.now().isoformat()}",
                priority=PriorityLevel.MEDIUM,
                metadata={"generated_by": "research_agents"}
            )
            research_phase.features.append(feature)

        # Track existing task signatures to prevent duplicates
        existing_signatures = set()
        for task in feature.tasks:
            # Create a simple signature from title
            signature = task.title.lower().strip()
            signature = ''.join(c for c in signature if c.isalnum())
            existing_signatures.add(signature)

        tasks_added = 0
        for task_data in research_tasks:
            title = task_data.get("title", "No title")
            description = task_data.get("description", "")
            priority_str = task_data.get("priority", "MEDIUM")
            metadata = task_data.get("metadata", {})

            # Create signature for deduplication
            signature = title.lower().strip()
            signature = ''.join(c for c in signature if c.isalnum())

            if signature in existing_signatures:
                continue

            # Map priority string to enum
            priority_map = {
                "CRITICAL": PriorityLevel.CRITICAL,
                "HIGH": PriorityLevel.HIGH,
                "MEDIUM": PriorityLevel.MEDIUM,
                "LOW": PriorityLevel.LOW,
            }
            priority = priority_map.get(priority_str, PriorityLevel.MEDIUM)

            # Create task
            task = TaskItem(
                title=title[:200],  # Limit title length
                description=f"{description}\n\nSource: {metadata.get('source', 'unknown')}\nLocation: {metadata.get('location', 'N/A')}",
                priority=priority,
                metadata={
                    "generated_by": "research_agents",
                    "research_timestamp": metadata.get("finding_timestamp", datetime.now().isoformat()),
                    "research_source": metadata.get("source", "unknown"),
                    "research_location": metadata.get("location", ""),
                    "research_evidence": metadata.get("evidence", ""),
                }
            )

            feature.tasks.append(task)
            tasks_added += 1
            existing_signatures.add(signature)

        if tasks_added > 0:
            self.logger.info(
                "Added research tasks to roadmap",
                count=tasks_added,
                phase=research_phase.name,
                feature=feature.name
            )

        return tasks_added

    def get_status(self) -> Dict[str, Any]:
        """Get current orchestrator status."""
        return {
            "running": self._running,
            "current_change_id": self.execution_state.current_change_id,
            "iteration": self.execution_state.iteration_state.iteration_number,
            "converged": self.execution_state.iteration_state.is_converged,
            "completed_tasks": len(self.execution_state.completed_tasks),
            "failed_tasks": len(self.execution_state.failed_tasks),
            "neuromodulation": self.improvement_module.get_modulation_state().model_dump(),
            "questions": self.question_handler.get_statistics(),
            "execution_tracker": self.execution_tracker.get_statistics(),
        }

    def get_execution_history(self, task_id: Optional[str] = None, limit: int = 50):
        """
        Get execution history.

        Args:
            task_id: Optional task ID to filter by. If None, returns all recent history.
            limit: Maximum number of records to return.

        Returns:
            List of execution records
        """
        if task_id:
            return self.execution_tracker.get_task_history(task_id)
        else:
            return self.execution_tracker.records[-limit:]

    def get_execution_report(self) -> Dict[str, Any]:
        """Generate execution report."""
        report = self.execution_tracker.generate_report()
        return report.to_dict()

    def get_task_patterns(self) -> Dict[str, Any]:
        """Get execution patterns for all task types."""
        return {
            task_type: {
                "total_executions": pattern.total_executions,
                "success_rate": pattern.success_rate,
                "avg_duration_seconds": pattern.avg_duration_seconds,
                "common_errors": pattern.common_errors,
            }
            for task_type, pattern in self.execution_tracker.task_patterns.items()
        }

    def get_retryable_tasks(self) -> List[str]:
        """Get list of task IDs that can be retried."""
        return self.execution_tracker.get_retryable_tasks()

    def cleanup_execution_history(self, max_age_days: int = 30) -> int:
        """
        Clean up old execution records.

        Args:
            max_age_days: Maximum age of records to keep

        Returns:
            Number of records removed
        """
        return self.execution_tracker.cleanup_old_records(max_age_days)


async def create_orchestrator(
    config_path: Optional[Path] = None,
) -> AIProjectManagerOrchestrator:
    """
    Convenience function to create and initialize an orchestrator.

    Args:
        config_path: Optional path to configuration file

    Returns:
        Initialized orchestrator
    """
    config = None
    if config_path:
        config = OrchestratorConfig.from_file(config_path)

    orchestrator = AIProjectManagerOrchestrator(config)
    await orchestrator.initialize()

    return orchestrator

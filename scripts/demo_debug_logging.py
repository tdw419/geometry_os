#!/usr/bin/env python3
"""
Debug Logging Verification Script

This script demonstrates the logging framework during a typical user session,
showing how critical operations are traceable.

Run with: python scripts/demo_debug_logging.py
"""

import os
import sys
import time
import random

# Add project root to path
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, PROJECT_ROOT)

from core.debug_logger import (
    DebugConfig,
    DebugLevel,
    DebugLogger,
    OperationCategory,
    configure_debug_logging,
    get_debug_logger,
    trace,
    traced,
)
from core.unified_logging import (
    UnifiedLogger,
    get_neural_cortex_logger,
    get_visual_shell_logger,
    get_evolution_logger,
    get_agent_swarm_logger,
    start_session,
    end_session,
    trace_neural_inference,
    trace_evolution_cycle,
)


def simulate_neural_inference(model_name: str, input_data: dict):
    """Simulate a neural inference operation."""
    logger = get_neural_cortex_logger()
    
    with trace_neural_inference(model_name, str(input_data.get("shape", "unknown"))) as t:
        logger.debug(f"Loading model: {model_name}", category=OperationCategory.NEURAL_INFERENCE)
        
        # Simulate processing time
        process_time = random.uniform(0.01, 0.05)
        time.sleep(process_time)
        
        # Simulate memory allocation
        with logger.trace("allocate_memory", OperationCategory.MEMORY_ALLOC):
            time.sleep(0.005)
        
        # Simulate computation
        with logger.trace("compute", OperationCategory.NEURAL_INFERENCE):
            time.sleep(process_time * 2)
        
        # Add result metadata
        t.metadata["output_tokens"] = random.randint(10, 100)
        t.metadata["confidence"] = random.uniform(0.8, 0.99)
        
        return {"result": "generated_text", "tokens": t.metadata["output_tokens"]}


def simulate_gpu_render(frame: int):
    """Simulate a GPU render operation."""
    logger = get_visual_shell_logger()
    
    with logger.trace(f"render_frame_{frame}", OperationCategory.GPU_RENDER) as t:
        logger.debug(f"Starting render for frame {frame}", category=OperationCategory.GPU_RENDER)
        
        # Simulate shader compilation (first frame only)
        if frame == 0:
            with logger.trace("compile_shaders", OperationCategory.GPU_SHADER):
                time.sleep(0.02)
        
        # Simulate buffer setup
        with logger.trace("setup_buffers", OperationCategory.GPU_MEMORY):
            time.sleep(0.005)
        
        # Simulate draw calls
        for i in range(3):
            with logger.trace(f"draw_call_{i}", OperationCategory.GPU_RENDER):
                time.sleep(0.003)
        
        t.metadata["triangles"] = random.randint(1000, 5000)
        t.metadata["fps"] = random.uniform(55, 65)
        
        return {"frame": frame, "triangles": t.metadata["triangles"]}


def simulate_evolution_cycle(generation: int, population_size: int):
    """Simulate an evolution cycle."""
    logger = get_evolution_logger()
    
    with trace_evolution_cycle(generation, population_size) as t:
        logger.info(f"Starting evolution generation {generation}", 
                    category=OperationCategory.EVOLUTION_CYCLE)
        
        # Selection phase
        with logger.trace("selection", OperationCategory.EVOLUTION_SELECT):
            time.sleep(0.01)
            selected = random.randint(population_size // 4, population_size // 2)
            logger.debug(f"Selected {selected} individuals", 
                        category=OperationCategory.EVOLUTION_SELECT)
        
        # Mutation phase
        with logger.trace("mutation", OperationCategory.EVOLUTION_MUTATE):
            time.sleep(0.015)
            mutations = random.randint(10, 30)
            logger.debug(f"Applied {mutations} mutations", 
                        category=OperationCategory.EVOLUTION_MUTATE)
        
        # Evaluation phase
        with logger.trace("evaluation", OperationCategory.EVOLUTION_CYCLE):
            time.sleep(0.02)
            best_fitness = random.uniform(0.5, 1.0)
            logger.info(f"Best fitness: {best_fitness:.3f}", 
                       category=OperationCategory.EVOLUTION_CYCLE)
        
        t.metadata["selected"] = selected
        t.metadata["mutations"] = mutations
        t.metadata["best_fitness"] = best_fitness
        
        return {"generation": generation, "best_fitness": best_fitness}


def simulate_agent_swarm(num_agents: int):
    """Simulate agent swarm operations."""
    logger = get_agent_swarm_logger()
    
    with logger.trace("swarm_coordination", OperationCategory.SWARM_COORD) as t:
        logger.info(f"Coordinating {num_agents} agents", category=OperationCategory.SWARM_COORD)
        
        spawned_agents = []
        
        # Spawn agents
        for i in range(num_agents):
            with logger.trace(f"spawn_agent_{i}", OperationCategory.AGENT_SPAWN):
                time.sleep(0.005)
                agent_type = random.choice(["explorer", "builder", "analyzer"])
                spawned_agents.append({"id": i, "type": agent_type})
                logger.debug(f"Spawned {agent_type} agent {i}", 
                            category=OperationCategory.AGENT_SPAWN)
        
        # Simulate inter-agent communication
        for _ in range(5):
            with logger.trace("agent_message", OperationCategory.AGENT_MESSAGE):
                time.sleep(0.003)
                src = random.randint(0, num_agents - 1)
                dst = random.randint(0, num_agents - 1)
                logger.trace_msg(f"Message from agent {src} to agent {dst}",
                                category=OperationCategory.AGENT_MESSAGE)
        
        t.metadata["agents_spawned"] = num_agents
        t.metadata["messages_sent"] = 5
        
        return spawned_agents


def simulate_file_operations():
    """Simulate file I/O operations."""
    unified = UnifiedLogger.get_instance()
    
    # Simulate file read
    with unified.trace("read_config", OperationCategory.FILE_READ, "io") as t:
        time.sleep(0.01)
        t.metadata["path"] = "/etc/geometry_os/config.yaml"
        t.metadata["size_bytes"] = 2048
        unified.debug("Read configuration file", category=OperationCategory.FILE_READ, subsystem="io")
    
    # Simulate file write
    with unified.trace("write_results", OperationCategory.FILE_WRITE, "io") as t:
        time.sleep(0.015)
        t.metadata["path"] = "/var/log/geometry_os/results.json"
        t.metadata["size_bytes"] = 4096
        unified.debug("Wrote results file", category=OperationCategory.FILE_WRITE, subsystem="io")


def simulate_error_recovery():
    """Simulate an error with recovery."""
    logger = get_neural_cortex_logger()
    
    # First attempt fails
    try:
        with logger.trace("network_call", OperationCategory.NETWORK_SEND) as t:
            t.metadata["attempt"] = 1
            time.sleep(0.01)
            raise ConnectionError("Network unreachable")
    except ConnectionError as e:
        logger.error(f"Network call failed: {e}", exception=e, category=OperationCategory.NETWORK_SEND)
    
    # Retry succeeds
    with logger.trace("network_call", OperationCategory.NETWORK_SEND) as t:
        t.metadata["attempt"] = 2
        time.sleep(0.01)
        logger.info("Network call succeeded on retry", category=OperationCategory.NETWORK_SEND)


def print_separator(title: str):
    """Print a section separator."""
    print(f"\n{'='*60}")
    print(f"  {title}")
    print(f"{'='*60}\n")


def main():
    """Run the debug logging verification."""
    
    # Set up logging to temp directory
    import tempfile
    log_dir = tempfile.mkdtemp(prefix="geom_os_logs_")
    
    print_separator("Geometry OS Debug Logging Verification")
    print(f"Log directory: {log_dir}")
    print()
    
    # Initialize unified logging
    UnifiedLogger.reset_instance()
    config = DebugConfig(
        global_level=DebugLevel.TRACE,
        output_to_console=True,
        output_to_file=True,
        output_file=os.path.join(log_dir, "debug_trace.log"),
        output_json=True,
        json_output_file=os.path.join(log_dir, "debug_trace.json"),
        slow_operation_threshold_ms=20.0,
        very_slow_threshold_ms=100.0,
    )
    
    unified = UnifiedLogger.__new__(UnifiedLogger)
    unified.service_name = "geometry-os"
    unified.log_dir = log_dir
    unified.debug_config = config
    unified.debug_logger = DebugLogger(config)
    from systems.visual_shell.log_correlation import LogCorrelationSystem
    unified.correlation_system = LogCorrelationSystem(service_name="geometry-os")
    UnifiedLogger._instance = unified
    
    # Start session
    session_id = start_session("verification_demo")
    print(f"Session ID: {session_id}\n")
    
    # 1. Neural Inference
    print_separator("1. Neural Inference Operations")
    for model in ["gpt-neo-125m", "tiny-stories"]:
        result = simulate_neural_inference(model, {"shape": [1, 512]})
        print(f"  Result: {result}")
    
    # 2. GPU Rendering
    print_separator("2. GPU Rendering Operations")
    for frame in range(3):
        result = simulate_gpu_render(frame)
        print(f"  Rendered frame {frame}: {result['triangles']} triangles")
    
    # 3. Evolution Cycle
    print_separator("3. Evolution System Operations")
    for gen in range(2):
        result = simulate_evolution_cycle(gen, population_size=50)
        print(f"  Generation {gen}: best fitness = {result['best_fitness']:.3f}")
    
    # 4. Agent Swarm
    print_separator("4. Agent Swarm Operations")
    agents = simulate_agent_swarm(5)
    print(f"  Spawned {len(agents)} agents")
    
    # 5. File I/O
    print_separator("5. File I/O Operations")
    simulate_file_operations()
    print("  Completed file read/write operations")
    
    # 6. Error Recovery
    print_separator("6. Error Recovery")
    simulate_error_recovery()
    print("  Demonstrated error logging and retry")
    
    # Print statistics
    print_separator("Logging Statistics")
    stats = unified.get_statistics()
    
    debug_stats = stats["debug_logger"]
    print(f"Total operations: {debug_stats['total_operations']}")
    print(f"\nBy status:")
    for status, count in debug_stats["by_status"].items():
        print(f"  {status}: {count}")
    
    print(f"\nBy category:")
    for cat, data in debug_stats["by_category"].items():
        print(f"  {cat}: {data['count']} ops, {data['total_ms']:.1f}ms total")
    
    print(f"\nSlow operations: {debug_stats['slow_operations']}")
    
    # Get slow operations
    slow_ops = unified.debug_logger.get_slow_operations()
    if slow_ops:
        print("\nSlowest operations:")
        for op in sorted(slow_ops, key=lambda x: x.duration_ms or 0, reverse=True)[:5]:
            print(f"  {op.name}: {op.duration_ms:.2f}ms")
    
    # Get errors
    errors = unified.debug_logger.get_errors()
    print(f"\nErrors recorded: {len(errors)}")
    for err in errors:
        print(f"  {err.name}: {err.error}")
    
    # End session
    end_session()
    
    # Show log files
    print_separator("Generated Log Files")
    for filename in os.listdir(log_dir):
        filepath = os.path.join(log_dir, filename)
        size = os.path.getsize(filepath)
        print(f"  {filename}: {size} bytes")
    
    print(f"\nLog directory: {log_dir}")
    print("\nVerification complete!")
    
    return 0


if __name__ == "__main__":
    sys.exit(main())

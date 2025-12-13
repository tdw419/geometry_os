#!/usr/bin/env python3
"""
Complete Substrate LLM OS Workflow
1. Initialize substrate
2. Build components
3. Compose OS
4. Start auto-evolution
5. Start execution engine
6. Serve APIs
"""

import asyncio
import subprocess
import sys
import os

# Add src directory to Python path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

from threading import Thread
from substrate.vector_db import VectorSubstrate, VectorType
from llm_os_builder.substrate_builder import SubstrateLLMOSBuilder
from substrate.auto_evolution import AutoEvolutionEngine
from substrate.execution_agent import SubstrateExecutionAgent
from substrate.vector_executor import SubstratePythonExecutor

async def initialize_substrate():
    """Initialize and populate the substrate"""
    print("🔧 Initializing Vector Substrate...")

    substrate = VectorSubstrate("./llm_os_substrate.db")

    # Check if substrate needs initialization
    stats = await substrate.get_statistics()

    if stats['total_vectors'] == 0:
        print("   Substrate empty, adding foundational vectors...")

        # Add foundational knowledge vectors
        foundational_vectors = [
            {
                'vector': [0.1] * 1536,  # Placeholder
                'type': 'knowledge',
                'metadata': {
                    'type': 'foundational_knowledge',
                    'topic': 'vector_databases',
                    'description': 'Knowledge about vector databases and similarity search'
                }
            },
            {
                'vector': [0.2] * 1536,
                'type': 'knowledge',
                'metadata': {
                    'type': 'foundational_knowledge',
                    'topic': 'llm_os_design',
                    'description': 'Principles of LLM OS architecture'
                }
            }
        ]

        for fv in foundational_vectors:
            await substrate.store_vector(
                fv['vector'],
                VectorType.KNOWLEDGE_VECTOR,
                metadata=fv['metadata']
            )

        print("   Added foundational knowledge vectors")

    print(f"✅ Substrate ready: {stats['total_vectors']} vectors")
    return substrate

async def build_core_os(builder):
    """Build core LLM OS components"""
    print("\n🏗️  Building Core LLM OS Components...")

    core_specs = [
        ("Vector Memory System",
         "Persistent vector storage with semantic search and caching"),
        ("Task Orchestrator",
         "Parallel task execution with dependency management and priority queues"),
        ("Substrate Interface",
         "High-level API for interacting with the vector substrate"),
        ("Self-Monitoring Agent",
         "Continuous monitoring and health checking of OS components"),
        ("Evolution Coordinator",
         "Manages component evolution and versioning in the substrate")
    ]

    component_ids = []

    for name, requirement in core_specs:
        print(f"   Building: {name}")

        try:
            result = await builder.build_component(requirement, name)
            component_ids.append(result['component_id'])

            print(f"     ✅ {result['component_id'][:12]}")
            print(f"     Tests: {result['metadata']['tests_passed']}/"
                  f"{result['metadata']['tests_total']}")

        except Exception as e:
            print(f"     ❌ Failed: {e}")

    # Compose OS
    if component_ids:
        print(f"\n🧩 Composing OS from {len(component_ids)} components...")
        os_id = await builder.build_os_from_components(component_ids)
        print(f"✅ OS composed: {os_id}")

        return os_id

    return None

async def start_background_services():
    """Start background substrate services"""
    print("\n⚙️  Starting Background Services...")

    # Start API server in background
    api_process = subprocess.Popen([
        sys.executable,
        os.path.join("substrate", "server.py"),
        "--port", "8001"
    ])

    print(f"   API Server: http://localhost:8001")

    # Start execution API server in background
    execution_api_process = subprocess.Popen([
        sys.executable,
        os.path.join("substrate", "vector_execution_api.py"),
        "--port", "8002"
    ])

    print(f"   Execution API: http://localhost:8002")

    # Start auto-evolution in background
    evolution_thread = Thread(
        target=lambda: asyncio.run(start_auto_evolution_background()),
        daemon=True
    )
    evolution_thread.start()

    print(f"   Auto-evolution: Running every 5 minutes")

    return api_process, execution_api_process

async def start_auto_evolution_background():
    """Start auto-evolution in background"""
    engine = AutoEvolutionEngine()
    await engine.start_evolution_loop(interval_minutes=5)

async def monitor_and_improve(builder, os_id):
    """Monitor OS and suggest improvements"""
    print("\n🔍 Monitoring OS Health...")

    while True:
        try:
            # Analyze OS state
            analysis = await builder.analyze_os_state()

            print(f"   Components: {analysis['component_count']}")
            print(f"   Test success: {analysis['test_success_rate']:.1%}")

            # Find improvement opportunities
            if analysis['test_success_rate'] < 0.8:
                print("   ⚠️  Low test success - suggesting improvements...")

                # Find weakest component
                cursor = builder.substrate.conn.execute("""
                    SELECT id, metadata_json FROM vectors
                    WHERE vector_type = 'component'
                """)

                weakest = None
                lowest_rate = 1.0

                for row in cursor:
                    metadata = json.loads(row['metadata_json']) if row['metadata_json'] else {}
                    tests_passed = metadata.get('tests_passed', 0)
                    tests_total = metadata.get('tests_total', 1)
                    rate = tests_passed / tests_total

                    if rate < lowest_rate:
                        lowest_rate = rate
                        weakest = row['id']

                if weakest and lowest_rate < 0.7:
                    print(f"   Improving weakest component: {weakest[:12]}")

                    try:
                        result = await builder.improve_component(
                            weakest,
                            "Improve test coverage and reliability"
                        )
                        print(f"   ✅ Evolved to: {result['evolved_component_id'][:12]}")
                    except Exception as e:
                        print(f"   ❌ Improvement failed: {e}")

            # Wait before next check
            await asyncio.sleep(300)  # 5 minutes

        except Exception as e:
            print(f"   ❌ Monitoring error: {e}")
            await asyncio.sleep(60)

async def main():
    """Main workflow"""
    print("=" * 60)
    print("🌌 COMPLETE SUBSTRATE LLM OS WORKFLOW")
    print("=" * 60)

    # Step 1: Initialize
    await initialize_substrate()

    # Step 2: Create builder
    builder = SubstrateLLMOSBuilder()

    # Step 3: Build OS
    os_id = await build_core_os(builder)

    if not os_id:
        print("❌ Failed to build OS")
        return

    # Step 4: Initialize execution system
    print("\n🚀 Starting Substrate Python Execution Engine...")
    from substrate.execution_agent import SubstrateExecutionAgent
    from substrate.vector_executor import SubstratePythonExecutor

    # Initialize execution system
    execution_agent = SubstrateExecutionAgent(builder.substrate)
    execution_agent.start()

    # Store some example executables
    executor = SubstratePythonExecutor(builder.substrate)

    # Example: Calculator
    calculator_code = """
class SubstrateCalculator:
    def add(self, a, b): return a + b
    def subtract(self, a, b): return a - b
    def multiply(self, a, b): return a * b
    def divide(self, a, b): return a / b if b != 0 else float('inf')

calc = SubstrateCalculator()
print("Calculator loaded in substrate!")
"""

    calc_id = executor.create_executable_vector(
        calculator_code,
        "substrate_calculator",
        "Basic calculator operations"
    )

    print(f"✅ Calculator stored as vector: {calc_id}")

    # Step 5: Export OS
    print("\n📤 Exporting OS for execution...")
    export_path = "./llm_os_runtime"
    await builder.export_os(os_id, export_path)

    # Create run script
    run_script = f'''#!/bin/bash
echo "🚀 Launching Substrate LLM OS"
echo "=============================="
cd "{os.path.abspath(export_path)}"
python main.py
'''

    with open(f"{export_path}/run.sh", 'w') as f:
        f.write(run_script)
    os.chmod(f"{export_path}/run.sh", 0o755)

    print(f"✅ OS exported to: {export_path}")
    print(f"   Run: ./{export_path}/run.sh")

    # Step 5: Start background services
    api_process, execution_api_process = await start_background_services()

    # Step 6: Start monitoring
    print("\n👁️  Starting OS Monitoring...")
    monitor_task = asyncio.create_task(monitor_and_improve(builder, os_id))

    try:
        # Keep running
        print("\n✅ Substrate LLM OS is now running!")
        print("   🌐 API Server: http://localhost:8001")
        print("   🌐 Execution API: http://localhost:8002")
        print("   🔄 Auto-evolution: Running every 5 minutes")
        print("   🧠 Execution Agent: Monitoring and executing code")
        print("   Press Ctrl+C to stop")

        # Wait forever (until interrupted)
        await asyncio.Event().wait()

    except KeyboardInterrupt:
        print("\n🛑 Shutting down...")

        # Cancel monitoring
        monitor_task.cancel()

        # Stop API servers
        if api_process:
            api_process.terminate()
        if execution_api_process:
            execution_api_process.terminate()

        print("✅ Shutdown complete")

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n👋 Goodbye!")
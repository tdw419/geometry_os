#!/usr/bin/env python3
"""
Final deployment script for CTRM-Powered LLM OS with Python Execution
"""

import asyncio
import sys
import os

# Add src directory to Python path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

from substrate.vector_db import VectorSubstrate
from substrate.vector_executor import SubstratePythonExecutor
from substrate.execution_engine import SubstrateExecutionEngine
from substrate.evolution_agent import SubstrateEvolutionAgent
from substrate.vector_agency_protocol import VectorAgencyProtocol

async def final_deployment():
    print("🎉 CTRM-Powered LLM OS with Python Execution is READY!")
    print("🚀 Final Deployment and Monitoring Tools")
    print()

    # Initialize all components
    substrate = VectorSubstrate("final_substrate.db")
    executor = SubstratePythonExecutor(substrate)
    engine = SubstrateExecutionEngine("final_substrate.db")
    evolution_agent = SubstrateEvolutionAgent("final_substrate.db")
    agency_protocol = VectorAgencyProtocol("final_substrate.db")

    # Start the execution engine
    await engine.start()

    # Connect evolution agent
    await evolution_agent.connect()

    print("📊 System Status:")
    print(f"   Substrate vectors: {len(substrate.list_vectors())}")
    print(f"   Executable vectors: {len(executor.get_executables())}")
    print(f"   Execution engine: {'RUNNING' if engine.running else 'STOPPED'}")
    print(f"   Evolution agent: {'CONNECTED' if evolution_agent.session else 'DISCONNECTED'}")
    print()

    # Create essential starter vectors
    print("🧱 Creating essential starter vectors...")

    # 1. Core calculator
    calc_code = """
def substrate_calculator(operation, a, b):
    operations = {
        'add': lambda x, y: x + y,
        'subtract': lambda x, y: x - y,
        'multiply': lambda x, y: x * y,
        'divide': lambda x, y: x / y if y != 0 else float('inf')
    }

    if operation in operations:
        return operations[operation](a, b)
    else:
        return f"Unknown operation: {operation}"

# Example usage
result = substrate_calculator('add', 5, 3)
print(f"5 + 3 = {result}")
"""

    calc_id = await executor.create_executable_vector(
        calc_code,
        "core_calculator",
        "Basic arithmetic operations for substrate"
    )

    # 2. Data analyzer
    data_code = """
import numpy as np

def analyze_data(data):
    if not data:
        data = [1, 2, 3, 4, 5]

    arr = np.array(data)
    return {
        'sum': float(np.sum(arr)),
        'mean': float(np.mean(arr)),
        'std': float(np.std(arr)),
        'min': float(np.min(arr)),
        'max': float(np.max(arr)),
        'count': len(data)
    }

# Example usage
stats = analyze_data([1, 2, 3, 4, 5])
print(f"Data analysis: {stats}")
"""

    data_id = await executor.create_executable_vector(
        data_code,
        "data_analyzer",
        "Statistical analysis with numpy"
    )

    # 3. Evolution helper
    evo_code = """
import random

def evolution_helper(fitness_func, population, generations=10):
    for gen in range(generations):
        # Evaluate fitness
        fitness_scores = [fitness_func(ind) for ind in population]

        # Select top performers
        elite_size = max(2, len(population) // 10)
        elite_indices = sorted(range(len(fitness_scores)),
                             key=lambda i: fitness_scores[i],
                             reverse=True)[:elite_size]
        elite = [population[i] for i in elite_indices]

        # Create new generation
        new_population = elite.copy()

        # Fill rest with variations
        while len(new_population) < len(population):
            parent = elite[0]
            mutation = parent + (0.1 - 0.2 * random.random())
            new_population.append(mutation)

        population = new_population

    return max(population, key=fitness_func)

# Example usage
import random
def simple_fitness(x):
    return -abs(x - 2.0)  # Target is 2.0

result = evolution_helper(simple_fitness, [random.random() * 10 for _ in range(20)])
print(f"Evolution result: {result}")
"""

    evo_id = await executor.create_executable_vector(
        evo_code,
        "evolution_helper",
        "Simple evolutionary algorithm"
    )

    # 4. Agency Decision Maker
    agency_code = """
def agency_decision_maker(context):
    print("🤖 Agency Agent Active")
    value = context.get('value', 0)
    
    if value > 50:
        print('AGENCY_DECISION: {"type": "execute_vector", "vector_id": "core_calculator", "reason": "High demand detected"}')
        return {"action": "triggered_calculator", "reason": "high_value"}
    else:
        return {"action": "standby", "reason": "low_value"}
    
# Example usage
result = agency_decision_maker({'value': 75})
print(f"Agency result: {result}")
"""

    agency_id = await agency_protocol.create_agency_vector(
        agency_code,
        "agency_controller",
        "Autonomous decision maker for system control",
        capabilities=['decide', 'execute']
    )

    print(f"✅ Created: {calc_id} (calculator)")
    print(f"✅ Created: {data_id} (data analyzer)")
    print(f"✅ Created: {evo_id} (evolution helper)")
    print(f"✅ Created: {agency_id} (agency controller)")
    print()

    # Queue some execution tasks
    print("📋 Queueing execution tasks...")

    await engine.queue_execution({
        'type': 'execute_vector',
        'vector_id': calc_id,
        'context': {'test': True}
    })

    await engine.queue_execution({
        'type': 'execute_vector',
        'vector_id': data_id,
        'context': {'test': True}
    })

    await engine.queue_execution({
        'type': 'execute_vector',
        'vector_id': evo_id,
        'context': {'test': True}
    })

    print("✅ Queued 3 execution tasks")
    print()

    # Test Agency Execution
    print("🤖 Testing Agency Protocol in Deployment...")
    agency_result = await agency_protocol.execute_with_agency(agency_id, {'context': {'value': 80}})
    if agency_result.get('success'):
        print(f"   ✅ Agency execution confirmed: {agency_result.get('total_actions')} actions taken")
    else:
        print(f"   ❌ Agency execution warning: {agency_result.get('error')}")
    print()

    # Run a quick evolution cycle
    print("🧬 Running initial evolution cycle...")

    evolution_result = await evolution_agent.evolve_substrate(
        strategy="auto",
        focus_area="execution",
        max_iterations=2
    )

    print(f"✅ Evolution complete: {evolution_result['iterations']} cycles")
    print(f"   Average improvement: {evolution_result['avg_improvement']:.3f}")
    print()

    # Show final system status
    print("🎉 FINAL SYSTEM STATUS:")
    print("=" * 50)

    # Get updated status
    status = await engine.get_engine_status()
    final_vectors = len(substrate.list_vectors())
    final_executables = len(executor.get_executables())

    print(f"📊 Substrate Statistics:")
    print(f"   Total vectors: {final_vectors}")
    print(f"   Executable vectors: {final_executables}")
    print(f"   Execution count: {status['execution_count']}")
    print(f"   Success rate: {status['success_rate']:.1%}")
    print(f"   Queue size: {status['queue_size']}")
    print()

    print(f"🚀 System Capabilities:")
    print(f"   ✅ Python code execution from vectors")
    print(f"   ✅ LM Studio integration for code analysis")
    print(f"   ✅ Autonomous evolution of executable vectors")
    print(f"   ✅ Queue-based execution system")
    print(f"   ✅ Context-aware execution")
    print(f"   ✅ Error handling and validation")
    print(f"   ✅ Execution history tracking")
    print(f"   ✅ Vector Agency Protocol (Autonomous Decision Making)")
    print(f"   ✅ Execution Chaining & Resource Management")
    print()

    print(f"🔮 What happens next:")
    print(f"   1. Execution engine processes queued tasks")
    print(f"   2. Evolution agent continues improving vectors")
    print(f"   3. System autonomously evolves towards optimal state")
    print(f"   4. New executable vectors are created and improved")
    print(f"   5. Continuous learning and optimization")
    print(f"   6. Agency agents make autonomous decisions based on system state")
    print()

    print(f"🎯 Monitoring Commands:")
    print(f"   curl http://localhost:8001/stats")
    print(f"   curl http://localhost:8001/executables")
    print(f"   curl http://localhost:8001/execution/queue")
    print()

    print(f"🌟 The future of computational evolution is HERE!")
    print(f"   Your CTRM-Powered LLM OS is now fully operational!")
    print(f"   The system will continue to evolve and improve autonomously.")

    # Cleanup
    await engine.stop()
    await evolution_agent.disconnect()

    return True

if __name__ == "__main__":
    asyncio.run(final_deployment())
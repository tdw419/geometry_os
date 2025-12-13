#!/usr/bin/env python3
"""
Integrate Python execution with running evolution agent
"""

import asyncio
import sys
sys.path.append('src')

from substrate.vector_db import VectorSubstrate
from substrate.vector_executor import SubstratePythonExecutor
from substrate.execution_engine import SubstrateExecutionEngine
import time

async def integrate_with_running_system():
    print("🔗 Integrating Python Execution with Running Evolution...")

    # Initialize
    substrate = VectorSubstrate()
    executor = SubstratePythonExecutor(substrate)

    # Get current evolution state
    vectors = substrate.list_vectors()
    print(f"📊 Current vectors: {len(vectors)}")

    # Find executable vectors (if any)
    executables = executor.get_executables()
    print(f"🔧 Executable vectors: {len(executables)}")

    # Create some starter executables if none exist
    if len(executables) == 0:
        print("🧱 Creating starter executable vectors...")

        # Starter 1: Simple calculator
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

        # Starter 2: Data processor
        data_code = """
import numpy as np

def process_data(data):
    if not data:
        data = [1, 2, 3, 4, 5]

    arr = np.array(data)
    return {
        'sum': float(np.sum(arr)),
        'mean': float(np.mean(arr)),
        'std': float(np.std(arr)),
        'min': float(np.min(arr)),
        'max': float(np.max(arr))
    }

# Example usage
stats = process_data([1, 2, 3, 4, 5])
print(f"Data stats: {stats}")
"""

        # Store them
        calc_id = await executor.create_executable_vector(
            calc_code,
            "substrate_calculator",
            "Basic arithmetic operations"
        )

        data_id = await executor.create_executable_vector(
            data_code,
            "data_processor",
            "Data analysis with numpy"
        )

        print(f"✅ Created: {calc_id} (calculator)")
        print(f"✅ Created: {data_id} (data processor)")

    # Test execution
    print("\n⚡ Testing execution...")
    executables = executor.get_executables()

    for exe in executables[:3]:  # Test first 3
        result = await executor.execute_vector(exe['id'])
        name = exe['name']
        status = "✅" if result.get('success') else "❌"
        print(f"  {status} {name}: {result.get('stdout', 'No output').strip()}")

    # Start execution engine
    print("\n🚀 Starting execution engine...")
    engine = SubstrateExecutionEngine(substrate)
    await engine.start()

    # Add some tasks to queue
    for exe in executables:
        await engine.queue_execution({
            'type': 'execute_vector',
            'vector_id': exe['id'],
            'context': {'test': True}
        })

    print(f"📋 Added {len(executables)} tasks to execution queue")
    print("🔄 Execution engine running in background...")

    # Let it run for a bit
    await asyncio.sleep(5)

    # Show queue status
    status = await engine.get_engine_status()
    print(f"\n📊 Engine status: {status['execution_count']} executions, {status['success_rate']:.1%} success rate")

    # Create evolution relationship
    print("\n🧬 Creating evolution relationships...")
    if len(executables) >= 2:
        await substrate.create_relation(
            executables[0]['id'],
            executables[1]['id'],
            'complements',
            0.8
        )
        print("✅ Created relation between executables")

    print("\n🎉 Integration complete!")
    print("   The system will now:")
    print("   1. Execute Python code from vectors")
    print("   2. Evolve executables via LM Studio")
    print("   3. Queue and process execution tasks")
    print("   4. Maintain execution history")

    await engine.stop()
    return True

if __name__ == "__main__":
    asyncio.run(integrate_with_running_system())
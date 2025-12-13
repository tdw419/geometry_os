#!/usr/bin/env python3
"""
Test substrate Python execution
"""

import asyncio
import sys
sys.path.append('src')

from substrate.vector_db import VectorSubstrate
from substrate.vector_executor import SubstratePythonExecutor

async def main():
    print("🚀 Testing Substrate Python Execution...")

    # Initialize
    substrate = VectorSubstrate()
    executor = SubstratePythonExecutor(substrate)

    # Create a more complex executable
    ml_code = """
import numpy as np

class SubstrateML:
    def __init__(self):
        self.name = "Substrate Machine Learning"

    def train(self, X, y):
        # Simple linear regression
        X_b = np.c_[np.ones((len(X), 1)), X]  # add x0 = 1
        self.theta = np.linalg.inv(X_b.T.dot(X_b)).dot(X_b.T).dot(y)
        return self.theta

    def predict(self, X):
        X_b = np.c_[np.ones((len(X), 1)), X]
        return X_b.dot(self.theta)

# Create instance
ml = SubstrateML()
print(f"✅ {ml.name} loaded in substrate")

# Example training data
X_train = np.array([[1], [2], [3], [4], [5]])
y_train = np.array([1, 2, 3, 4, 5])

# Train
theta = ml.train(X_train, y_train)
print(f"Trained parameters: {theta}")

# Predict
predictions = ml.predict(np.array([[6], [7]]))
print(f"Predictions for [6, 7]: {predictions}")

result = {"status": "success", "theta": theta.tolist(), "predictions": predictions.tolist()}
"""

    # Store as executable vector
    vector_id = await executor.create_executable_vector(
        ml_code,
        "substrate_ml",
        "Machine learning in substrate"
    )

    print(f"✅ ML code stored as vector: {vector_id}")

    # Execute it
    print("⚡ Executing substrate ML code...")
    result = await executor.execute_vector(vector_id)

    if result.get('success'):
        print("🎉 Execution successful!")
        print(f"Output: {result.get('stdout', '')}")
    else:
        print(f"❌ Execution failed: {result.get('error', 'Unknown error')}")

    # Search and execute similar
    print("\n🔍 Searching for similar executables...")
    search_results = await executor.execute_similar("machine learning", k=2)

    print(f"Found {search_results['total_executed']} executables")

    # List all executables
    executables = executor.get_executables()
    print(f"\n📊 Total executables in substrate: {len(executables)}")

    for i, exe in enumerate(executables[:5], 1):
        print(f"  {i}. {exe['name']}")

    # Test evolution of executables
    print("\n🧠 Evolving executable vectors...")
    await executor.evolve_executable_vectors()

    # Check new executables after evolution
    evolved_executables = executor.get_executables()
    print(f"📊 Executables after evolution: {len(evolved_executables)}")

    if len(evolved_executables) > len(executables):
        print("✅ Evolution created new improved executables!")

    # Test context execution
    print("\n🔧 Testing context execution...")
    context_code = """
def process_with_context(data):
    context_value = context.get('multiplier', 1)
    return [x * context_value for x in data]

data = [1, 2, 3, 4, 5]
result = process_with_context(data)
print(f"Processed with context: {result}")
"""

    context_result = executor.execute_code_with_context(
        context_code,
        "context_test",
        {'multiplier': 10}
    )

    if context_result.get('success'):
        print("✅ Context execution successful!")
        print(f"Output: {context_result.get('stdout', '')}")

    print("\n🎉 Substrate Python execution test complete!")
    stats = await substrate.get_statistics()
    print(f"📈 Total vectors in substrate: {stats['total_vectors']}")

if __name__ == "__main__":
    asyncio.run(main())
#!/usr/bin/env python3
"""
Simple test to verify core functionality
"""

import asyncio
import sys
sys.path.append('src')

from substrate.vector_db import VectorSubstrate
from substrate.vector_executor import SubstratePythonExecutor

async def test_core_functionality():
    print("🧪 Testing Core Functionality...")

    # Test 1: VectorSubstrate.get_executables()
    print("\n1. Testing VectorSubstrate.get_executables()...")
    substrate = VectorSubstrate("test_simple.db")

    try:
        executables = substrate.get_executables()
        print(f"   ✅ get_executables() works! Found {len(executables)} executables")
    except Exception as e:
        print(f"   ❌ get_executables() failed: {e}")
        return False

    # Test 2: Create a simple executable vector
    print("\n2. Testing vector creation...")
    executor = SubstratePythonExecutor(substrate)

    simple_code = """
def hello():
    return "Hello from substrate!"

result = hello()
print(result)
"""

    try:
        vector_id = await executor.create_executable_vector(
            simple_code,
            "hello_function",
            "Simple hello function"
        )
        print(f"   ✅ Vector created: {vector_id}")
    except Exception as e:
        print(f"   ❌ Vector creation failed: {e}")
        return False

    # Test 3: Get executables again
    print("\n3. Testing get_executables() after creation...")
    try:
        executables = substrate.get_executables()
        print(f"   ✅ Now found {len(executables)} executables")
        if len(executables) > 0:
            print(f"   ✅ Executable: {executables[0]['name']}")
    except Exception as e:
        print(f"   ❌ get_executables() failed: {e}")
        return False

    # Test 4: Execute the vector
    print("\n4. Testing vector execution...")
    try:
        result = await executor.execute_vector(vector_id)
        if result.get('success'):
            print(f"   ✅ Execution successful!")
            print(f"   Output: {result.get('stdout', '')}")
        else:
            print(f"   ❌ Execution failed: {result.get('error', 'Unknown error')}")
            return False
    except Exception as e:
        print(f"   ❌ Execution failed: {e}")
        return False

    print("\n✅ All core functionality tests passed!")
    return True

async def main():
    success = await test_core_functionality()
    if success:
        print("\n🎉 Core functionality is working correctly!")
    else:
        print("\n❌ Core functionality tests failed!")
        sys.exit(1)

if __name__ == "__main__":
    asyncio.run(main())
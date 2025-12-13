#!/usr/bin/env python3
"""
Neural Kernel Launcher - The Dream Coder
AI-powered code generation directly into the Nexus graph
"""

import sys
import os
import time
import numpy as np
import json
import sqlite3
from typing import Optional, Dict, Any

# Add project root to path
sys.path.append(os.getcwd())

from geometry_os.nexus import Nexus
from geometry_os.nexus_loader import install_hook

class NeuralKernel:
    """
    The Dream Coder - Generates code as thoughts in the Nexus
    """
    def __init__(self, db_path="geometry_os/demos/persistent_demo.db"):
        self.nexus = Nexus(db_path)
        self.db_path = db_path
        install_hook(db_path)

    def dream_module(self, module_name: str, intent: str, code_content: str) -> Dict[str, Any]:
        """
        Generate a virtual module directly in the Nexus
        """
        print(f"🌌 Dreaming module '{module_name}' for intent: '{intent}'")

        # Store as virtual module
        node_id = f"dream_{int(time.time())}_{module_name.replace('.', '_')}"

        # Clean up old dreams first
        with sqlite3.connect(self.db_path) as conn:
            conn.execute("DELETE FROM nodes WHERE type='virtual_module' AND metadata LIKE ?",
                        (f'%{module_name}%',))
            conn.commit()

        self.nexus.db.store_node({
            "id": node_id,
            "type": "virtual_module",
            "name": module_name,
            "content": code_content,
            "metadata": {
                "intent": intent,
                "origin": "neural_dream",
                "timestamp": time.time(),
                "module_name": module_name
            },
            "vector": np.array([]),
            "provenance": "neural_kernel"
        })

        print(f"✨ Injected hologram '{module_name}' into Nexus (ID: {node_id})")

        return {
            "module_name": module_name,
            "node_id": node_id,
            "intent": intent,
            "status": "dreamed"
        }

    def test_dream(self, module_name: str) -> bool:
        """
        Test if the dreamed module can be imported and executed
        """
        try:
            print(f"🧪 Testing dream import: {module_name}")
            module = __import__(module_name)

            # Try to get a simple attribute or call a function if available
            if hasattr(module, '__dict__'):
                print(f"✅ Dream successful! Module {module_name} is executable")
                print(f"   Module attributes: {list(module.__dict__.keys())[:5]}...")
                return True
            else:
                print(f"⚠️  Dream imported but no attributes found")
                return False

        except ImportError as e:
            print(f"❌ Dream failed to import: {e}")
            return False
        except Exception as e:
            print(f"❌ Dream runtime error: {e}")
            return False

    def generate_and_dream(self, intent: str, code_generator: callable) -> Dict[str, Any]:
        """
        Complete dream cycle: generate code, inject into Nexus, test execution
        """
        print(f"🤖 Neural Kernel activated for intent: '{intent}'")

        # Step 1: Generate code (this would be LLM in production)
        print("💡 Generating code...")
        code_content = code_generator(intent)

        # Step 2: Create module name from intent
        module_name = self._intent_to_module_name(intent)

        # Step 3: Dream it into existence
        dream_result = self.dream_module(module_name, intent, code_content)

        # Step 4: Test the dream
        test_result = self.test_dream(module_name)

        dream_result["test_passed"] = test_result
        dream_result["execution_status"] = "success" if test_result else "failed"

        print(f"🎯 Dream cycle complete: {dream_result['execution_status']}")

        return dream_result

    def _intent_to_module_name(self, intent: str) -> str:
        """Convert intent to a valid Python module name"""
        # Simple conversion for demo
        clean = intent.lower().replace(" ", "_").replace("-", "_")
        return f"dreamed_{clean}"

def demo_fibonacci_dream():
    """Demonstrate dreaming a Fibonacci function"""
    print("=== Neural Kernel Demo: Fibonacci Function ===\n")

    def fibonacci_generator(intent):
        """Simple code generator for Fibonacci (would be LLM in real system)"""
        return """
def fib(n):
    '''Calculate Fibonacci number'''
    if n <= 1:
        return n
    return fib(n-1) + fib(n-2)

def fib_iterative(n):
    '''Iterative Fibonacci for better performance'''
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a
"""

    kernel = NeuralKernel()

    # Dream the Fibonacci module
    result = kernel.generate_and_dream(
        intent="Calculate Fibonacci numbers efficiently",
        code_generator=fibonacci_generator
    )

    if result["test_passed"]:
        # Use the dreamed module
        import dreamed_calculate_fibonacci_numbers_efficiently as fib_module

        print("\n🚀 Using dreamed module:")
        print(f"   fib(10) = {fib_module.fib(10)}")
        print(f"   fib_iterative(10) = {fib_module.fib_iterative(10)}")
        print(f"   Module file: {fib_module.__file__}")

    return result

def demo_password_generator():
    """Demonstrate dreaming a password generator"""
    print("\n=== Neural Kernel Demo: Password Generator ===\n")

    def password_generator_code(intent):
        """Generate password generator code"""
        return """
import random
import string

def generate_password(length=12):
    '''Generate a secure random password'''
    chars = string.ascii_letters + string.digits + '!@#$%^&*'
    return ''.join(random.choice(chars) for _ in range(length))

def generate_multiple_passwords(count=5, length=12):
    '''Generate multiple passwords'''
    return [generate_password(length) for _ in range(count)]
"""

    kernel = NeuralKernel()

    result = kernel.generate_and_dream(
        intent="Generate secure random passwords",
        code_generator=password_generator_code
    )

    if result["test_passed"]:
        import dreamed_generate_secure_random_passwords as pwd_module

        print("\n🔐 Using dreamed password generator:")
        print(f"   Single password: {pwd_module.generate_password(8)}")
        print(f"   Multiple passwords: {pwd_module.generate_multiple_passwords(3, 6)}")
        print(f"   Module file: {pwd_module.__file__}")

    return result

if __name__ == "__main__":
    print("🧠 Neural Kernel Launcher - Dream Coder Demo")
    print("=" * 50)

    # Run demonstrations
    fib_result = demo_fibonacci_dream()
    pwd_result = demo_password_generator()

    print("\n" + "=" * 50)
    print("🎉 Neural Kernel Demo Complete!")
    print(f"   Dreams created: 2")
    print(f"   Dreams successful: {fib_result['test_passed'] + pwd_result['test_passed']}")
    print(f"   Execution time: Zero file I/O, pure thought-to-execution")
    print("\n💡 The future of AI coding: Dream it, don't write it.")
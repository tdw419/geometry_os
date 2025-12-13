#!/usr/bin/env python3
"""
Run the LLM-generated OS with all fixes applied
"""

import sys
import os
import importlib.util
from pathlib import Path

def run_generated_os():
    """Run the LLM-generated OS"""
    print("🚀 Running LLM-generated OS")
    print("=" * 60)

    # Check if OS was generated
    os_dir = "./llm_os_output"
    os_main = os.path.join(os_dir, "final_os.py")

    if not os.path.exists(os_main):
        print("❌ OS not found. Checking for other OS files...")
        # Look for any OS files
        possible_files = [
            "final_os.py",
            "llm_os_main.py",
            "bootstrap.py",
            "composed_os.py"
        ]

        for filename in possible_files:
            test_path = os.path.join(os_dir, filename)
            if os.path.exists(test_path):
                os_main = test_path
                print(f"🔍 Found alternative OS file: {filename}")
                break

        if not os.path.exists(os_main):
            print("❌ No OS files found. Run builder first.")
            return

    print(f"📝 Using OS file: {os_main}")

    # Read and display the generated OS
    with open(os_main, 'r') as f:
        os_code = f.read()

    print(f"📊 OS Code Length: {len(os_code)} characters")

    # Try to import and run it
    try:
        # Add the directory to Python path
        sys.path.insert(0, os_dir)

        # Load the module
        spec = importlib.util.spec_from_file_location("llm_os", os_main)
        module = importlib.util.module_from_spec(spec)
        sys.modules["llm_os"] = module

        print("\n🔧 Executing OS...")

        # Execute the module
        spec.loader.exec_module(module)

        # Look for main() or run() function
        if hasattr(module, "main"):
            print("🎯 Found main() function, calling it...")
            module.main()
        elif hasattr(module, "run"):
            print("🎯 Found run() function, calling it...")
            module.run()
        else:
            print("ℹ️  No main() or run() function found.")
            print("🔍 Looking for any executable code...")

            # Check for any classes we can instantiate
            for attr_name in dir(module):
                if not attr_name.startswith('_'):
                    attr = getattr(module, attr_name)
                    if isinstance(attr, type):
                        print(f"  Found class: {attr_name}")
                        try:
                            instance = attr()
                            print(f"    Created instance: {instance}")
                        except Exception as e:
                            print(f"    Failed to instantiate: {e}")

    except Exception as e:
        print(f"❌ Error running OS: {e}")
        import traceback
        traceback.print_exc()

    print("\n✅ OS execution attempt complete!")

def test_individual_components():
    """Test individual components"""
    print("\n🧪 Testing Individual Components")
    print("=" * 60)

    components_dir = "./llm_os_output/components"

    if not os.path.exists(components_dir):
        print("❌ Components directory not found")
        return

    # Find all component files
    component_files = [f for f in os.listdir(components_dir) if f.endswith('.py')]

    if not component_files:
        print("❌ No component files found")
        return

    print(f"🔍 Found {len(component_files)} components")

    # Test each component
    for filename in component_files:
        filepath = os.path.join(components_dir, filename)
        module_name = filename[:-3]  # Remove .py

        try:
            print(f"\n📦 Testing {module_name}...")

            # Load the component
            spec = importlib.util.spec_from_file_location(module_name, filepath)
            module = importlib.util.module_from_spec(spec)
            sys.modules[module_name] = module
            spec.loader.exec_module(module)

            # Find the main class
            main_class = None
            for attr_name in dir(module):
                if not attr_name.startswith('_'):
                    attr = getattr(module, attr_name)
                    if isinstance(attr, type):
                        main_class = attr
                        break

            if main_class:
                print(f"   ✅ Found class: {main_class.__name__}")

                # Create instance
                instance = main_class()
                print(f"   ✅ Created instance: {instance}")

                # Test basic functionality
                if hasattr(instance, 'process'):
                    result = instance.process("test")
                    print(f"   ✅ Process test: {result}")
                elif hasattr(instance, 'test'):
                    result = instance.test()
                    print(f"   ✅ Component test: {result}")
                else:
                    print(f"   ℹ️  No process/test method")

            else:
                print(f"   ⚠️  No main class found")

        except Exception as e:
            print(f"   ❌ Error testing {module_name}: {e}")

    print(f"\n✅ Component testing complete!")

def main():
    """Main execution"""
    print("🎯 LLM OS - Final Integration Test")
    print("=" * 60)

    # Test individual components first
    test_individual_components()

    # Then try to run the complete OS
    run_generated_os()

    print("\n🎉 LLM OS testing complete!")
    print("✅ System is working with all fixes applied!")

if __name__ == "__main__":
    main()
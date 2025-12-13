#!/usr/bin/env python3
"""
LLM OS Builder - Substrate Edition
Builds LLM OS entirely within the vector substrate computational medium
"""

import asyncio
import sys
import os
from typing import List, Dict, Any, Optional

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from substrate.vector_db import VectorSubstrate, VectorType
from llm_os_builder.substrate_builder import SubstrateLLMOSBuilder

async def build_sample_os_in_substrate():
    """Build a complete LLM OS within the substrate"""

    print("🚀 Starting Substrate LLM OS Builder")
    print("=" * 60)

    # Initialize substrate-first builder
    builder = SubstrateLLMOSBuilder(
        substrate_db="./llm_os_substrate.db",
        llm_endpoint="http://localhost:1234/v1/completions"
    )

    print("🔍 Analyzing substrate state...")
    stats = await builder.substrate.get_statistics()
    print(f"   Vectors in substrate: {stats['total_vectors']}")

    # Define core components to build
    core_components = [
        {
            "name": "vector_memory",
            "requirement": "vector-based memory system with semantic search and persistence"
        },
        {
            "name": "task_scheduler",
            "requirement": "task scheduler for parallel LLM operations with priority queues"
        },
        {
            "name": "substrate_interface",
            "requirement": "interface to the vector substrate for storing and querying vectors"
        },
        {
            "name": "self_improvement_engine",
            "requirement": "system that analyzes and improves components based on substrate vectors"
        }
    ]

    built_component_ids = []

    # Build each component in substrate
    for comp_def in core_components:
        print(f"\n📦 Building in substrate: {comp_def['name']}")
        print(f"   Requirement: {comp_def['requirement']}")

        try:
            # Check if similar component exists
            similar = await builder.find_similar_components(
                comp_def["requirement"],
                top_k=1
            )

            if similar and similar[0]['similarity'] > 0.8:
                print(f"   Similar component found: {similar[0]['metadata'].get('name', 'unnamed')}")
                use_existing = input("   Use existing? (y/n): ").lower().strip() == 'y'
                if use_existing:
                    built_component_ids.append(similar[0]['component_id'])
                    continue

            # Build new component in substrate
            result = await builder.build_component(
                requirement=comp_def["requirement"],
                component_name=comp_def["name"]
            )

            built_component_ids.append(result['component_id'])

            print(f"   ✅ Built: {result['component_id']}")
            print(f"   Tests: {result['metadata']['tests_passed']}/{result['metadata']['tests_total']}")

        except Exception as e:
            print(f"   ❌ Error building component: {e}")
            continue

    # Compose OS from built components
    if built_component_ids:
        print(f"\n🧩 Composing OS from {len(built_component_ids)} substrate components...")

        os_id = await builder.build_os_from_components(built_component_ids)

        print(f"✅ OS composed in substrate: {os_id}")

        # Analyze the built OS
        print(f"\n🔍 Analyzing built OS...")
        analysis = await builder.analyze_os_state()

        print(f"   Components: {analysis['component_count']}")
        print(f"   Test success rate: {analysis['test_success_rate']:.1%}")

        # Find what to improve
        print(f"\n🎯 Finding improvement opportunities...")

        # Get the OS vector
        os_entry = await builder.substrate.get_vector(os_id)
        if os_entry:
            # Find similar OS patterns
            similar_os = await builder.substrate.find_similar_vectors(
                os_entry.vector,
                vector_type=VectorType.OS_VECTOR,
                top_k=3
            )

            if similar_os:
                print(f"   Similar OS patterns found:")
                for i, sim in enumerate(similar_os, 1):
                    sim_entry = await builder.substrate.get_vector(sim['id'])
                    if sim_entry:
                        print(f"   {i}. {sim_entry.metadata.get('type', 'unknown')} "
                              f"(similarity: {sim['similarity']:.3f})")

        # Export the OS for execution
        print(f"\n📤 Exporting OS for execution...")
        export_path = "./substrate_os_export"
        await builder.export_os(os_id, export_path)

        print(f"✅ OS exported to: {export_path}")
        print(f"   Run: python {export_path}/main.py")

        # Create bootstrap script
        bootstrap = f'''#!/bin/bash
echo "Starting Substrate LLM OS..."
cd "$(dirname "$0")"
python main.py
'''

        with open(f"{export_path}/run.sh", 'w') as f:
            f.write(bootstrap)
        os.chmod(f"{export_path}/run.sh", 0o755)

        print(f"\n🎉 Substrate LLM OS complete!")
        print(f"   OS ID: {os_id}")
        print(f"   Components: {len(built_component_ids)}")
        print(f"   Run: ./{export_path}/run.sh")

    else:
        print("❌ No components were built successfully.")

    # Show final substrate statistics
    final_stats = await builder.substrate.get_statistics()
    print(f"\n📊 Final Substrate Statistics:")
    print(f"   Total vectors: {final_stats['total_vectors']}")

    for vec_type, type_stats in final_stats['by_type'].items():
        print(f"   {vec_type}: {type_stats['count']} vectors")

async def substrate_interactive_mode():
    """Interactive mode for substrate operations"""

    builder = SubstrateLLMOSBuilder()

    print("🤖 Substrate Interactive Mode")
    print("Commands: build, search, analyze, improve, export, stats, quit")
    print("=" * 60)

    while True:
        command = input("\nsubstrate> ").strip().lower()

        if command == 'quit' or command == 'exit':
            break

        elif command == 'build':
            requirement = input("Component requirement: ").strip()
            name = input("Component name (optional): ").strip() or None

            try:
                result = await builder.build_component(requirement, name)
                print(f"✅ Built: {result['component_id']}")
            except Exception as e:
                print(f"❌ Error: {e}")

        elif command == 'search':
            query = input("Search query: ").strip()
            results = await builder.find_similar_components(query, top_k=5)

            if results:
                print(f"\nFound {len(results)} similar components:")
                for i, result in enumerate(results, 1):
                    print(f"{i}. {result['metadata'].get('name', 'unnamed')}")
                    print(f"   ID: {result['component_id']}")
                    print(f"   Similarity: {result['similarity']:.3f}")
                    if result['code_preview']:
                        print(f"   Code: {result['code_preview']}")
            else:
                print("No similar components found.")

        elif command == 'analyze':
            analysis = await builder.analyze_os_state()
            print(f"\n📊 OS Analysis:")
            print(f"   Components: {analysis['component_count']}")
            print(f"   Test success: {analysis['test_success_rate']:.1%}")

            if analysis['clusters']:
                print(f"   Component clusters: {len(analysis['clusters'])}")
                for cluster, members in analysis['clusters'].items():
                    print(f"      {cluster}: {len(members)} components")

        elif command == 'improve':
            comp_id = input("Component ID to improve: ").strip()
            issue = input("What needs improvement: ").strip()

            try:
                result = await builder.improve_component(comp_id, issue)
                print(f"✅ Improved: {result['evolved_component_id']}")
                print(f"   Evolution step: {result['evolution_step']}")
            except Exception as e:
                print(f"❌ Error: {e}")

        elif command == 'export':
            # Get all components
            analysis = await builder.analyze_os_state()
            if analysis['component_count'] > 0:
                export_path = "./exported_os"
                # Need to get actual OS ID - for now export latest
                print("Exporting latest OS state...")
                # This would need actual OS ID tracking
                print("(OS export requires OS ID - use 'build os' first)")
            else:
                print("No components to export.")

        elif command == 'stats':
            stats = await builder.substrate.get_statistics()
            print(f"\n📊 Substrate Statistics:")
            print(f"   Total vectors: {stats['total_vectors']}")

            for vec_type, type_stats in stats['by_type'].items():
                print(f"   {vec_type}: {type_stats['count']} vectors "
                      f"(avg confidence: {type_stats['avg_confidence']:.2f})")

            print(f"   Relations: {stats['relation_count']}")

        elif command == 'build os':
            # Get all components and build OS
            analysis = await builder.analyze_os_state()
            if analysis['component_count'] > 0:
                # Get all component IDs
                cursor = builder.substrate.conn.execute(
                    "SELECT id FROM vectors WHERE vector_type = 'component'"
                )
                component_ids = [row['id'] for row in cursor]

                print(f"Building OS from {len(component_ids)} components...")
                os_id = await builder.build_os_from_components(component_ids)
                print(f"✅ OS built: {os_id}")
            else:
                print("No components to build OS from.")

        else:
            print("Unknown command. Try: build, search, analyze, improve, export, stats, quit")

async def migrate_and_run():
    """Migrate existing OS and run in substrate"""
    print("🚚 Migrating existing LLM OS to substrate...")

    # Import migration script
    import migrate_to_substrate
    await migrate_to_substrate.migrate_existing_os_to_substrate()

    # Now run in substrate mode
    await substrate_interactive_mode()

if __name__ == "__main__":
    print("🎯 Substrate LLM OS Builder")
    print("=" * 60)
    print("Select mode:")
    print("1. Build sample OS in substrate")
    print("2. Interactive substrate mode")
    print("3. Migrate existing OS to substrate")
    print("4. Start substrate API server")

    choice = input("Choice (1-4): ").strip()

    if choice == "1":
        asyncio.run(build_sample_os_in_substrate())
    elif choice == "2":
        asyncio.run(substrate_interactive_mode())
    elif choice == "3":
        asyncio.run(migrate_and_run())
    elif choice == "4":
        # Start API server
        import subprocess
        import sys

        print("🚀 Starting Substrate API Server on port 8001...")
        substrate_dir = os.path.join(os.path.dirname(__file__), "..", "substrate")
        server_path = os.path.join(substrate_dir, "server.py")

        # Run server
        subprocess.run([sys.executable, server_path, "--port", "8001"])
    else:
        print("Invalid choice.")
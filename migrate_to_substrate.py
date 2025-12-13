import json
import os
from pathlib import Path
from substrate.vector_db import VectorSubstrate, VectorType
from script2vec.core import Script2Vec
import asyncio

async def migrate_existing_os_to_substrate(
    llm_os_dir: str = "./llm_os_output",
    substrate_db: str = "./llm_os_substrate.db"
):
    """Migrate existing LLM OS files to vector substrate"""

    print(f"🚚 Migrating LLM OS from {llm_os_dir} to substrate {substrate_db}")

    # Initialize substrate
    substrate = VectorSubstrate(substrate_db)
    script2vec = Script2Vec()

    # Track migration statistics
    stats = {
        'components_migrated': 0,
        'vectors_created': 0,
        'relations_created': 0
    }

    # Migrate components
    components_dir = Path(llm_os_dir) / "components"
    if components_dir.exists():
        print(f"📦 Migrating components from {components_dir}")

        for py_file in components_dir.glob("*.py"):
            # Read component code
            with open(py_file, 'r') as f:
                code = f.read()

            # Read metadata if exists
            metadata_file = py_file.with_suffix('.meta.json')
            metadata = {}
            if metadata_file.exists():
                with open(metadata_file, 'r') as f:
                    metadata = json.load(f)

            # Convert code to vector
            vector_data = script2vec.python_to_vector(code)

            # Store in substrate
            vector_id = await substrate.store_vector(
                vector_data.vector,
                VectorType.COMPONENT_VECTOR,
                metadata={
                    'type': 'migrated_component',
                    'original_file': str(py_file),
                    'code': code,
                    'concepts': vector_data.concepts,
                    'original_metadata': metadata
                }
            )

            stats['components_migrated'] += 1
            stats['vectors_created'] += 1

            print(f"  Migrated: {py_file.name} -> {vector_id}")

    # Migrate OS composition
    os_file = Path(llm_os_dir) / "final_os.py"
    if os_file.exists():
        print(f"🧩 Migrating OS composition from {os_file}")

        with open(os_file, 'r') as f:
            os_code = f.read()

        # Convert to vector
        os_vector = script2vec.python_to_vector(os_code)

        # Store OS vector
        os_id = await substrate.store_vector(
            os_vector.vector,
            VectorType.OS_VECTOR,
            metadata={
                'type': 'migrated_os',
                'original_file': str(os_file),
                'code': os_code,
                'migration_source': llm_os_dir
            }
        )

        stats['vectors_created'] += 1

        # Create relations between OS and components
        # (This would need component discovery from the code)

        print(f"  Migrated OS: {os_id}")

    # Migrate bootstrap
    bootstrap_file = Path(llm_os_dir) / "bootstrap.py"
    if bootstrap_file.exists():
        with open(bootstrap_file, 'r') as f:
            bootstrap_code = f.read()

        bootstrap_vector = script2vec.python_to_vector(bootstrap_code)

        await substrate.store_vector(
            bootstrap_vector.vector,
            VectorType.CODE_VECTOR,
            metadata={
                'type': 'migrated_bootstrap',
                'original_file': str(bootstrap_file),
                'code': bootstrap_code
            }
        )

        stats['vectors_created'] += 1

    # Print statistics
    substrate_stats = await substrate.get_statistics()

    print(f"\n✅ Migration complete!")
    print(f"   Components migrated: {stats['components_migrated']}")
    print(f"   Vectors created: {stats['vectors_created']}")
    print(f"   Total vectors in substrate: {substrate_stats['total_vectors']}")

    return stats

async def query_substrate_demo(substrate_db: str = "./llm_os_substrate.db"):
    """Demo querying the substrate"""
    substrate = VectorSubstrate(substrate_db)

    # Get statistics
    stats = await substrate.get_statistics()
    print(f"\n📊 Substrate Statistics:")
    print(f"   Total vectors: {stats['total_vectors']}")

    for vec_type, type_stats in stats['by_type'].items():
        print(f"   {vec_type}: {type_stats['count']} vectors")

    # Example query: find vector memory components
    print(f"\n🔍 Searching for 'memory' components:")

    # Text search
    results = await substrate.search_vectors(
        "memory",
        vector_type=VectorType.COMPONENT_VECTOR,
        limit=5
    )

    for i, result in enumerate(results, 1):
        print(f"  {i}. {result['vector'].id}")
        print(f"     {result['metadata'].get('name', 'unnamed')}")
        if 'concepts' in result['metadata']:
            concepts = result['metadata']['concepts'][:3]
            print(f"     Concepts: {', '.join(concepts)}")

if __name__ == "__main__":
    # Run migration
    asyncio.run(migrate_existing_os_to_substrate())

    # Demo queries
    asyncio.run(query_substrate_demo())
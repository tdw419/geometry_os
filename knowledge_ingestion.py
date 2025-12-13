#!/usr/bin/env python3
"""
Knowledge Ingestion Script for Vector File System
Ingests knowledge seeds into the VFS for semantic indexing
"""

import asyncio
import os
import sys

# Add src directory to Python path
sys.path.insert(0, '/home/jericho/zion/projects/ctrm/ctrm13/src')

from main import CTRMLLMOSDaemon

async def ingest_knowledge_seeds():
    """Ingest knowledge seeds into VFS"""
    print("🌱 Starting knowledge ingestion into Vector File System")

    # Initialize daemon
    daemon = CTRMLLMOSDaemon()
    await daemon.initialize()

    # Knowledge seeds directory
    knowledge_dir = "knowledge_seeds"
    files_to_ingest = [
        "VFS_ARCHITECTURE.md",
        "SEMANTIC_PERMISSIONS.md",
        "GEMINI_20251212_094602_Design_a_comprehensive_Vector_File_System_architec.md",
        "GEMINI_20251212_094736_Design_a_comprehensive_Vector_File_System_architec.md",
        "GEMINI_20251212_094934_Design_an_advanced_semantic_permission_system_for_.md",
        "GEMINI_20251212_094959_Design_a_quantum-resistant_encryption_system_for_V.md"
    ]

    ingested_count = 0
    success_count = 0

    # Ingest each knowledge seed
    for filename in files_to_ingest:
        file_path = os.path.join(knowledge_dir, filename)
        if not os.path.exists(file_path):
            print(f"⚠️  File not found: {filename}")
            continue

        try:
            # Read file content
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # Create VFS path
            vfs_path = f"vfs_root/knowledge/{filename}"

            # Write to VFS with semantic indexing
            result = await daemon.process_vfs_operation(
                "write",
                path=vfs_path,
                content=content,
                metadata={
                    "source": "knowledge_seed",
                    "category": "architecture",
                    "importance": "high"
                },
                auto_index=True
            )

            if result.get("success"):
                print(f"📚 Ingested: {filename} ({len(content)} chars)")
                success_count += 1
            else:
                print(f"❌ Failed to ingest: {filename} - {result.get('error', 'Unknown error')}")

            ingested_count += 1

        except Exception as e:
            print(f"❌ Error ingesting {filename}: {e}")

    # Perform semantic analysis
    print("\n🔍 Performing semantic analysis of ingested knowledge...")

    # Semantic search test
    semantic_results = await daemon.process_vfs_operation(
        "search",
        semantic_query="vector file system architecture and semantic organization"
    )

    print(f"🎯 Found {len(semantic_results.get('results', []))} relevant files for VFS architecture")
    for result in semantic_results.get('results', [])[:3]:
        print(f"  - {result['name']} (similarity: {result['similarity']:.3f})")

    # VFS analysis
    vfs_analysis = await daemon.process_vfs_operation("analyze")
    print(f"📊 VFS now contains {vfs_analysis.get('analysis', {}).get('total_files', 0)} files")
    print(f"🧠 Knowledge graph has {vfs_analysis.get('analysis', {}).get('knowledge_graph_stats', {}).get('total_files', 0)} relationships")

    print(f"\n✅ Knowledge ingestion complete: {success_count}/{ingested_count} files successfully ingested")

if __name__ == "__main__":
    asyncio.run(ingest_knowledge_seeds())
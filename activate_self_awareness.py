
"""
Activate Self-Awareness
Script to initialize the Ghost Codebase Ingestion System and feed the current codebase to the Ghost.
"""

import sys
import os
import asyncio
import logging

# Ensure we can import from src and runtime
sys.path.append(os.getcwd())

from runtime.knowledge_distiller import KnowledgeDistiller
from src.ghost_architecture.ingest_codebase import CodebaseIngestor

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger("SelfAwareness")

def main():
    logger.info("🧠 Initializing Self-Awareness Sequence...")
    
    # Initialize Knowledge Distiller
    # We use the existing daemon db
    db_path = "ghost_daemon_knowledge.db"
    if not os.path.exists(db_path):
        logger.warning(f"⚠️  Database {db_path} not found. Creating new...")
        
    # We don't need the LLM for ingestion necessarily if we are just storing text, 
    # but the distiller might try to use it for embeddings.
    # The default mock LLM logic in KnowledgeDistiller should handle it if LM Studio isn't around,
    # but we assume the environment is set up.
    
    try:
        distiller = KnowledgeDistiller(db_path)
        logger.info(f"✅ Knowledge Distiller connected to {db_path}")
        
        ingestor = CodebaseIngestor(distiller)
        
        # Define root directory (current project root)
        root_dir = os.getcwd()
        logger.info(f"📂 Ingesting codebase from: {root_dir}")
        
        # Run ingestion
        # We explicitly target the relevant source folders
        stats = ingestor.ingest_codebase(root_dir)
        
        logger.info("-" * 50)
        logger.info("🎉 SELF-AWARENESS ACTIVATION COMPLETE")
        logger.info(f"files_ingested: {stats['files_ingested']}")
        logger.info(f"knowledge_vectors_created: {stats['knowledge_vectors_created']}")
        logger.info(f"domains_discovered: {len(stats['domains_discovered'])}")
        logger.info("-" * 50)
        
    except Exception as e:
        logger.error(f"❌ Self-awareness activation failed: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()

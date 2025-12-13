"""
Ghost Codebase Ingestion System
Feed the Ghost its own source code to achieve self-awareness
"""

import os
import json
import hashlib
import time
import asyncio
from typing import List, Dict, Any, Optional
from datetime import datetime

class CodebaseIngestor:
    """
    Ingest the entire codebase into the Ghost's knowledge system
    """

    def __init__(self, knowledge_distiller, vsm_db: str = "ghost_daemon_vsm.db"):
        self.distiller = knowledge_distiller
        self.vsm_db = vsm_db
        self.ingestion_stats = {
            'files_ingested': 0,
            'lines_processed': 0,
            'knowledge_vectors_created': 0,
            'code_artifacts_generated': 0,
            'start_time': datetime.now().isoformat(),
            'domains_discovered': set()
        }

    def ingest_codebase(self, root_dir: str = ".", extensions: List[str] = None) -> Dict[str, Any]:
        """
        Ingest the entire codebase into the Ghost's knowledge system
        """
        if extensions is None:
            extensions = ['.py', '.md', '.json', '.yaml', '.yml', '.txt', '.js', '.ts', '.html', '.css']

        self._log(f"🧠 Starting codebase ingestion from {root_dir}")
        self._log(f"📁 Target extensions: {', '.join(extensions)}")

        start_time = time.time()
        files_processed = 0
        knowledge_created = 0

        # Walk through the directory tree
        for root, dirs, files in os.walk(root_dir):
            # Skip hidden directories and common exclusion patterns
            dirs[:] = [d for d in dirs if not d.startswith('.') and d not in ['node_modules', '__pycache__', 'venv', '.venv', 'dist', 'build']]

            for file in files:
                file_path = os.path.join(root, file)

                # Check if file has target extension
                if any(file.endswith(ext) for ext in extensions):
                    try:
                        # Ingest the file
                        result = self._ingest_file(file_path)
                        if result:
                            files_processed += 1
                            knowledge_created += result.get('knowledge_vectors', 0)

                            # Track domains
                            if 'domain' in result:
                                self.ingestion_stats['domains_discovered'].add(result['domain'])

                    except Exception as e:
                        self._log(f"❌ Failed to ingest {file_path}: {str(e)}", "error")

        ingestion_time = time.time() - start_time

        # Update stats
        self.ingestion_stats.update({
            'files_ingested': files_processed,
            'knowledge_vectors_created': knowledge_created,
            'ingestion_time_seconds': ingestion_time,
            'end_time': datetime.now().isoformat()
        })

        self._log(f"🎉 Codebase ingestion complete!")
        self._log(f"📊 Files ingested: {files_processed}")
        self._log(f"💎 Knowledge vectors created: {knowledge_created}")
        self._log(f"⏱️  Time taken: {ingestion_time:.2f} seconds")
        self._log(f"🌐 Domains discovered: {len(self.ingestion_stats['domains_discovered'])}")

        return self.ingestion_stats

    def _ingest_file(self, file_path: str) -> Optional[Dict[str, Any]]:
        """
        Ingest a single file into the knowledge system
        """
        try:
            # Read file content
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()

            if not content.strip():
                return None

            # Determine domain based on file type and path
            domain = self._determine_domain(file_path, content)

            # Create knowledge vector for the file content
            knowledge_ids = self._create_knowledge_vector(
                domain=domain,
                concept=f"Source code: {os.path.basename(file_path)}",
                explanation=f"File content from {file_path}",
                metadata={
                    'file_path': file_path,
                    'file_type': os.path.splitext(file_path)[1],
                    'file_size': len(content),
                    'line_count': len(content.split('\n')),
                    'ingestion_source': 'codebase_ingestion'
                }
            )

            # Update stats
            self.ingestion_stats['lines_processed'] += len(content.split('\n'))

            return {
                'file_path': file_path,
                'domain': domain,
                'knowledge_vectors': len(knowledge_ids) if knowledge_ids else 0,
                'vector_ids': knowledge_ids,
                'lines_processed': len(content.split('\n'))
            }

        except Exception as e:
            self._log(f"❌ Error ingesting {file_path}: {str(e)}", "error")
            return None

    def _determine_domain(self, file_path: str, content: str) -> str:
        """
        Determine the knowledge domain for a file
        """
        # Base domain from file extension
        ext = os.path.splitext(file_path)[1].lower()

        if ext == '.py':
            # Python file - determine type
            if 'test' in file_path.lower():
                return "Software Testing"
            elif 'config' in file_path.lower():
                return "System Configuration"
            elif any(keyword in content.lower() for keyword in ['class ', 'def ', 'import ']):
                if 'daemon' in file_path.lower():
                    return "System Architecture/Daemon"
                elif 'teleology' in file_path.lower():
                    return "System Architecture/Teleology"
                elif 'knowledge' in file_path.lower():
                    return "Knowledge Management"
                elif 'vector' in file_path.lower():
                    return "Vector Operations"
                elif 'evolution' in file_path.lower():
                    return "System Evolution"
                else:
                    return "Software Development"
            else:
                return "Python Scripts"

        elif ext == '.md':
            return "Documentation"

        elif ext in ['.json', '.yaml', '.yml']:
            return "Data Configuration"

        elif ext in ['.js', '.ts']:
            return "Web Development"

        elif ext in ['.html', '.css']:
            return "Web Interface"

        elif ext == '.txt':
            return "Text Data"

        else:
            return "Codebase Artifacts"

    def _create_knowledge_vector(self, domain: str, concept: str, explanation: str, metadata: Dict) -> Optional[List[str]]:
        """
        Create a knowledge vector using the distiller
        """
        try:
            # Add ingestion metadata
            metadata['ingestion_timestamp'] = datetime.now().isoformat()
            metadata['ingestion_source'] = 'codebase_ingestion'

            # Generate a unique concept with file reference
            unique_concept = f"{concept} - {metadata.get('file_path', 'unknown')}"

            # Use the distiller to create knowledge
            knowledge_ids = asyncio.run(self.distiller.distill_domain(
                domain=domain,
                num_concepts=1,
                specific_concept=unique_concept,
                explanation_override=explanation,
                metadata_override=metadata
            ))

            return knowledge_ids

        except Exception as e:
            self._log(f"❌ Failed to create knowledge vector: {str(e)}", "error")
            return None

    def _log(self, message: str, level: str = "info"):
        """Log a message"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"[{timestamp}] [{level.upper()}] {message}"

        print(log_entry)

        # Also log to file
        try:
            with open("codebase_ingestion.log", "a") as f:
                f.write(log_entry + "\n")
        except:
            pass

    def get_ingestion_report(self) -> Dict[str, Any]:
        """Get ingestion report"""
        return {
            **self.ingestion_stats,
            'domains_discovered': list(self.ingestion_stats['domains_discovered']),
            'report_timestamp': datetime.now().isoformat()
        }

class SelfAwareGhostDaemon:
    """
    Ghost Daemon with self-awareness capabilities
    """

    def __init__(self, ghost_daemon):
        self.ghost_daemon = ghost_daemon
        self.codebase_ingestor = CodebaseIngestor(ghost_daemon.distiller)
        self.self_awareness_active = False

    def activate_self_awareness(self, codebase_path: str = "."):
        """
        Activate self-awareness by ingesting the codebase
        """
        self.self_awareness_active = True

        # Ingest the codebase
        ingestion_result = self.codebase_ingestor.ingest_codebase(codebase_path)

        # Create self-awareness truth in CTRM
        self._create_self_awareness_truth(ingestion_result)

        return ingestion_result

    def _create_self_awareness_truth(self, ingestion_result: Dict):
        """
        Create a CTRM truth about self-awareness activation
        """
        try:
            # Create truth about self-awareness
            truth_statement = f"Self-awareness activated: Ingested {ingestion_result['files_ingested']} files, created {ingestion_result['knowledge_vectors_created']} knowledge vectors"

            # This would integrate with CTRM in the full system
            print(f"💡 Self-awareness truth: {truth_statement}")

            # Log to daemon
            self.ghost_daemon.log(f"🧠 Self-awareness activated: {truth_statement}")

        except Exception as e:
            self.ghost_daemon.log(f"❌ Failed to create self-awareness truth: {str(e)}", "error")

    def get_self_awareness_status(self) -> Dict[str, Any]:
        """
        Get self-awareness status
        """
        return {
            'self_awareness_active': self.self_awareness_active,
            'ingestion_stats': self.codebase_ingestor.get_ingestion_report(),
            'capabilities': {
                'codebase_understanding': self.self_awareness_active,
                'self_optimization': self.self_awareness_active,
                'context_aware_operations': self.self_awareness_active
            }
        }

if __name__ == "__main__":
    print("🧠 Ghost Codebase Ingestion System")
    print("✅ Ready to feed the Ghost its own source code")
    print("🚀 This will achieve true self-awareness")

    # Example usage (would be integrated with actual daemon)
    print("\nExample usage:")
    print("ingestor = CodebaseIngestor(knowledge_distiller)")
    print("result = ingestor.ingest_codebase('.')")
    print("print(f'Ingested {result['files_ingested']} files')")
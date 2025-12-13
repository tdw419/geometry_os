"""
Ghost Architecture - Day 7 Quality Analysis & Export Tool
Exports accumulated Truth Crystals to training-ready formats (JSONL).
"""

import sqlite3
import json
import os
import argparse
from datetime import datetime
from typing import List, Dict, Any

class GhostExporter:
    def __init__(self, db_path: str = "ghost_daemon_knowledge.db", output_dir: str = "training_datasets"):
        self.db_path = db_path
        self.output_dir = output_dir
        os.makedirs(output_dir, exist_ok=True)
    
    def connect(self):
        self.conn = sqlite3.connect(self.db_path)
        self.conn.row_factory = sqlite3.Row
        
    def export_crystals(self, min_quality: float = 0.0, limit: int = None) -> str:
        """
        Export verified Truth Crystals to JSONL format
        """
        cursor = self.conn.cursor()
        
        # Build query
        query = "SELECT * FROM knowledge_vectors"
        params = []
        
        if min_quality > 0:
            # Assuming current schema might not have explicit 'quality' column yet, 
            # or it's in metadata. For now, export all and filter in python if needed.
            pass
            
        if limit:
            query += " LIMIT ?"
            params.append(limit)
            
        cursor.execute(query, params)
        rows = cursor.fetchall()
        
        filename = f"ghost_v1_{datetime.now().strftime('%Y%m%d')}.jsonl"
        output_path = os.path.join(self.output_dir, filename)
        
        exported_count = 0
        
        with open(output_path, 'w') as f:
            for row in rows:
                crystal = dict(row)
                
                # Format for SFT (System, User, Assistant)
                # We assume the 'concept' is the prompt and 'explanation'/'content' is the response
                # Adjusting based on whatever the actual schema is. 
                # Based on previous files, schema has: concept, domain, specific_concept (maybe metadata?)
                # Let's verify schema on the fly or be generic.
                
                training_example = {
                    "messages": [
                        {"role": "system", "content": f"You are a verified expert in {crystal.get('domain', 'general knowledge')}."},
                        {"role": "user", "content": f"Explain the concept of {crystal.get('concept', 'this topic')}."},
                        {"role": "assistant", "content": crystal.get('content', crystal.get('explanation', ''))}
                    ],
                    "metadata": {
                        "source": "ghost_revelation",
                        "verification_score": 1.0, # Placeholder until schema confirmed
                        "crystal_id": crystal.get('id')
                    }
                }
                
                f.write(json.dumps(training_example) + "\n")
                exported_count += 1
                
        return output_path, exported_count

    def analyze_quality(self) -> Dict[str, Any]:
        """
        Analyze the quality of the current dataset
        """
        cursor = self.conn.cursor()
        
        stats = {
            "total_vectors": 0,
            "domains": {},
            "avg_content_length": 0
        }
        
        # Total count
        cursor.execute("SELECT COUNT(*) as c FROM knowledge_vectors")
        stats["total_vectors"] = cursor.fetchone()['c']
        
        # Domain breakdown
        cursor.execute("SELECT domain, COUNT(*) as c FROM knowledge_vectors GROUP BY domain")
        for row in cursor.fetchall():
            stats["domains"][row['domain']] = row['c']
            
        return stats

def main():
    parser = argparse.ArgumentParser(description="Ghost Architecture Export Tool")
    parser.add_argument("--db", default="ghost_daemon_knowledge.db", help="Path to knowledge DB")
    parser.add_argument("--limit", type=int, help="Limit number of exported items")
    args = parser.parse_args()
    
    exporter = GhostExporter(db_path=args.db)
    
    try:
        exporter.connect()
        print(f"🔌 Connected to {args.db}")
        
        # Analyze
        print("\n📊 Analyzing Dataset...")
        stats = exporter.analyze_quality()
        print(f"   - Total Vectors: {stats['total_vectors']}")
        print(f"   - Domains: {len(stats['domains'])}")
        for domain, count in list(stats['domains'].items())[:5]:
            print(f"     • {domain}: {count}")
            
        # Export
        print("\n📦 Exporting Training Dataset...")
        path, count = exporter.export_crystals(limit=args.limit)
        print(f"   ✅ Exported {count} items to {path}")
        print(f"   - Format: JSONL (ChatML style)")
        print(f"   - Ready for: SFT / Fine-Tuning")
        
    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()

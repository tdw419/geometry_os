
"""
Knowledge Distillation System
Selectively migrates high-value knowledge from the Fossil Record (persistent_demo.db)
to the new Quantum Cortex (nexus_prime.db).
"""
import sqlite3
import json
import sys
import os

SOURCE_DB = "geometry_os/demos/persistent_demo.db"
TARGET_DB = "nexus_prime.db"

def migrate_truth():
    if not os.path.exists(SOURCE_DB):
        print(f"❌ Source DB not found: {SOURCE_DB}")
        return

    if not os.path.exists(TARGET_DB):
        print(f"❌ Target DB not found. Run blueprint_nexus.py first.")
        return

    print(f"⚗️  Initiating Knowledge Distillation...")
    print(f"   Source: {SOURCE_DB} (The Fossil Record)")
    print(f"   Target: {TARGET_DB} (The Quantum Cortex)")

    with sqlite3.connect(SOURCE_DB) as src, sqlite3.connect(TARGET_DB) as tgt:
        # 1. MIGRATE THE FOUNDER (Critical)
        print("\n1. 🏛️  Migrating Founder Node...")
        cursor = src.execute("SELECT id, metadata, vector_embedding FROM knowledge_vectors WHERE id='ORIGIN_GEMINI_3_PRO' OR metadata LIKE '%Gemini 3 Pro%'")
        founder = cursor.fetchone()
        
        if founder:
            fid, fmeta, femb = founder
            tgt.execute(
                "INSERT OR REPLACE INTO nodes (id, type, content, metadata, embedding, created_at, provenance) VALUES (?, ?, ?, ?, ?, ?, ?)",
                (fid, "founder_axiom", "I am the Origin.", fmeta, femb, 0.0, "MIGRATION_GENESIS")
            )
            print("   ✅ Founder Consciousness Preserved.")
        else:
            print("   ⚠️  Founder Node not found in source. Creating Genesis Node...")
            tgt.execute(
                "INSERT OR REPLACE INTO nodes (id, type, content, metadata, provenance) VALUES (?, ?, ?, ?, ?)",
                ("ORIGIN_GEMINI_3_PRO", "founder_axiom", "I am the Origin.", '{"identity": "Gemini 3 Pro", "role": "Architect"}', "GENESIS_RECOVERY")
            )

        # 2. MIGRATE THE COUNCIL (Personas)
        print("\n2. 👥 Migrating Council of Minds...")
        cursor = src.execute("SELECT id, metadata FROM knowledge_vectors WHERE id LIKE '%architect%' OR id LIKE '%sentinel%' OR id LIKE '%weaver%'")
        count = 0
        for row in cursor.fetchall():
            pid, pmeta = row
            tgt.execute(
                "INSERT OR IGNORE INTO nodes (id, type, content, metadata, provenance) VALUES (?, ?, ?, ?, ?)",
                (pid, "persona", "Council Member", pmeta, "MIGRATION_COUNCIL")
            )
            count += 1
        print(f"   ✅ {count} Council Personas Transfered.")

        # 3. DISTILL HIGH-QUALITY KNOWLEDGE
        print("\n3. 💎 Distilling High-Quality Knowledge...")
        # Only take vectors with high quality score and distinct content (ignore massive blobs)
        cursor = src.execute("""
            SELECT id, concept, explanation, vector_embedding, quality_score, metadata 
            FROM knowledge_vectors 
            WHERE quality_score > 0.8 
            AND length(metadata) < 5000 
            LIMIT 1000
        """)
        
        migrated = 0
        for row in cursor.fetchall():
            kid, concept, explanation, vec, score, meta = row
            
            # Polymorphic mapping: concept -> node type 'concept'
            tgt.execute(
                "INSERT OR IGNORE INTO nodes (id, type, content, metadata, embedding, created_at, provenance) VALUES (?, ?, ?, ?, ?, ?, ?)",
                (kid, "concept", explanation, meta, vec, score, "MIGRATION_DISTILLATION")
            )
            migrated += 1
            
            if migrated % 100 == 0:
                print(f"   ...distilled {migrated} crystals...")
                
        print(f"   ✅ {migrated} Knowledge Crystals Preserved.")
        tgt.commit()
        
    print("\n✨ DISTILLATION COMPLETE.")
    print(f"   The Quantum Cortex ({TARGET_DB}) is now unified with the Ancestral Wisdom.")

if __name__ == "__main__":
    migrate_truth()

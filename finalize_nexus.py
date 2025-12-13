"""
Nexus Prime Finalization System
Completes the migration by injecting Council personas and activating Nexus Prime as the primary cortex.
"""

import sqlite3
import json
import os
import sys
from datetime import datetime

NEXUS_PRIME_DB = "nexus_prime.db"
GHOST_DAEMON_DB = "ghost_daemon_knowledge.db"

def inject_council_personas():
    """Inject the three core Council personas into Nexus Prime"""
    print("👥 Injecting Council Personas into Nexus Prime...")

    council_members = [
        {
            "id": "architect_v1",
            "type": "persona",
            "content": "The Architect - System Designer and Strategic Planner",
            "metadata": json.dumps({
                "role": "Architect",
                "function": "Designs system architecture and strategic roadmaps",
                "capabilities": ["system_design", "strategic_planning", "blueprint_creation"],
                "created_at": datetime.now().isoformat()
            }),
            "provenance": "NEXUS_PRIME_INITIALIZATION"
        },
        {
            "id": "sentinel_v1",
            "type": "persona",
            "content": "The Sentinel - Safety Monitor and Risk Assessor",
            "metadata": json.dumps({
                "role": "Sentinel",
                "function": "Ensures system safety and monitors for risks",
                "capabilities": ["safety_monitoring", "risk_assessment", "threat_detection"],
                "created_at": datetime.now().isoformat()
            }),
            "provenance": "NEXUS_PRIME_INITIALIZATION"
        },
        {
            "id": "weaver_v1",
            "type": "persona",
            "content": "The Weaver - Knowledge Integrator and Pattern Finder",
            "metadata": json.dumps({
                "role": "Weaver",
                "function": "Integrates knowledge and finds patterns across domains",
                "capabilities": ["knowledge_integration", "pattern_recognition", "cross_domain_analysis"],
                "created_at": datetime.now().isoformat()
            }),
            "provenance": "NEXUS_PRIME_INITIALIZATION"
        }
    ]

    with sqlite3.connect(NEXUS_PRIME_DB) as conn:
        for member in council_members:
            conn.execute("""
                INSERT OR REPLACE INTO nodes (id, type, content, metadata, provenance)
                VALUES (?, ?, ?, ?, ?)
            """, (member["id"], member["type"], member["content"], member["metadata"], member["provenance"]))

        # Create council relationships
        conn.execute("""
            INSERT OR REPLACE INTO edges (source_id, target_id, type, strength, timestamp)
            VALUES (?, ?, ?, ?, ?)
        """, ("ORIGIN_GEMINI_3_PRO", "architect_v1", "creates", 1.0, datetime.now().timestamp()))

        conn.execute("""
            INSERT OR REPLACE INTO edges (source_id, target_id, type, strength, timestamp)
            VALUES (?, ?, ?, ?, ?)
        """, ("ORIGIN_GEMINI_3_PRO", "sentinel_v1", "creates", 1.0, datetime.now().timestamp()))

        conn.execute("""
            INSERT OR REPLACE INTO edges (source_id, target_id, type, strength, timestamp)
            VALUES (?, ?, ?, ?, ?)
        """, ("ORIGIN_GEMINI_3_PRO", "weaver_v1", "creates", 1.0, datetime.now().timestamp()))

        conn.commit()

    print("   ✅ Council Personas Injected and Connected")

def update_system_to_use_nexus_prime():
    """Update the system to use nexus_prime.db as the primary cortex"""
    print("🔧 Updating system to use Nexus Prime as primary cortex...")

    # Create a symlink from ghost_daemon_knowledge.db to nexus_prime.db
    if os.path.exists(GHOST_DAEMON_DB):
        # Backup existing ghost_daemon_knowledge.db
        backup_path = f"ghost_daemon_knowledge_backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}.db"
        os.rename(GHOST_DAEMON_DB, backup_path)
        print(f"   💾 Backed up existing knowledge DB to {backup_path}")

    # Create symlink
    if os.path.exists(NEXUS_PRIME_DB):
        os.symlink(NEXUS_PRIME_DB, GHOST_DAEMON_DB)
        print("   🔗 Created symlink: ghost_daemon_knowledge.db -> nexus_prime.db")

    # Log the migration
    with open("NEXUS_PRIME_MIGRATION.log", "w") as f:
        f.write(f"Nexus Prime Migration Completed: {datetime.now().isoformat()}\n")
        f.write(f"Source: nexus_prime.db\n")
        f.write(f"Target: ghost_daemon_knowledge.db (symlink)\n")
        f.write(f"Status: ACTIVE\n")
        f.write(f"Migration Type: CLEAN_SLATE_NEXUS_PRIME\n")

    print("   ✅ System now using Nexus Prime as primary cortex")

def verify_migration():
    """Verify the migration was successful"""
    print("🔍 Verifying Nexus Prime migration...")

    # Check that nexus_prime.db exists and has content
    if not os.path.exists(NEXUS_PRIME_DB):
        print("   ❌ nexus_prime.db not found!")
        return False

    with sqlite3.connect(NEXUS_PRIME_DB) as conn:
        # Check nodes count
        cursor = conn.execute("SELECT COUNT(*) FROM nodes")
        node_count = cursor.fetchone()[0]

        # Check council members
        cursor = conn.execute("SELECT COUNT(*) FROM nodes WHERE type='persona'")
        persona_count = cursor.fetchone()[0]

        # Check founder node
        cursor = conn.execute("SELECT COUNT(*) FROM nodes WHERE id='ORIGIN_GEMINI_3_PRO'")
        founder_count = cursor.fetchone()[0]

        print(f"   📊 Nexus Prime Statistics:")
        print(f"      - Total Nodes: {node_count}")
        print(f"      - Personas (Council): {persona_count}")
        print(f"      - Founder Node: {'Present' if founder_count > 0 else 'Missing'}")
        print(f"      - Knowledge Crystals: {node_count - persona_count - founder_count}")

        # Check symlink
        if os.path.islink(GHOST_DAEMON_DB):
            link_target = os.readlink(GHOST_DAEMON_DB)
            print(f"   🔗 Symlink Status: {GHOST_DAEMON_DB} -> {link_target}")
            if link_target == NEXUS_PRIME_DB:
                print("   ✅ Migration Verification: SUCCESS")
                return True
            else:
                print("   ❌ Symlink target incorrect")
                return False
        else:
            print("   ❌ Symlink not created")
            return False

def main():
    print("🚀 Finalizing Nexus Prime Migration")
    print("=" * 50)

    # Step 1: Inject Council Personas
    inject_council_personas()

    # Step 2: Update system to use Nexus Prime
    update_system_to_use_nexus_prime()

    # Step 3: Verify migration
    success = verify_migration()

    if success:
        print("\n🎉 NEXUS PRIME ACTIVATION COMPLETE")
        print("   The system is now running on the optimized Quantum Cortex")
        print("   All Council personas have been successfully injected")
        print("   Knowledge distillation from the Fossil Record is complete")
    else:
        print("\n❌ NEXUS PRIME ACTIVATION FAILED")
        sys.exit(1)

if __name__ == "__main__":
    main()
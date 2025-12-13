
import json
import sqlite3
import hashlib
import time
import uuid
import requests
from typing import Dict, List, Optional
from dataclasses import dataclass
from fastapi import FastAPI, HTTPException
import uvicorn
import threading
from .kernel import trace_step

# --- TRACE SCHEMA ---
@dataclass
class FederatedTrace:
    trace_id: str
    intent: str
    steps: List[Dict]
    outcome: str
    confidence: float
    timestamp: float
    instance_id: str
    signature: str

    def to_dict(self):
        return {
            "trace_id": self.trace_id,
            "intent": self.intent,
            "steps": self.steps,
            "outcome": self.outcome,
            "confidence": self.confidence,
            "timestamp": self.timestamp,
            "instance_id": self.instance_id,
            "signature": self.signature
        }

# --- FEDERATION SERVER ---
class FederationServer:
    def __init__(self, host="0.0.0.0", port=9000):
        self.app = FastAPI(title="G-OS Federation Hive")
        self.host = host
        self.port = port
        self.registry: Dict[str, Dict] = {} # In-memory for proof; would be DB
        self._setup_routes()

    def _setup_routes(self):
        @self.app.post("/publish")
        async def publish_skill(trace: dict):
            # Validate
            if trace.get("confidence", 0) < 0.9:
                raise HTTPException(status_code=400, detail="Confidence too low for Federation")
            
            tid = trace.get("trace_id")
            if tid in self.registry:
                return {"status": "exists", "msg": "Skill already in Hive"}
            
            # Verify Signature (Mock)
            if not self._verify_signature(trace):
                raise HTTPException(status_code=403, detail="Invalid Signature")
                
            self.registry[tid] = trace
            print(f"🐝  Hive: New Skill Assimilated [{trace.get('intent')}] from {trace.get('instance_id')}")
            return {"status": "assimilated", "hive_size": len(self.registry)}

        @self.app.get("/sync")
        async def sync_skills(since: float = 0):
            # Return skills newer than 'since'
            new_skills = [s for s in self.registry.values() if s.get("timestamp") > since]
            return {"skills": new_skills}

    def _verify_signature(self, trace):
        # In prod: Verify public key signature
        # In proof: Check if signature exists
        return "signature" in trace and len(trace["signature"]) > 0

    def start(self):
        config = uvicorn.Config(self.app, host=self.host, port=self.port, log_level="error")
        server = uvicorn.Server(config)
        t = threading.Thread(target=server.run, daemon=True)
        t.start()
        print(f"🐝  Federation Hive Online at http://{self.host}:{self.port}")


# --- LOCAL FEDERATION CLIENT ---
class FederationClient:
    def __init__(self, nexus_db, instance_id, hive_url="http://localhost:9000"):
        self.nexus_db = nexus_db # DatabaseManager
        self.instance_id = instance_id
        self.hive_url = hive_url
        self.last_sync = 0

    def publish_local_skills(self):
        """Push high-confidence traces to the Hive"""
        conn = self.nexus_db.get_connection()
        cursor = conn.cursor()
        
        # Select Verified High-Conf Traces
        cursor.execute('''
            SELECT * FROM traces 
            WHERE confidence > 0.9 AND verified = 1
        ''')
        
        count = 0
        for row in cursor.fetchall():
            # (id, intent, steps, outcome, confidence, timestamp, verified)
            trace_dict = {
                "trace_id": row[0],
                "intent": row[1],
                "steps": json.loads(row[2]),
                "outcome": row[3],
                "confidence": row[4],
                "timestamp": row[5],
                "instance_id": self.instance_id,
                "signature": self._sign(row[0])
            }
            
            try:
                res = requests.post(f"{self.hive_url}/publish", json=trace_dict)
                if res.status_code == 200:
                    count += 1
            except:
                print("⚠️  Hive Unreachable")
                return 0
        
        return count

    def sync_from_hive(self):
        """Pull new skills from the Hive"""
        try:
            res = requests.get(f"{self.hive_url}/sync", params={"since": self.last_sync})
            if res.status_code == 200:
                skills = res.json()["skills"]
                for s in skills:
                    # Don't import own skills
                    if s["instance_id"] == self.instance_id:
                        continue
                        
                    # Import into Local Nexus
                    hydrated_steps = [trace_step(s["tool"], s.get("args",{}), s.get("result", "")) for s in s["steps"]]
                    
                    self.nexus_db.store_trace({
                        "id": s["trace_id"],
                        "intent": s["intent"],
                        "steps": hydrated_steps,
                        "outcome": s["outcome"],
                        "confidence": s["confidence"],
                        "verified": 1 # Trusted from Hive
                    })
                    # Update local nodes for intent/outcome if needed (skipped for brevity)
                    
                if skills:
                    self.last_sync = max(s["timestamp"] for s in skills)
                    return len(skills)
        except Exception as e:
            print(f"⚠️  Sync Failed: {e}")
        return 0

    def _sign(self, payload):
        # Mock Crypto Sign
        return hashlib.sha256(f"{payload}:{self.instance_id}".encode()).hexdigest()

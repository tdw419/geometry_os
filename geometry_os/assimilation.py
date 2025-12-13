
import os
import sys
import argparse
import numpy as np
from typing import List
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# Ensure we can import from geometry_os
sys.path.append(os.getcwd())

from geometry_os.nexus import Nexus, EdgeType
# from geometry_os.persistence import DatabaseManager # Nexus wraps this

class Assimilator:
    """
    The Great Assimilator.
    Ingests the legacy codebase into the Geometric Nexus.
    """
    def __init__(self, nexus_path="nexus.db"):
        self.nexus = Nexus(nexus_path)
        self.vectorizer = TfidfVectorizer(stop_words='english', max_features=32)
        self.docs = []
        self.ids = []

    def assimilate_directory(self, root_dir="src/"):
        print(f"🌌  Initiating Assimilation of '{root_dir}'...")
        
        # 1. Crawl
        files_to_ingest = []
        for root, _, files in os.walk(root_dir):
            for file in files:
                if file.endswith(".py"):
                    full_path = os.path.join(root, file)
                    files_to_ingest.append(full_path)
        
        print(f"    -> Identified {len(files_to_ingest)} artifacts.")

        # 2. Vectorize (Batch)
        print("    -> Vectorizing content...")
        contents = []
        for fpath in files_to_ingest:
            try:
                with open(fpath, 'r', encoding='utf-8') as f:
                    contents.append(f.read())
            except Exception as e:
                print(f"⚠️  Skipping {fpath}: {e}")
                contents.append("") # Placeholder
        
        # Fit TF-IDF
        if not contents:
            print("❌  No content to assimilate.")
            return

        tfidf_matrix = self.vectorizer.fit_transform(contents)
        dense_vectors = tfidf_matrix.toarray()

        # 3. Ingest Nodes
        print("    -> Ingesting Nodes into Nexus...")
        for i, fpath in enumerate(files_to_ingest):
            content = contents[i]
            if not content: continue
            
            vec = dense_vectors[i]
            relative_path = os.path.relpath(fpath, os.getcwd())
            
            node = self.nexus.ingest(
                content=content,
                type="code",
                metadata={"path": relative_path, "source": "mass_assimilation"}
            )
            # Update vector manually since ingest mock usage usually doesn't do batch tf-idf
            node.vector = vec
            # Persist vector update (hacky for L0)
            self.nexus.db.store_node({
                "id": node.id,
                "type": node.type,
                "content": node.content,
                "metadata": node.metadata,
                "vector": node.vector,
                "provenance": "assimilation_v1"
            })
            
            self.ids.append(node.id)
            self.docs.append(vec)
            
            if i % 10 == 0:
                print(f"       Processed {i}/{len(files_to_ingest)}...", end="\r")

        print(f"    -> Ingested {len(self.ids)} Nodes.")

        # 4. Weave Connections
        print("\n🕸️  Weaving Semantic Web...")
        count = 0
        limit = len(self.ids)
        # O(N^2) naive weaving - acceptable for < 1000 files
        for i in range(limit):
            for j in range(i+1, limit):
                sim = cosine_similarity([self.docs[i]], [self.docs[j]])[0][0]
                if sim > 0.5: # Semantic Threshold
                    self.nexus.connect(self.ids[i], self.ids[j], EdgeType.SEMANTIC, strength=float(sim))
                    count += 1
        
        print(f"    -> Woven {count} Semantic Edges.")
        print("✨  Assimilation Complete.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dir", default="src")
    parser.add_argument("--db", default="geometry_os/demos/persistent_demo.db") # Default to our working DB
    args = parser.parse_args()
    
    assimilator = Assimilator(args.db)
    assimilator.assimilate_directory(args.dir)

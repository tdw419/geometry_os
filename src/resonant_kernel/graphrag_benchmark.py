import numpy as np
# import torch  # Unused here but available for real embeddings
from sklearn.metrics.pairwise import cosine_similarity
import networkx as nx
import time

# Toy dataset: Simulate codebase chunks with embeddings (random for demo; in real: use sentence-transformers)
np.random.seed(42)
chunks = [
    "Login logic: User authentication via JWT",
    "Security protocols: Encrypt sensitive data with AES",
    "CSS Styles: UI for login page",
    "Encryption Keys: Manage AES keys securely",
    "Database config: Store user sessions",
    "Tests: Unit test for login failure"
]
# Fake embeddings: 5D for simplicity
embeddings = np.random.rand(len(chunks), 5).astype(np.float32)

# Build baseline RAG retriever
def baseline_rag(query_emb, k=3):
    sims = cosine_similarity([query_emb], embeddings)[0]
    top_indices = np.argsort(sims)[-k:][::-1]
    return [chunks[i] for i in top_indices], sims[top_indices]

# Build simple GraphRAG: Entities as nodes, relations as edges
G = nx.Graph()
for i, chunk in enumerate(chunks):
    G.add_node(i, text=chunk)

# Add relations (manual for toy: e.g., login -> security, etc.)
relations = [(0,1), (0,3), (1,3), (2,0), (4,0), (5,0)]  # login connects to most
G.add_edges_from(relations)

def graphrag_retrieve(query_emb, k=3):
    # Step 1: Vector similarity to seed nodes
    sims = cosine_similarity([query_emb], embeddings)[0]
    seed_nodes = np.argsort(sims)[-5:]  # Top 5 seeds
    
    # Step 2: Traverse graph (e.g., neighbors within 2 hops)
    relevant_nodes = set()
    for seed in seed_nodes:
        if seed in G:
             relevant_nodes.add(seed)
             try:
                for neighbor in nx.ego_graph(G, seed, radius=2).nodes():
                    relevant_nodes.add(neighbor)
             except Exception:
                 pass
    
    if not relevant_nodes:
        return [], []

    # Step 3: Rank by avg similarity in subgraph
    relevant_list = list(relevant_nodes)
    subgraph_embs = embeddings[relevant_list]
    subgraph_sims = cosine_similarity([query_emb], subgraph_embs)[0]
    
    # Sort
    sorted_pairs = sorted(zip(relevant_list, subgraph_sims), key=lambda x: x[1], reverse=True)[:k]
    
    top_indices = [p[0] for p in sorted_pairs]
    top_sims = [p[1] for p in sorted_pairs]
    
    return [G.nodes[i]['text'] for i in top_indices], top_sims

# Sample queries with ground truth relevant chunks indices
queries = [
    ("Refactor login", [0,1,3,4,5]),  # Multi-hop: login + deps
    ("Secure CSS", [2,0,1])  # Simple: CSS + login deps
]
query_embs = np.random.rand(len(queries), 5).astype(np.float32)  # Fake query embs

# Ground truth recall function
def recall(retrieved_indices, gt_indices, k=3):
    retrieved_set = set(retrieved_indices[:k])
    gt_set = set(gt_indices)
    if len(gt_set) == 0: return 0.0
    return len(retrieved_set & gt_set) / len(gt_set)

# Benchmark
if __name__ == "__main__":
    print("Running Benchmark...")
    print(f"{'Query':<20} | {'Base Rec':<10} | {'Base Time':<10} | {'Graph Rec':<10} | {'Graph Time':<10}")
    print("-" * 75)
    
    for i, (q, gt) in enumerate(queries):
        q_emb = query_embs[i]
        
        # Baseline
        start = time.time()
        base_ret, base_sims = baseline_rag(q_emb)
        base_time = time.time() - start
        try:
            base_gt_idx = [chunks.index(r) for r in base_ret[:3]]
            base_recall = recall(base_gt_idx, gt)
        except:
            base_recall = 0.0

        # GraphRAG
        start = time.time()
        graph_ret, graph_sims = graphrag_retrieve(q_emb)
        graph_time = time.time() - start
        try:
            graph_gt_idx = [chunks.index(r) for r in graph_ret[:3]]
            graph_recall = recall(graph_gt_idx, gt)
        except:
            graph_recall = 0.0
        
        # Print row
        print(f"{q:<20} | {base_recall:<10.2f} | {base_time:<10.5f} | {graph_recall:<10.2f} | {graph_time:<10.5f}")

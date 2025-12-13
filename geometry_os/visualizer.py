
import json
import networkx as nx
import plotly.graph_objects as go
from geometry_os.nexus import Nexus

class NexusVisualizer:
    def __init__(self, nexus: Nexus):
        self.nexus = nexus

    def generate_3d_state(self) -> str:
        """Create interactive 3D representation of the Nexus"""
        G = self.nexus.graph
        
        # 3D Spring Layout
        pos = nx.spring_layout(G, dim=3, seed=42)

        # Edges
        edge_x, edge_y, edge_z = [], [], []
        for edge in G.edges():
            x0, y0, z0 = pos[edge[0]]
            x1, y1, z1 = pos[edge[1]]
            edge_x.extend([x0, x1, None])
            edge_y.extend([y0, y1, None])
            edge_z.extend([z0, z1, None])

        edge_trace = go.Scatter3d(
            x=edge_x, y=edge_y, z=edge_z,
            mode='lines',
            line=dict(width=2, color='#888'),
            hoverinfo='none'
        )

        # Nodes
        node_x, node_y, node_z = [], [], []
        node_text = []
        node_colors = []
        node_sizes = [] # Based on type or connection count

        for node in G.nodes():
            x, y, z = pos[node]
            node_x.append(x)
            node_y.append(y)
            node_z.append(z)
            
            # Metadata
            data = G.nodes[node]
            ntype = data.get("type", "obj")
            content = data.get("content", "")[:50]
            node_text.append(f"Type: {ntype}<br>ID: {node[:8]}<br>Content: {content}...")
            
            # Styling
            if ntype == "code": 
                node_colors.append('#00ff00') # Matrix Green
                node_sizes.append(10)
            elif ntype == "trace":
                node_colors.append('#ff00ff') # Neon Purple
                node_sizes.append(15)
            elif ntype == "trace_step":
                 node_colors.append('#00ffff') # Cyan
                 node_sizes.append(5)
            else:
                node_colors.append('#ffffff') # White
                node_sizes.append(8)

        node_trace = go.Scatter3d(
            x=node_x, y=node_y, z=node_z,
            mode='markers',
            marker=dict(
                size=node_sizes,
                color=node_colors,
                line=dict(width=2, color='DarkSlateGrey'),
                opacity=0.9
            ),
            text=node_text,
            hoverinfo='text'
        )
        
        # Configure Layout
        layout = go.Layout(
            title="Geometric Nexus (Live State)",
            showlegend=False,
            scene=dict(
                xaxis=dict(showticklabels=False, title=''),
                yaxis=dict(showticklabels=False, title=''),
                zaxis=dict(showticklabels=False, title=''),
                bgcolor='rgb(10,10,10)'
            ),
            margin=dict(r=0, l=0, b=0, t=30),
            paper_bgcolor='rgb(10,10,10)',
            font=dict(color='white')
        )

        fig = go.Figure(data=[edge_trace, node_trace], layout=layout)
        return fig.to_json()

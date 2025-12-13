
import sys
import importlib.abc
import importlib.util
import sqlite3
import os
import json

# Ensure we can find the Nexus locally
sys.path.append(os.getcwd())
from geometry_os.nexus import Nexus

class NexusImporter(importlib.abc.MetaPathFinder, importlib.abc.Loader):
    """
    The Holographic Loader.
    Allows Python to import modules that exist ONLY in the Nexus Graph.
    """
    def __init__(self, db_path):
        self.db_path = db_path
        self.nexus = Nexus(db_path)
    
    def find_spec(self, fullname, path, target=None):
        # 1. Search Nexus for a node with path matching the module
        # Module 'geometry_os.virtual.test' -> Look for 'geometry_os/virtual/test.py'

        # We need a robust query. For now, let's assume flat or mapped paths.
        # Let's search by content metadata "path"

        # Heuristic: convert dot module to slash path
        rel_path = fullname.replace(".", "/") + ".py"

        # Check if node exists
        # We need to query by metadata. Since metadata is JSON string, this is tricky in SQLite.
        # But we can iterate or use a specialized query if we indexed it.
        # For prototype, let's look for nodes with type='code'/ 'virtual_module' and 'name'=fullname

        node = self._find_node_by_module_name(fullname)

        if node:
            print(f"✨ NexusLoader: Found '{fullname}' in the Graph! (ID: {node['id'][:8]})")
            return importlib.util.spec_from_loader(fullname, self)

        print(f"🔍 NexusLoader: '{fullname}' not found in Graph, falling back to filesystem")
        return None
    
    def create_module(self, spec):
        return None # Default behavior

    def exec_module(self, module):
        fullname = module.__name__
        node = self._find_node_by_module_name(fullname)
        
        if not node:
            raise ImportError(f"Nexus lost the node for {fullname} during loading.")
            
        code_content = node["content"]
        source_path = f"nexus://{node['id']}" # Virtual path
        
        print(f"    -> Compiling hologram for '{fullname}'...")
        exec(code_content, module.__dict__)
        module.__file__ = source_path
        
    def _find_node_by_module_name(self, fullname):
        # Search the DB
        # Only support 'virtual_module' type for safety first, or 'code' if indexed
        with sqlite3.connect(self.db_path) as conn:
            # Try to match metadata containing the module name
            cur = conn.execute("SELECT * FROM nodes WHERE type='virtual_module'", ())
            for row in cur.fetchall():
                cols = [c[0] for c in cur.description]
                node_dict = dict(zip(cols, row))
                # Parse metadata JSON to find name
                try:
                    metadata = json.loads(node_dict['metadata'])
                    if metadata.get('name') == fullname or metadata.get('module_name') == fullname:
                        print(f"🎯 NexusLoader: Found module '{fullname}' in metadata")
                        return node_dict
                except Exception as e:
                    print(f"⚠️  Error parsing metadata: {e}")
                    continue
        print(f"🔍 NexusLoader: No virtual_module found for '{fullname}'")
        return None

def install_hook(db_path="geometry_os/demos/persistent_demo.db"):
    # Avoid duplicates
    for hook in sys.meta_path:
        if isinstance(hook, NexusImporter):
            return
            
    print("🔌 Installing Nexus Holographic Loader...")
    sys.meta_path.insert(0, NexusImporter(db_path))


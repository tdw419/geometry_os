#!/usr/bin/env python3
"""
GeometryFS - FUSE Filesystem for Geometry OS
Mounts the Nexus database as a Linux filesystem
"""

import os
import sys
import time
import sqlite3
import json
import stat
import errno
from typing import Dict, List, Optional, Tuple

# Add project root to path
sys.path.append(os.getcwd())

from geometry_os.nexus import Nexus
from geometry_os.persistence import DatabaseManager

# Check for FUSE dependencies
try:
    from fuse import FUSE, FuseOSError, Operations
except ImportError:
    print("⚠️  FUSE library not found. Install with: pip install fuse-python")
    print("    This is required for mounting GeometryFS")
    sys.exit(1)

class GeometryFS(Operations):
    """
    FUSE Operations for Geometry OS Filesystem
    Translates filesystem operations to Nexus database queries
    """

    def __init__(self, db_path="geometry_os/demos/persistent_demo.db"):
        self.db_path = db_path
        self.nexus = Nexus(db_path)
        self.db = DatabaseManager(db_path)

        # Create root directory structure if it doesn't exist
        self._ensure_root_structure()

        print(f"🌲 GeometryFS initialized with database: {db_path}")

    def _ensure_root_structure(self):
        """Ensure basic filesystem structure exists in Nexus"""
        with sqlite3.connect(self.db_path) as conn:
            # Check if we have any filesystem nodes
            cursor = conn.execute("SELECT COUNT(*) FROM nodes WHERE type='filesystem'")
            if cursor.fetchone()[0] == 0:
                print("🌱 Creating root filesystem structure...")
                # Create root directory
                self.db.store_node({
                    "id": "fs_root",
                    "type": "filesystem",
                    "content": "",
                    "metadata": {
                        "path": "/",
                        "name": "/",
                        "type": "directory",
                        "permissions": "755",
                        "created_at": time.time()
                    },
                    "vector": [],
                    "provenance": "geometry_fs"
                })

    def _get_node_by_path(self, path: str) -> Optional[Dict]:
        """Get Nexus node by filesystem path"""
        with sqlite3.connect(self.db_path) as conn:
            # Clean path and ensure it starts with /
            clean_path = path.strip('/')
            if not clean_path:
                clean_path = '/'

            # Search for nodes with matching path
            cursor = conn.execute("""
                SELECT * FROM nodes
                WHERE type='filesystem' AND metadata LIKE ?
            """, (f'%{clean_path}%',))

            for row in cursor.fetchall():
                cols = [c[0] for c in cursor.description]
                node_dict = dict(zip(cols, row))
                try:
                    metadata = json.loads(node_dict['metadata'])
                    if metadata.get('path') == path:
                        return node_dict
                except:
                    continue
        return None

    def _create_node(self, path: str, content: str = "", is_dir: bool = False) -> Dict:
        """Create a new filesystem node in Nexus"""
        node_id = f"fs_{int(time.time())}_{path.replace('/', '_')}"
        node_type = "directory" if is_dir else "file"

        node_data = {
            "id": node_id,
            "type": "filesystem",
            "content": content,
            "metadata": {
                "path": path,
                "name": os.path.basename(path) if path != '/' else '/',
                "type": node_type,
                "permissions": "755" if is_dir else "644",
                "created_at": time.time(),
                "modified_at": time.time()
            },
            "vector": [],
            "provenance": "geometry_fs"
        }

        self.db.store_node(node_data)
        return node_data

    # FUSE Operations Implementation

    def getattr(self, path, fh=None):
        """Get file/directory attributes"""
        node = self._get_node_by_path(path)

        if node is None:
            raise FuseOSError(errno.ENOENT)

        metadata = json.loads(node['metadata'])
        st = {
            'st_atime': metadata.get('accessed_at', time.time()),
            'st_ctime': metadata.get('created_at', time.time()),
            'st_mtime': metadata.get('modified_at', time.time()),
            'st_mode': 0,
            'st_nlink': 1,
            'st_size': len(node['content']) if node['content'] else 0,
            'st_uid': os.getuid(),
            'st_gid': os.getgid()
        }

        if metadata['type'] == 'directory':
            st['st_mode'] = stat.S_IFDIR | 0o755
            st['st_nlink'] = 2
        else:
            st['st_mode'] = stat.S_IFREG | 0o644

        return st

    def readdir(self, path, fh):
        """Read directory contents"""
        # Always show . and ..
        yield '.'
        yield '..'

        # Find all nodes under this path
        with sqlite3.connect(self.db_path) as conn:
            # Find path prefix
            prefix = path.strip('/') + '/' if path != '/' else ''

            cursor = conn.execute("""
                SELECT metadata FROM nodes
                WHERE type='filesystem'
            """)

            for row in cursor.fetchall():
                try:
                    metadata = json.loads(row[0])
                    node_path = metadata['path']

                    # Check if this node is directly under the requested path
                    if node_path.startswith(path) and node_path != path:
                        # Get the relative part
                        relative = node_path[len(path):].strip('/')
                        if '/' not in relative:  # Only immediate children
                            yield relative
                except:
                    continue

    def read(self, path, size, offset, fh):
        """Read file content"""
        node = self._get_node_by_path(path)

        if node is None:
            raise FuseOSError(errno.ENOENT)

        content = node['content']
        return content[offset:offset+size].encode()

    def write(self, path, data, offset, fh):
        """Write to file"""
        node = self._get_node_by_path(path)

        if node is None:
            # Create new file
            node = self._create_node(path, data.decode())
            return len(data)

        # Update existing file
        content = node['content']
        if offset == 0:
            # Overwrite
            new_content = data.decode()
        else:
            # Append/insert
            before = content[:offset]
            after = content[offset:]
            new_content = before + data.decode() + after

        # Update node
        metadata = json.loads(node['metadata'])
        metadata['modified_at'] = time.time()
        metadata['size'] = len(new_content)

        with sqlite3.connect(self.db_path) as conn:
            conn.execute("""
                UPDATE nodes
                SET content = ?, metadata = ?
                WHERE id = ?
            """, (new_content, json.dumps(metadata), node['id']))
            conn.commit()

        return len(data)

    def create(self, path, mode, fi=None):
        """Create new file"""
        # Check if parent directory exists
        parent_path = os.path.dirname(path)
        if parent_path != '/' and self._get_node_by_path(parent_path) is None:
            raise FuseOSError(errno.ENOENT)

        # Create the file
        node = self._create_node(path, "", is_dir=False)

        # Open the file
        return self.open(path, os.O_WRONLY)

    def mkdir(self, path, mode):
        """Create directory"""
        # Check if parent directory exists
        parent_path = os.path.dirname(path)
        if parent_path != '/' and self._get_node_by_path(parent_path) is None:
            raise FuseOSError(errno.ENOENT)

        # Create the directory
        self._create_node(path, is_dir=True)
        return 0

    def open(self, path, flags):
        """Open file"""
        node = self._get_node_by_path(path)

        if node is None:
            raise FuseOSError(errno.ENOENT)

        if json.loads(node['metadata'])['type'] == 'directory':
            raise FuseOSError(errno.EISDIR)

        return 0

    def unlink(self, path):
        """Delete file"""
        with sqlite3.connect(self.db_path) as conn:
            conn.execute("""
                DELETE FROM nodes
                WHERE type='filesystem' AND metadata LIKE ?
            """, (f'%{path}%',))
            conn.commit()
        return 0

    def rmdir(self, path):
        """Remove directory"""
        # Check if directory is empty
        children = list(self.readdir(path, None))
        if len(children) > 2:  # More than . and ..
            raise FuseOSError(errno.ENOTEMPTY)

        # Delete the directory
        with sqlite3.connect(self.db_path) as conn:
            conn.execute("""
                DELETE FROM nodes
                WHERE type='filesystem' AND metadata LIKE ?
            """, (f'%{path}%',))
            conn.commit()
        return 0

def mount_geometry_fs(mount_point: str, db_path: str = "geometry_os/demos/persistent_demo.db"):
    """
    Mount GeometryFS at the specified mount point
    """
    if not os.path.exists(mount_point):
        os.makedirs(mount_point)
        print(f"📁 Created mount point: {mount_point}")

    print(f"🔌 Mounting GeometryFS at {mount_point}...")
    print(f"   Database: {db_path}")
    print(f"   Access your Nexus as a filesystem!")

    fuse = FUSE(
        GeometryFS(db_path),
        mount_point,
        nothreads=True,
        foreground=True,
        allow_other=True
    )

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 geometry_fs.py <mount_point> [db_path]")
        print("Example: python3 geometry_fs.py /mnt/geometry_os")
        sys.exit(1)

    mount_point = sys.argv[1]
    db_path = sys.argv[2] if len(sys.argv) > 2 else "geometry_os/demos/persistent_demo.db"

    mount_geometry_fs(mount_point, db_path)
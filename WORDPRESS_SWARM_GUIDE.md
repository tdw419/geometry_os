# 🐝 Geometry OS: WordPress Swarm Node Guide

This document outlines the architecture, installation, and operation of **WordPress Swarm Nodes** within the Geometry OS ecosystem.

## 📖 Overview

The WordPress Swarm Node system transforms standard WordPress installations into **distributed semantic compute nodes**. By leveraging the ubiquity of WordPress, Geometry OS can expand its "Screen is the Hard Drive" philosophy to any web server, using WordPress posts as a human-readable, searchable memory substrate.

### Core Capabilities
*   **Semantic Storage**: Store AI memories, logs, and research documents as WordPress posts.
*   **Memory Retrieval**: Query distributed memory across multiple WordPress "districts."
*   **Content Intelligence**: Analyze site content and generate evolution proposals.
*   **Auto-Discovery**: Nodes automatically join the cluster via UDP broadcast and file-based heartbeats.

---

## 🚀 Remote Installation

To turn a remote WordPress instance into a Swarm Node, use one of the following methods.

### Method 1: Automated Setup (Recommended)
Use the included setup script to handle installation and permissions automatically.

1.  **From your main node, send the script:**
    ```bash
    scp systems/swarm/setup_wp_swarm_node.sh user@remote-ip:/tmp/
    ```

2.  **Execute on the remote machine:**
    ```bash
    ssh user@remote-ip
    sudo /tmp/setup_wp_swarm_node.sh --secret "YOUR_SECRET" --wp-path /var/www/html
    ```

### Method 2: Zero-File One-Liner
If you don't have direct access to the `systems/swarm` directory, copy and paste this command into the remote terminal:

```bash
# Configuration
WP_PATH="/var/www/html" # Change to your WordPress path

# Create and Install
sudo mkdir -p "$WP_PATH/wp-content/plugins/geometry-os-swarm-node"
sudo cat > "$WP_PATH/wp-content/plugins/geometry-os-swarm-node/geometry-os-swarm-node.php" << 'EOF'
<?php
/* Plugin Name: Geometry OS Swarm Node
 * Description: Turns WordPress into a Geometry OS Swarm Node
 * Version: 1.0
 */
if (!defined('ABSPATH')) exit;
class GeometryOS_SwarmNode {
    private $node_id;
    private $capabilities = ['content_intelligence', 'semantic_storage', 'memory_retrieval'];
    public function __construct() {
        $this->node_id = get_option('geoos_node_id') ?: 'wp-' . substr(md5(site_url().time()), 0, 8);
        update_option('geoos_node_id', $this->node_id);
        add_action('rest_api_init', [$this, 'register_routes']);
        add_action('init', [$this, 'heartbeat']);
    }
    public function register_routes() {
        register_rest_route('geoos/v1', '/node', ['methods'=>'GET', 'callback'=>fn()=>['node_id'=>$this->node_id,'type'=>'wordpress','capabilities'=>$this->capabilities, 'status'=>'active','site_url'=>site_url(),'posts_count'=>wp_count_posts()->publish], 'permission_callback'=>'__return_true']);
        register_rest_route('geoos/v1', '/memory/query', ['methods'=>'POST', 'callback'=>function($r){$q=json_decode($r->get_body(),true)['query']??'';return['query'=>$q,'results'=>array_map(fn($p)=>['id'=>$p->ID,'title'=>$p->post_title,'excerpt'=>wp_trim_words($p->post_content,20)],get_posts(['s'=>$q,'posts_per_page'=>10]))];},'permission_callback'=>'__return_true']);
        register_rest_route('geoos/v1', '/task', ['methods'=>'POST', 'callback'=>function($r){$t=json_decode($r->get_body(),true);if(($t['type']??'')==='semantic_storage'){$id=wp_insert_post(['post_title'=>$t['title'],'post_content'=>$t['content'],'post_status'=>'publish']);return['status'=>'success','post_id'=>$id];}return['status'=>'error'];},'permission_callback'=>'__return_true']);
    }
    public function heartbeat() {
        if (time()-get_option('geoos_last_heartbeat',0)<30) return;
        update_option('geoos_last_heartbeat', time());
        $dir=WP_CONTENT_DIR.'/uploads/geoos-discovery';
        wp_mkdir_p($dir);
        file_put_contents("$dir/node-{$this->node_id}.json", json_encode(['type'=>'swarm_discovery','node_id'=>$this->node_id,'node_type'=>'wordpress','capabilities'=>$this->capabilities,'url'=>site_url(),'api_url'=>rest_url('geoos/v1'),'timestamp'=>time()]));
    }
}
new GeometryOS_SwarmNode();
EOF
echo "✅ Plugin installed. Please activate it in the WordPress Admin dashboard."
```

---

## 🐝 Cluster Management

The cluster is managed by the **Discovery Daemon** on your main node.

### Check Cluster Status
View all discovered nodes and their health:
```bash
python3 systems/swarm/wp_discovery_daemon.py --status
```

### Discovery Daemon Controls
*   **Start**: `python3 systems/swarm/wp_discovery_daemon.py --start`
*   **Stop**: `python3 systems/swarm/wp_discovery_daemon.py --stop`
*   **Foreground (Debug)**: `python3 systems/swarm/wp_discovery_daemon.py --foreground`

---

## 🛠️ Developer Interface (Python)

Integrate with the swarm using the `WordPressSwarmBridge`:

```python
from systems.swarm.wp_node_discovery import WordPressSwarmBridge

# Initialize Bridge
bridge = WordPressSwarmBridge(shared_secret="YOUR_SECRET")
await bridge.start()

# Wait for node discovery
await asyncio.sleep(2)

# Store memory on the swarm
result = await bridge.store_memory(
    title="Neural Substrate Update",
    content="<p>Phase 25 stability check: Optimal.</p>"
)

# Distributed search
memories = await bridge.query_memory("stability")
print(f"Found {memories['total_count']} results.")
```

---

## ⚙️ Requirements & Troubleshooting

### Requirements
*   **PHP 8.3+** (Recommended)
*   **PHP Sockets Extension** (Required for UDP discovery)
*   **WordPress 6.0+**

### Troubleshooting
1.  **Node not discovered?** 
    *   Ensure the `sockets` extension is enabled in `php.ini`.
    *   Check if `wp-content/uploads/geoos-discovery/` is writable.
    *   Restart the discovery daemon: `python3 systems/swarm/wp_discovery_daemon.py --stop` then `--start`.
2.  **API 404 Errors?** 
    *   Ensure WordPress Permalinks are enabled (Settings -> Permalinks).
    *   The bridge automatically handles `rest_route` query parameters if pretty permalinks are disabled.

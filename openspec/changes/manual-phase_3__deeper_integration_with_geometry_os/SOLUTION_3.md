# Solution for Task: **Task 1**: Deliverable 1: Complete Phase 3: Deeper Integration with Geometry OS

Here is the implementation plan for **Phase 3: Deeper Integration with Geometry OS**.

This phase focuses on creating functional "System Applications" (Console, File Explorer) and establishing the protocol for the **Rust Backend** to drive the UI.

### 1. File Paths

**New Files (Frontend/JavaScript)**
*   `src/apps/ConsoleApp.js` (Logic for capturing and displaying logs)
*   `src/apps/FileExplorerApp.js` (Logic for rendering file trees)
*   `src/apps/AppRegistry.js` (Central registry mapping window types to components)

**Modified Files**
*   `src/core/WindowManager.js` (To handle external commands and dynamic app loading)
*   `src/index.css` (Styling for console output and file lists)

**New Files (Backend/Rust)**
*   `backend/src/window_api.rs` (Module defining the structure of window commands)

---

### 2. Code Implementation

#### A. Frontend: Real-time Console (`src/apps/ConsoleApp.js`)
This component overrides the native `console.log` to capture messages and render them into the Geometry OS window content.

```javascript
import React, { useEffect, useState, useRef } from 'react';

export const ConsoleApp = ({ id }) => {
  const [logs, setLogs] = useState([]);
  const logContainerRef = useRef(null);

  useEffect(() => {
    // 1. Capture original console.log
    const originalLog = console.log;

    // 2. Override console.log to intercept messages
    console.log = (...args) => {
      // Call original to keep browser console working
      originalLog(...args); 
      
      // Format output (handle objects/strings)
      const message = args.map(arg => 
        typeof arg === 'object' ? JSON.stringify(arg) : String(arg)
      ).join(' ');

      // Add timestamp
      const timestamp = new Date().toLocaleTimeString();
      
      setLogs(prev => [...prev, { time: timestamp, text: message }]);
    };

    // Cleanup: Restore original log on unmount
    return () => {
      console.log = originalLog;
    };
  }, []);

  // Auto-scroll to bottom
  useEffect(() => {
    if (logContainerRef.current) {
      logContainerRef.current.scrollTop = logContainerRef.current.scrollHeight;
    }
  }, [logs]);

  return (
    <div style={{ padding: '10px', fontFamily: 'monospace', height: '100%', overflow: 'auto', background: '#1e1e1e', color: '#d4d4d4' }} ref={logContainerRef}>
      {logs.map((log, index) => (
        <div key={index} style={{ marginBottom: '4px', borderBottom: '1px solid #333' }}>
          <span style={{ color: '#569cd6' }}>[{log.time}]</span> <span style={{ color: '#d4d4d4' }}>{log.text}</span>
        </div>
      ))}
      {logs.length === 0 && <div>Waiting for system logs...</div>}
    </div>
  );
};
```

#### B. Frontend: File Explorer (`src/apps/FileExplorerApp.js`)
This component renders a mock file tree.

```javascript
import React, { useState } from 'react';

export const FileExplorerApp = () => {
  // Mock file structure
  const [fileSystem] = useState([
    { name: 'src', type: 'folder', children: [
        { name: 'core', type: 'folder' },
        { name: 'apps', type: 'folder' },
        { name: 'index.js', type: 'file' }
    ]},
    { name: 'assets', type: 'folder' },
    { name: 'Cargo.toml', type: 'file' },
    { name: 'README.md', type: 'file' }
  ]);

  const FileNode = ({ item, depth = 0 }) => {
    const [isOpen, setIsOpen] = useState(false);
    const paddingLeft = depth * 15 + 10;
    
    const icon = item.type === 'folder' 
      ? (isOpen ? '📂' : '📁') 
      : '📄';

    return (
      <div>
        <div 
          onClick={() => item.type === 'folder' && setIsOpen(!isOpen)}
          style={{ paddingLeft, cursor: 'pointer', display: 'flex', alignItems: 'center', padding: '4px 0' }}
        >
          <span style={{ marginRight: '8px' }}>{icon}</span>
          {item.name}
        </div>
        {isOpen && item.children && (
          <div>
            {item.children.map((child, idx) => (
              <FileNode key={idx} item={child} depth={depth + 1} />
            ))}
          </div>
        )}
      </div>
    );
  };

  return (
    <div style={{ height: '100%', background: '#252526', color: '#cccccc' }}>
      <div style={{ padding: '5px 10px', background: '#333333', fontSize: '0.8rem' }}>EXPLORER</div>
      {fileSystem.map((item, idx) => (
        <FileNode key={idx} item={item} />
      ))}
    </div>
  );
};
```

#### C. Integration: Backend Command Protocol (`src/core/WindowManager.js` Snippet)
We need a method that the Rust backend can call via a bridge (e.g., Tauri command or WebSocket).

```javascript
// Inside WindowManager class or module
export const WindowManager = {
  windows: [],

  // Function to be exposed to Rust Backend
  createWindowFromBackend(type, title, props) {
    const newWindow = {
      id: Date.now(),
      title: title,
      type: type, // 'console' or 'file-explorer'
      props: props,
      isMinimized: false,
      zIndex: this.windows.length + 1
    };
    
    this.windows.push(newWindow);
    this.notifySubscribers(); // Trigger React re-render
    return newWindow.id;
  },

  // Helper to handle incoming Rust messages
  handleBackendMessage(message) {
    if (message.command === 'create_window') {
      this.createWindowFromBackend(message.payload.type, message.payload.title, message.payload.props);
    }
  }
};
```

#### D. Rust Backend Structure (`backend/src/window_api.rs`)
This defines the data structure the Rust backend will send to the frontend.

```rust
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct WindowConfig {
    pub window_type: String, // "console", "file-explorer"
    pub title: String,
    pub initial_content: Option<String>,
}

// Example function that would be invoked by Rust logic
pub fn open_system_window(config: WindowConfig) {
    // In a real Tauri app, this would emit an event to the frontend
    // tauri::Event::emit("frontend-event", config);
    println!("Requesting Window: {:?}", config);
}
```

---

### 3. Next Steps

To complete this phase, run the following commands in your terminal:

1.  **Create the App Registry:**
    ```bash
    mkdir -p src/apps
    touch src/apps/ConsoleApp.js src/apps/FileExplorerApp.js src/apps/AppRegistry.js
    ```

2.  **Update the Window Manager:**
    Open `src/core/WindowManager.js` and implement the `createWindowFromBackend` method described above.

3.  **Register the Apps:**
    In `src/apps/AppRegistry.js`, map the string keys `'console'` and `'file-explorer'` to the React components created in step 2.

4.  **Test Integration:**
    Start your development server. From the browser developer console, manually trigger the backend integration to verify:
    ```javascript
    // Test in browser console
    WindowManager.createWindowFromBackend('console', 'System Log', {});
    ```
# Safe View Extension Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a Chromium extension that blurs media (images/videos) by default on Twitter and YouTube, with hover preview, click-to-reveal, and whitelist support.

**Architecture:** Content script observes DOM for media elements, applies blur CSS, handles hover/click interactions. Background script manages storage and settings. Site-specific modules handle Twitter/YouTube selectors and context extraction.

**Tech Stack:** JavaScript, Chrome Extension Manifest V3, CSS, Chrome Storage API

---

## Prerequisites

- Chromium-based browser (Chrome, Edge, Brave, etc.)
- No build tools needed - vanilla JS extension

---

### Task 1: Create Extension Directory Structure

**Files:**
- Create: `extensions/safe-view/manifest.json`
- Create: `extensions/safe-view/styles.css`

**Step 1: Create directory structure**

Run: `mkdir -p extensions/safe-view/sites`
Expected: Directory created

**Step 2: Create manifest.json**

```json
{
  "manifest_version": 3,
  "name": "Safe View",
  "version": "1.0.0",
  "description": "Blur media by default, reveal on demand. Works on Twitter and YouTube.",
  "permissions": ["storage", "activeTab"],
  "host_permissions": [
    "*://*.twitter.com/*",
    "*://*.x.com/*",
    "*://*.youtube.com/*"
  ],
  "background": {
    "service_worker": "background.js"
  },
  "content_scripts": [
    {
      "matches": [
        "*://*.twitter.com/*",
        "*://*.x.com/*",
        "*://*.youtube.com/*"
      ],
      "js": ["sites/twitter.js", "sites/youtube.js", "content.js"],
      "css": ["styles.css"],
      "run_at": "document_start"
    }
  ],
  "action": {
    "default_popup": "popup.html",
    "default_icon": {
      "16": "icons/icon16.png",
      "48": "icons/icon48.png",
      "128": "icons/icon128.png"
    }
  },
  "icons": {
    "16": "icons/icon16.png",
    "48": "icons/icon48.png",
    "128": "icons/icon128.png"
  }
}
```

**Step 3: Create styles.css with blur states**

```css
/* Safe View - Blur Styles */

/* Main blur state */
.safe-view-blur {
  filter: blur(20px) grayscale(30%) !important;
  transition: filter 0.2s ease !important;
  cursor: pointer !important;
}

/* Hover preview - partial unblur */
.safe-view-blur:hover {
  filter: blur(8px) grayscale(15%) !important;
}

/* Fully revealed state */
.safe-view-revealed {
  filter: none !important;
}

/* Whitelisted - never blur */
.safe-view-whitelisted {
  filter: none !important;
}

/* Extension disabled state */
.safe-view-disabled {
  filter: none !important;
}

/* Click hint overlay */
.safe-view-hint {
  position: absolute !important;
  top: 4px !important;
  right: 4px !important;
  background: rgba(0, 0, 0, 0.75) !important;
  color: #fff !important;
  padding: 3px 8px !important;
  border-radius: 4px !important;
  font-size: 11px !important;
  font-family: system-ui, sans-serif !important;
  pointer-events: none !important;
  opacity: 0 !important;
  transition: opacity 0.2s ease !important;
  z-index: 9999 !important;
}

.safe-view-blur:hover .safe-view-hint {
  opacity: 1 !important;
}

/* Ensure parent has position for overlay */
.safe-view-container {
  position: relative !important;
}
```

**Step 4: Verify file structure**

Run: `ls -la extensions/safe-view/`
Expected: manifest.json and styles.css exist

---

### Task 2: Create Site-Specific Selectors (Twitter)

**Files:**
- Create: `extensions/safe-view/sites/twitter.js`

**Step 1: Create Twitter site module**

```javascript
// Twitter/X site configuration for Safe View
// Detects media elements and extracts context for whitelisting

(function() {
  'use strict';

  window.SafeViewSites = window.SafeViewSites || {};

  window.SafeViewSites.twitter = {
    name: 'twitter',
    domain: ['twitter.com', 'x.com'],

    // Media element selectors
    mediaSelectors: [
      // Tweet images
      'img[src*="pbs.twimg.com/media"]',
      'img[src*="pbs.twimg.com/ext_tw_video_thumb"]',
      'img[src*="pbs.twimg.com/amplify_video_thumb"]',
      'img[src*="pbs.twimg.com/card_img"]',

      // Video thumbnails and players
      '[data-testid="tweetPhoto"] img',
      '[data-testid="videoPlayer"] video',
      '[data-testid="previewInterstitial"] video',

      // Profile media
      'img[src*="pbs.twimg.com/profile_banners"]',
      'img[src*="pbs.twimg.com/profile_images"]',

      // Generic video
      'video',
    ],

    // Elements to NEVER blur (UI elements)
    excludeSelectors: [
      'img[src*="pbs.twimg.com/profile_images"]', // Profile avatars in timeline
      'img[src*="abs.twimg.com/sticky"]', // UI icons
      '[data-testid="UserAvatar"] img', // User avatars
    ],

    // Extract context for whitelisting
    getContext: function(element) {
      // Find parent tweet
      const tweet = element.closest('[data-testid="tweet"]');
      if (!tweet) {
        // Check if in profile header
        const profileHeader = element.closest('[data-testid="UserProfileHeader_Items"]');
        if (profileHeader) {
          const usernameEl = document.querySelector('[data-testid="UserName"]');
          if (usernameEl) {
            return { username: usernameEl.textContent.replace('@', '') };
          }
        }
        return null;
      }

      // Extract username
      const userLink = tweet.querySelector('a[href^="/"][role="link"]');
      let username = null;
      if (userLink) {
        const href = userLink.getAttribute('href');
        username = href.replace('/', '');
      }

      // Extract tweet ID
      const tweetLink = tweet.querySelector('a[href*="/status/"]');
      let tweetId = null;
      if (tweetLink) {
        const match = tweetLink.href.match(/status\/(\d+)/);
        if (match) tweetId = match[1];
      }

      return { username, tweetId };
    },

    // Check if context matches whitelist
    isWhitelisted: function(context, whitelist) {
      if (!context) return false;
      if (!whitelist) return false;

      const users = whitelist.users || [];
      const channels = whitelist.channels || [];

      // Check username
      if (context.username) {
        const lowerUser = context.username.toLowerCase();
        if (users.some(u => u.toLowerCase() === lowerUser)) {
          return true;
        }
        // Also check channels array (some users add to channels)
        if (channels.some(c => c.toLowerCase() === lowerUser)) {
          return true;
        }
      }

      return false;
    }
  };

})();
```

**Step 2: Verify syntax**

Run: `node -c extensions/safe-view/sites/twitter.js`
Expected: No syntax errors (or "SyntaxError" if Node not available, that's OK)

---

### Task 3: Create Site-Specific Selectors (YouTube)

**Files:**
- Create: `extensions/safe-view/sites/youtube.js`

**Step 1: Create YouTube site module**

```javascript
// YouTube site configuration for Safe View
// Detects media elements and extracts context for whitelisting

(function() {
  'use strict';

  window.SafeViewSites = window.SafeViewSites || {};

  window.SafeViewSites.youtube = {
    name: 'youtube',
    domain: ['youtube.com', 'www.youtube.com', 'm.youtube.com'],

    // Media element selectors
    mediaSelectors: [
      // Video thumbnails
      'ytd-thumbnail img',
      'ytd-video-preview img',
      '#thumbnail img',
      'a#thumbnail img',

      // Main video player
      'video.html5-main-video',

      // Shorts
      'ytd-shorts ytd-thumbnail img',
      'ytd-reel-video-renderer video',

      // Channel banners and art
      '#channel-header-container #banner img',

      // End screen thumbnails
      '.ytp-videowall-still-image',

      // Related videos
      'ytd-compact-video-renderer img',
      'ytd-watch-next-secondary-results-renderer img',
    ],

    // Elements to NEVER blur
    excludeSelectors: [
      '#avatar img', // Channel avatars
      'ytd-channel-name img', // Channel icons
      'yt-icon img', // UI icons
      '#logo img', // YouTube logo
    ],

    // Extract context for whitelisting
    getContext: function(element) {
      // Get video container
      const videoRenderer = element.closest(
        'ytd-rich-item-renderer, ' +
        'ytd-video-renderer, ' +
        'ytd-compact-video-renderer, ' +
        'ytd-reel-video-renderer, ' +
        'ytd-shorts'
      );

      if (videoRenderer) {
        // Get channel name
        const channelNameEl = videoRenderer.querySelector(
          '#channel-name a, ' +
          'ytd-channel-name a, ' +
          '.ytd-channel-name a'
        );
        const channelName = channelNameEl ? channelNameEl.textContent.trim() : null;

        // Get video ID
        const videoLink = videoRenderer.querySelector('a#thumbnail, a[href*="watch?v="]');
        let videoId = null;
        if (videoLink && videoLink.href) {
          const match = videoLink.href.match(/[?&]v=([^&]+)/);
          if (match) videoId = match[1];
        }

        // Check if it's a short
        const isShort = element.closest('ytd-shorts, ytd-reel-video-renderer') !== null;

        return { channelName, videoId, isShort };
      }

      // Check for main video player
      const player = element.closest('#movie_player, .html5-video-player');
      if (player) {
        // Get channel from page
        const channelLink = document.querySelector('#channel-name a, ytd-channel-name a');
        const channelName = channelLink ? channelLink.textContent.trim() : null;

        // Get video ID from URL
        const urlMatch = window.location.search.match(/[?&]v=([^&]+)/);
        const videoId = urlMatch ? urlMatch[1] : null;

        return { channelName, videoId, isMainPlayer: true };
      }

      return null;
    },

    // Check if context matches whitelist
    isWhitelisted: function(context, whitelist) {
      if (!context) return false;
      if (!whitelist) return false;

      const users = whitelist.users || [];
      const channels = whitelist.channels || [];

      // Check channel name
      if (context.channelName) {
        const lowerChannel = context.channelName.toLowerCase();
        if (channels.some(c => c.toLowerCase() === lowerChannel)) {
          return true;
        }
        // Also check users array
        if (users.some(u => u.toLowerCase() === lowerChannel)) {
          return true;
        }
      }

      return false;
    }
  };

})();
```

**Step 2: Verify syntax**

Run: `node -c extensions/safe-view/sites/youtube.js`
Expected: No syntax errors

---

### Task 4: Create Content Script (Core Logic)

**Files:**
- Create: `extensions/safe-view/content.js`

**Step 1: Create main content script**

```javascript
// Safe View - Content Script
// Handles blur application, DOM observation, and user interactions

(function() {
  'use strict';

  // Configuration state
  let config = {
    enabled: true,
    hoverPeek: true,
    clickReveal: true,
    whitelist: { users: [], channels: [] }
  };

  // Track revealed elements (per session)
  const revealedElements = new WeakSet();

  // Get current site config
  function getCurrentSite() {
    const hostname = window.location.hostname;
    const sites = window.SafeViewSites || {};

    for (const key in sites) {
      const site = sites[key];
      if (site.domain && site.domain.some(d => hostname.includes(d))) {
        return site;
      }
    }
    return null;
  }

  // Check if element should be excluded
  function isExcluded(element, site) {
    if (!site || !site.excludeSelectors) return false;

    for (const selector of site.excludeSelectors) {
      if (element.matches && element.matches(selector)) {
        return true;
      }
    }
    return false;
  }

  // Check if element should be blurred
  function shouldBlur(element, site) {
    // Extension disabled
    if (!config.enabled) return false;

    // Already revealed this session
    if (revealedElements.has(element)) return false;

    // Check exclusions
    if (isExcluded(element, site)) return false;

    // Check whitelist
    if (site && site.isWhitelisted) {
      const context = site.getContext(element);
      if (site.isWhitelisted(context, config.whitelist)) {
        element.classList.add('safe-view-whitelisted');
        return false;
      }
    }

    return true;
  }

  // Apply blur to element
  function applyBlur(element) {
    const site = getCurrentSite();
    if (!shouldBlur(element, site)) return;

    // Add blur class
    element.classList.add('safe-view-blur');

    // Create container for overlay if needed
    const parent = element.parentElement;
    if (parent && !parent.classList.contains('safe-view-container')) {
      // Only add position relative if not already positioned
      const computedStyle = window.getComputedStyle(parent);
      if (computedStyle.position === 'static') {
        parent.classList.add('safe-view-container');
      }
    }

    // Add hint overlay
    const hint = document.createElement('div');
    hint.className = 'safe-view-hint';
    hint.textContent = 'Click to reveal';
    hint.setAttribute('data-safe-view', 'hint');

    // Insert hint near element
    if (element.parentElement) {
      element.parentElement.appendChild(hint);
    }
  }

  // Reveal element
  function revealElement(element) {
    element.classList.remove('safe-view-blur');
    element.classList.add('safe-view-revealed');
    revealedElements.add(element);

    // Remove hint overlay
    const parent = element.parentElement;
    if (parent) {
      const hint = parent.querySelector('[data-safe-view="hint"]');
      if (hint) hint.remove();
    }
  }

  // Process all media on page
  function processAll() {
    const site = getCurrentSite();
    if (!site) return;

    site.mediaSelectors.forEach(selector => {
      try {
        document.querySelectorAll(selector).forEach(element => {
          // Skip if already processed
          if (element.classList.contains('safe-view-blur') ||
              element.classList.contains('safe-view-revealed') ||
              element.classList.contains('safe-view-whitelisted')) {
            return;
          }
          applyBlur(element);
        });
      } catch (e) {
        // Invalid selector, skip
      }
    });
  }

  // Handle click events
  function handleClick(event) {
    if (!config.clickReveal) return;

    const blurred = event.target.closest('.safe-view-blur');
    if (blurred) {
      event.preventDefault();
      event.stopPropagation();
      revealElement(blurred);
      return false;
    }
  }

  // Handle keyboard shortcuts
  function handleKeydown(event) {
    // Don't trigger if typing in input
    const activeTag = document.activeElement?.tagName;
    if (activeTag === 'INPUT' || activeTag === 'TEXTAREA' || activeTag === 'SELECT') {
      return;
    }

    // Press 'B' to toggle blur
    if (event.key === 'b' || event.key === 'B') {
      if (!event.ctrlKey && !event.metaKey && !event.altKey) {
        toggleAll();
      }
    }
  }

  // Toggle all blur on page
  function toggleAll() {
    config.enabled = !config.enabled;

    if (!config.enabled) {
      // Reveal all
      document.querySelectorAll('.safe-view-blur').forEach(el => {
        el.classList.remove('safe-view-blur');
        el.classList.add('safe-view-disabled');
      });
    } else {
      // Re-blur all (except revealed)
      document.querySelectorAll('.safe-view-disabled').forEach(el => {
        if (!revealedElements.has(el)) {
          el.classList.remove('safe-view-disabled');
          el.classList.add('safe-view-blur');
        }
      });
    }
  }

  // Observe DOM for new content (infinite scroll, lazy load)
  function setupObserver() {
    const observer = new MutationObserver((mutations) => {
      let shouldProcess = false;

      mutations.forEach(mutation => {
        mutation.addedNodes.forEach(node => {
          if (node.nodeType === Node.ELEMENT_NODE) {
            shouldProcess = true;
          }
        });
      });

      if (shouldProcess) {
        // Debounce processing
        clearTimeout(setupObserver.timeout);
        setupObserver.timeout = setTimeout(processAll, 100);
      }
    });

    observer.observe(document.body || document.documentElement, {
      childList: true,
      subtree: true
    });
  }

  // Initialize
  function init() {
    // Load config from storage
    chrome.storage.sync.get(['safeViewConfig'], (result) => {
      if (result.safeViewConfig) {
        config = { ...config, ...result.safeViewConfig };
      }

      // Process existing content
      if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', processAll);
      } else {
        processAll();
      }

      // Setup observer for dynamic content
      setupObserver();
    });

    // Add event listeners
    document.addEventListener('click', handleClick, true);
    document.addEventListener('keydown', handleKeydown, false);

    // Listen for config changes
    chrome.storage.onChanged.addListener((changes, namespace) => {
      if (namespace === 'sync' && changes.safeViewConfig) {
        config = { ...config, ...changes.safeViewConfig.newValue };
        // Re-process if re-enabled
        if (config.enabled) {
          processAll();
        }
      }
    });
  }

  // Start
  init();

})();
```

**Step 2: Verify syntax**

Run: `node -c extensions/safe-view/content.js`
Expected: No syntax errors

---

### Task 5: Create Background Script

**Files:**
- Create: `extensions/safe-view/background.js`

**Step 1: Create background service worker**

```javascript
// Safe View - Background Service Worker
// Handles storage and message routing

// Default configuration
const DEFAULT_CONFIG = {
  enabled: true,
  hoverPeek: true,
  clickReveal: true,
  whitelist: {
    users: [],
    channels: []
  }
};

// Initialize storage on install
chrome.runtime.onInstalled.addListener((details) => {
  if (details.reason === 'install') {
    chrome.storage.sync.set({ safeViewConfig: DEFAULT_CONFIG }, () => {
      console.log('Safe View: Default configuration saved');
    });
  }
});

// Handle messages from popup or content scripts
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  switch (message.action) {
    case 'getConfig':
      chrome.storage.sync.get(['safeViewConfig'], (result) => {
        sendResponse(result.safeViewConfig || DEFAULT_CONFIG);
      });
      return true; // Keep channel open for async response

    case 'saveConfig':
      chrome.storage.sync.set({ safeViewConfig: message.config }, () => {
        sendResponse({ success: true });
      });
      return true;

    case 'addToWhitelist':
      chrome.storage.sync.get(['safeViewConfig'], (result) => {
        const config = result.safeViewConfig || DEFAULT_CONFIG;
        const type = message.type || 'users'; // 'users' or 'channels'
        const item = message.item.trim().toLowerCase();

        if (!config.whitelist[type].includes(item)) {
          config.whitelist[type].push(item);
          chrome.storage.sync.set({ safeViewConfig: config }, () => {
            sendResponse({ success: true, config });
          });
        } else {
          sendResponse({ success: false, error: 'Already in whitelist' });
        }
      });
      return true;

    case 'removeFromWhitelist':
      chrome.storage.sync.get(['safeViewConfig'], (result) => {
        const config = result.safeViewConfig || DEFAULT_CONFIG;
        const item = message.item.trim().toLowerCase();

        config.whitelist.users = config.whitelist.users.filter(u => u !== item);
        config.whitelist.channels = config.whitelist.channels.filter(c => c !== item);

        chrome.storage.sync.set({ safeViewConfig: config }, () => {
          sendResponse({ success: true, config });
        });
      });
      return true;

    case 'getCurrentTab':
      chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
        if (tabs[0]) {
          sendResponse({ url: tabs[0].url, title: tabs[0].title });
        } else {
          sendResponse({ url: null, title: null });
        }
      });
      return true;

    default:
      sendResponse({ error: 'Unknown action' });
      return false;
  }
});

// Log when service worker starts
console.log('Safe View: Background service worker started');
```

**Step 2: Verify syntax**

Run: `node -c extensions/safe-view/background.js`
Expected: No syntax errors

---

### Task 6: Create Popup UI

**Files:**
- Create: `extensions/safe-view/popup.html`
- Create: `extensions/safe-view/popup.js`

**Step 1: Create popup HTML**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Safe View Settings</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      width: 300px;
      padding: 16px;
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      font-size: 14px;
      color: #1a1a1a;
      background: #fff;
    }

    header {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 16px;
      padding-bottom: 12px;
      border-bottom: 1px solid #e0e0e0;
    }

    header h1 {
      font-size: 18px;
      font-weight: 600;
    }

    .icon {
      font-size: 24px;
    }

    .section {
      margin-bottom: 16px;
    }

    .section-title {
      font-size: 12px;
      font-weight: 600;
      text-transform: uppercase;
      color: #666;
      margin-bottom: 8px;
    }

    .toggle-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 8px 0;
    }

    .toggle-label {
      font-size: 14px;
    }

    .toggle-switch {
      position: relative;
      width: 44px;
      height: 24px;
    }

    .toggle-switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .toggle-slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: 0.3s;
      border-radius: 24px;
    }

    .toggle-slider:before {
      position: absolute;
      content: "";
      height: 18px;
      width: 18px;
      left: 3px;
      bottom: 3px;
      background-color: white;
      transition: 0.3s;
      border-radius: 50%;
    }

    input:checked + .toggle-slider {
      background-color: #4CAF50;
    }

    input:checked + .toggle-slider:before {
      transform: translateX(20px);
    }

    .whitelist-input {
      display: flex;
      gap: 8px;
      margin-bottom: 8px;
    }

    .whitelist-input input {
      flex: 1;
      padding: 8px 12px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 14px;
    }

    .whitelist-input input:focus {
      outline: none;
      border-color: #4CAF50;
    }

    .whitelist-input button {
      padding: 8px 16px;
      background: #4CAF50;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 14px;
    }

    .whitelist-input button:hover {
      background: #45a049;
    }

    .whitelist-list {
      max-height: 180px;
      overflow-y: auto;
      border: 1px solid #eee;
      border-radius: 6px;
    }

    .whitelist-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 8px 12px;
      border-bottom: 1px solid #eee;
    }

    .whitelist-item:last-child {
      border-bottom: none;
    }

    .whitelist-item .name {
      font-size: 13px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .whitelist-item button {
      background: none;
      border: none;
      color: #999;
      cursor: pointer;
      font-size: 16px;
      padding: 0 4px;
    }

    .whitelist-item button:hover {
      color: #f44336;
    }

    .whitelist-empty {
      padding: 16px;
      text-align: center;
      color: #999;
      font-size: 13px;
    }

    .hint {
      margin-top: 12px;
      padding: 8px 12px;
      background: #f5f5f5;
      border-radius: 6px;
      font-size: 12px;
      color: #666;
    }

    .hint kbd {
      background: #e0e0e0;
      padding: 2px 6px;
      border-radius: 3px;
      font-family: monospace;
    }

    .status {
      position: fixed;
      bottom: 16px;
      left: 16px;
      right: 16px;
      padding: 8px;
      background: #4CAF50;
      color: white;
      border-radius: 6px;
      text-align: center;
      opacity: 0;
      transition: opacity 0.3s;
    }

    .status.show {
      opacity: 1;
    }
  </style>
</head>
<body>
  <header>
    <span class="icon">🔒</span>
    <h1>Safe View</h1>
  </header>

  <div class="section">
    <div class="section-title">Settings</div>

    <div class="toggle-row">
      <span class="toggle-label">Enable blur</span>
      <label class="toggle-switch">
        <input type="checkbox" id="enabled" checked>
        <span class="toggle-slider"></span>
      </label>
    </div>

    <div class="toggle-row">
      <span class="toggle-label">Hover to peek</span>
      <label class="toggle-switch">
        <input type="checkbox" id="hoverPeek" checked>
        <span class="toggle-slider"></span>
      </label>
    </div>

    <div class="toggle-row">
      <span class="toggle-label">Click to reveal</span>
      <label class="toggle-switch">
        <input type="checkbox" id="clickReveal" checked>
        <span class="toggle-slider"></span>
      </label>
    </div>
  </div>

  <div class="section">
    <div class="section-title">Whitelist</div>
    <div class="whitelist-input">
      <input type="text" id="whitelistInput" placeholder="username or channel">
      <button id="addBtn">Add</button>
    </div>
    <div class="whitelist-list" id="whitelistList">
      <div class="whitelist-empty">No whitelisted items</div>
    </div>
  </div>

  <div class="hint">
    Press <kbd>B</kbd> on any page to toggle blur
  </div>

  <div class="status" id="status">Saved</div>

  <script src="popup.js"></script>
</body>
</html>
```

**Step 2: Create popup JavaScript**

```javascript
// Safe View - Popup Script
// Handles settings UI and whitelist management

(function() {
  'use strict';

  // Current configuration
  let config = {};

  // DOM elements
  const elements = {
    enabled: document.getElementById('enabled'),
    hoverPeek: document.getElementById('hoverPeek'),
    clickReveal: document.getElementById('clickReveal'),
    whitelistInput: document.getElementById('whitelistInput'),
    addBtn: document.getElementById('addBtn'),
    whitelistList: document.getElementById('whitelistList'),
    status: document.getElementById('status')
  };

  // Show status message
  function showStatus(message) {
    elements.status.textContent = message;
    elements.status.classList.add('show');
    setTimeout(() => {
      elements.status.classList.remove('show');
    }, 1500);
  }

  // Update UI from config
  function updateUI() {
    elements.enabled.checked = config.enabled !== false;
    elements.hoverPeek.checked = config.hoverPeek !== false;
    elements.clickReveal.checked = config.clickReveal !== false;

    renderWhitelist();
  }

  // Render whitelist
  function renderWhitelist() {
    const users = config.whitelist?.users || [];
    const channels = config.whitelist?.channels || [];

    // Combine and dedupe
    const allItems = [...new Set([...users, ...channels])];

    if (allItems.length === 0) {
      elements.whitelistList.innerHTML = '<div class="whitelist-empty">No whitelisted items</div>';
      return;
    }

    elements.whitelistList.innerHTML = allItems.map(item => `
      <div class="whitelist-item">
        <span class="name" title="${item}">${item}</span>
        <button data-item="${item}" title="Remove">✕</button>
      </div>
    `).join('');
  }

  // Save config
  function saveConfig() {
    chrome.runtime.sendMessage({
      action: 'saveConfig',
      config: config
    }, (response) => {
      if (response?.success) {
        showStatus('Saved');
      }
    });
  }

  // Toggle setting
  function toggleSetting(key, value) {
    config[key] = value;
    saveConfig();
  }

  // Add to whitelist
  function addToWhitelist() {
    const input = elements.whitelistInput.value.trim();
    if (!input) return;

    // Detect type based on current tab
    chrome.runtime.sendMessage({ action: 'getCurrentTab' }, (response) => {
      const url = response?.url || '';
      const isYouTube = url.includes('youtube.com');
      const type = isYouTube ? 'channels' : 'users';

      chrome.runtime.sendMessage({
        action: 'addToWhitelist',
        type: type,
        item: input
      }, (response) => {
        if (response?.success) {
          config = response.config;
          updateUI();
          elements.whitelistInput.value = '';
          showStatus('Added to whitelist');
        } else {
          showStatus(response?.error || 'Failed to add');
        }
      });
    });
  }

  // Remove from whitelist
  function removeFromWhitelist(item) {
    chrome.runtime.sendMessage({
      action: 'removeFromWhitelist',
      item: item
    }, (response) => {
      if (response?.success) {
        config = response.config;
        updateUI();
        showStatus('Removed');
      }
    });
  }

  // Initialize
  function init() {
    // Load config
    chrome.runtime.sendMessage({ action: 'getConfig' }, (response) => {
      config = response || {};
      updateUI();
    });

    // Event listeners
    elements.enabled.addEventListener('change', (e) => {
      toggleSetting('enabled', e.target.checked);
    });

    elements.hoverPeek.addEventListener('change', (e) => {
      toggleSetting('hoverPeek', e.target.checked);
    });

    elements.clickReveal.addEventListener('change', (e) => {
      toggleSetting('clickReveal', e.target.checked);
    });

    elements.addBtn.addEventListener('click', addToWhitelist);

    elements.whitelistInput.addEventListener('keypress', (e) => {
      if (e.key === 'Enter') {
        addToWhitelist();
      }
    });

    elements.whitelistList.addEventListener('click', (e) => {
      if (e.target.dataset.item) {
        removeFromWhitelist(e.target.dataset.item);
      }
    });
  }

  // Start
  init();

})();
```

**Step 3: Verify syntax**

Run: `node -c extensions/safe-view/popup.js`
Expected: No syntax errors

---

### Task 7: Create Extension Icons

**Files:**
- Create: `extensions/safe-view/icons/icon16.png`
- Create: `extensions/safe-view/icons/icon48.png`
- Create: `extensions/safe-view/icons/icon128.png`

**Step 1: Create icons directory**

Run: `mkdir -p extensions/safe-view/icons`
Expected: Directory created

**Step 2: Create simple SVG icons (convert to PNG)**

Create `extensions/safe-view/icons/icon.svg`:

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128">
  <rect width="128" height="128" rx="16" fill="#4CAF50"/>
  <circle cx="64" cy="50" r="28" fill="white"/>
  <path d="M30 100 Q64 70 98 100 L98 110 L30 110 Z" fill="white"/>
  <rect x="85" y="75" width="35" height="45" rx="4" fill="#f44336"/>
  <line x1="92" y1="85" x2="113" y2="110" stroke="white" stroke-width="4"/>
  <line x1="113" y1="85" x2="92" y2="110" stroke="white" stroke-width="4"/>
</svg>
```

**Step 3: Note about icons**

For development, you can use placeholder icons or generate PNGs from the SVG:
- Option A: Use an online SVG to PNG converter
- Option B: Use ImageMagick: `convert icon.svg -resize 16x16 icon16.png`
- Option C: Temporarily skip icons and load as unpacked extension (Chrome will show default icon)

For now, create placeholder files:

Run:
```bash
touch extensions/safe-view/icons/icon16.png
touch extensions/safe-view/icons/icon48.png
touch extensions/safe-view/icons/icon128.png
```

Expected: Empty placeholder files created (extension will still load for testing)

---

### Task 8: Test Extension Installation

**Files:**
- None (manual testing)

**Step 1: Verify all files exist**

Run: `find extensions/safe-view -type f | sort`
Expected output:
```
extensions/safe-view/background.js
extensions/safe-view/content.js
extensions/safe-view/icons/icon128.png
extensions/safe-view/icons/icon16.png
extensions/safe-view/icons/icon48.png
extensions/safe-view/manifest.json
extensions/safe-view/popup.html
extensions/safe-view/popup.js
extensions/safe-view/sites/twitter.js
extensions/safe-view/sites/youtube.js
extensions/safe-view/styles.css
```

**Step 2: Load extension in Chrome**

1. Open Chrome
2. Navigate to `chrome://extensions/`
3. Enable "Developer mode" (toggle in top right)
4. Click "Load unpacked"
5. Select the `extensions/safe-view` directory
6. Verify extension appears in list with no errors

**Step 3: Test on Twitter**

1. Navigate to `https://twitter.com` or `https://x.com`
2. Scroll through timeline
3. Verify: Images/videos appear blurred
4. Hover over blurred image: Should partially unblur
5. Click blurred image: Should fully reveal
6. Press 'B' key: Should toggle blur off/on

**Step 4: Test on YouTube**

1. Navigate to `https://youtube.com`
2. Scroll through home page
3. Verify: Thumbnails appear blurred
4. Hover/click: Should reveal
5. Press 'B': Should toggle

**Step 5: Test whitelist**

1. Click extension icon in toolbar
2. Add a username (Twitter) or channel name (YouTube)
3. Refresh the page
4. Verify: Media from whitelisted user/channel is NOT blurred

---

### Task 9: Fix Any Issues Found During Testing

**Files:**
- Modify: Various (based on testing results)

**Step 1: Document any issues found**

During testing, note:
- Selectors that don't match
- Elements that should be excluded but aren't
- Elements that are excluded but shouldn't be
- Console errors

**Step 2: Apply fixes**

Common fixes:
- Update selectors in `sites/twitter.js` or `sites/youtube.js`
- Add to `excludeSelectors` for UI elements
- Adjust blur values in `styles.css`

---

### Task 10: Create README

**Files:**
- Create: `extensions/safe-view/README.md`

**Step 1: Create documentation**

```markdown
# Safe View

A Chromium extension that blurs media by default on Twitter and YouTube,
with hover preview, click-to-reveal, and whitelist support.

## Installation

1. Open Chrome and navigate to `chrome://extensions/`
2. Enable "Developer mode" (toggle in top right)
3. Click "Load unpacked"
4. Select this `safe-view` directory

## Usage

### Basic

- **Blur**: All images/videos are blurred by default
- **Hover**: Hover to get a preview (partial unblur)
- **Click**: Click to fully reveal for the session
- **Keyboard**: Press `B` to toggle blur on/off

### Whitelist

1. Click the extension icon in the toolbar
2. Enter a username (Twitter) or channel name (YouTube)
3. Click "Add"
4. Refresh the page

Whitelisted users/channels will never have their media blurred.

## Supported Sites

- Twitter / X
- YouTube (including Shorts)

## Configuration

Click the extension icon to access settings:

| Setting | Description |
|---------|-------------|
| Enable blur | Turn blur on/off globally |
| Hover to peek | Show partial preview on hover |
| Click to reveal | Allow clicking to reveal media |

## Privacy

- All data stored locally in Chrome sync storage
- No external servers or tracking
- No analytics

## Development

### File Structure

```
safe-view/
├── manifest.json       # Extension manifest
├── background.js       # Service worker
├── content.js          # Main blur logic
├── popup.html          # Settings UI
├── popup.js            # Settings logic
├── styles.css          # Blur styles
├── sites/
│   ├── twitter.js      # Twitter selectors
│   └── youtube.js      # YouTube selectors
└── icons/              # Extension icons
```

### Adding New Sites

1. Create `sites/newsite.js` following the pattern in existing site files
2. Add domain to `manifest.json` host_permissions and content_scripts.matches
3. Reload extension

## License

MIT
```

**Step 2: Commit all files**

Run:
```bash
git add extensions/safe-view/
git commit -m "feat: add Safe View extension for media blur

- Blurs images/videos by default on Twitter and YouTube
- Hover preview and click-to-reveal
- Whitelist support for trusted users/channels
- Keyboard toggle (B key)
- Popup settings UI"
```

Expected: Committed successfully

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Directory structure + manifest + CSS | manifest.json, styles.css |
| 2 | Twitter site module | sites/twitter.js |
| 3 | YouTube site module | sites/youtube.js |
| 4 | Content script (core logic) | content.js |
| 5 | Background service worker | background.js |
| 6 | Popup UI | popup.html, popup.js |
| 7 | Extension icons | icons/*.png |
| 8 | Testing | Manual verification |
| 9 | Bug fixes | As needed |
| 10 | Documentation | README.md |

---

*Plan created: 2026-03-19*

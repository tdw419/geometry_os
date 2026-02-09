/**
 * PixelRTS v2 Dashboard JavaScript
 * Handles interactivity, API calls, and UI updates
 */

// API base URL
const API_BASE = '/api';

// Dashboard state
const state = {
    currentTheme: 'dark',
    uploadedFile: null,
    encodedData: null,
    analysisResults: null
};

// Initialize dashboard when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    initTheme();
    initUploadForm();
    initEncodeForm();
    initAnalysisTools();
    checkHealth();
});

// Theme management
function initTheme() {
    const themeToggle = document.getElementById('theme-toggle');
    if (!themeToggle) return;

    // Load saved theme
    const savedTheme = localStorage.getItem('pixelrts-theme') || 'dark';
    setTheme(savedTheme);

    themeToggle.addEventListener('click', () => {
        const newTheme = state.currentTheme === 'dark' ? 'light' : 'dark';
        setTheme(newTheme);
    });
}

function setTheme(theme) {
    state.currentTheme = theme;
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('pixelrts-theme', theme);
}

// Upload form handling
function initUploadForm() {
    const uploadZone = document.getElementById('upload-zone');
    const fileInput = document.getElementById('file-input');
    const uploadForm = document.getElementById('upload-form');

    if (!uploadZone || !fileInput || !uploadForm) return;

    // Click to browse
    uploadZone.addEventListener('click', () => fileInput.click());

    // File selection
    fileInput.addEventListener('change', (e) => {
        if (e.target.files.length > 0) {
            handleFileUpload(e.target.files[0]);
        }
    });

    // Drag and drop
    uploadZone.addEventListener('dragover', (e) => {
        e.preventDefault();
        uploadZone.classList.add('dragover');
    });

    uploadZone.addEventListener('dragleave', () => {
        uploadZone.classList.remove('dragover');
    });

    uploadZone.addEventListener('drop', (e) => {
        e.preventDefault();
        uploadZone.classList.remove('dragover');
        if (e.dataTransfer.files.length > 0) {
            handleFileUpload(e.dataTransfer.files[0]);
        }
    });
}

async function handleFileUpload(file) {
    const formData = new FormData();
    formData.append('file', file);

    const resultDiv = document.getElementById('upload-result');
    resultDiv.classList.remove('hidden');
    resultDiv.innerHTML = '<p class="text-muted">Uploading and analyzing...</p>';

    try {
        const response = await fetch(`${API_BASE}/upload`, {
            method: 'POST',
            body: formData
        });

        const result = await response.json();

        if (result.status === 'success') {
            state.uploadedFile = result;
            displayUploadResult(result);
        } else {
            resultDiv.innerHTML = `<p class="text-danger">Error: ${result.error}</p>`;
        }
    } catch (error) {
        resultDiv.innerHTML = `<p class="text-danger">Upload failed: ${error.message}</p>`;
    }
}

function displayUploadResult(result) {
    const resultDiv = document.getElementById('upload-result');

    let html = '<h3>Analysis Results</h3>';
    html += '<div class="metadata">';

    if (result.analysis) {
        const analysis = result.analysis;
        html += `<div class="metadata-item">
            <span class="metadata-label">Filename</span>
            <span class="metadata-value">${analysis.filename || result.filename}</span>
        </div>`;
        html += `<div class="metadata-item">
            <span class="metadata-label">Size</span>
            <span class="metadata-value">${analysis.width}x${analysis.height}</span>
        </div>`;
        html += `<div class="metadata-item">
            <span class="metadata-label">Pixels</span>
            <span class="metadata-value">${analysis.pixels?.toLocaleString()}</span>
        </div>`;
        html += `<div class="metadata-item">
            <span class="metadata-label">Capacity</span>
            <span class="metadata-value">${(analysis.capacity_bytes / 1024).toFixed(2)} KB</span>
        </div>`;
    }

    html += '</div>';
    resultDiv.innerHTML = html;
}

// Encode form handling
function initEncodeForm() {
    const encodeForm = document.getElementById('encode-form');
    if (!encodeForm) return;

    encodeForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        await handleEncode();
    });
}

async function handleEncode() {
    const dataInput = document.getElementById('encode-data');
    const gridSize = document.getElementById('grid-size');
    const mode = document.getElementById('encode-mode');

    const resultDiv = document.getElementById('encode-result');
    resultDiv.classList.remove('hidden');
    resultDiv.innerHTML = '<p class="text-muted">Encoding...</p>';

    try {
        const response = await fetch(`${API_BASE}/encode`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                data: dataInput.value,
                grid_size: parseInt(gridSize.value),
                mode: mode.value
            })
        });

        const result = await response.json();

        if (result.status === 'success') {
            state.encodedData = result;
            displayEncodeResult(result);
        } else {
            resultDiv.innerHTML = `<p class="text-danger">Error: ${result.error}</p>`;
        }
    } catch (error) {
        resultDiv.innerHTML = `<p class="text-danger">Encoding failed: ${error.message}</p>`;
    }
}

function displayEncodeResult(result) {
    const img = document.getElementById('encoded-image');
    const metadataDiv = document.getElementById('encode-metadata');

    img.src = result.image;

    let html = '';
    if (result.metadata) {
        Object.entries(result.metadata).forEach(([key, value]) => {
            html += `<div class="metadata-item">
                <span class="metadata-label">${key}</span>
                <span class="metadata-value">${value}</span>
            </div>`;
        });
    }

    html += `<div class="metadata-item">
        <span class="metadata-label">Data Size</span>
        <span class="metadata-value">${result.data_size} bytes</span>
    </div>`;

    html += `<div class="metadata-item">
        <span class="metadata-label">Grid Size</span>
        <span class="metadata-value">${result.grid_size}x${result.grid_size}</span>
    </div>`;

    metadataDiv.innerHTML = html;
}

// Analysis tools
function initAnalysisTools() {
    // Tool buttons are wired up via onclick in HTML
}

async function analyzeDistribution() {
    const resultDiv = document.getElementById('analysis-result');
    resultDiv.classList.remove('hidden');
    resultDiv.innerHTML = '<p class="text-muted">Analyzing byte distribution...</p>';

    if (!state.uploadedFile) {
        resultDiv.innerHTML = '<p class="text-warning">Please upload a file first</p>';
        return;
    }

    try {
        const response = await fetch(`${API_BASE}/analyze`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                type: 'distribution',
                file: state.uploadedFile.filename
            })
        });

        const result = await response.json();
        displayAnalysisResult(result, 'Byte Distribution');
    } catch (error) {
        resultDiv.innerHTML = `<p class="text-danger">Analysis failed: ${error.message}</p>`;
    }
}

async function analyzeEntropy() {
    const resultDiv = document.getElementById('analysis-result');
    resultDiv.classList.remove('hidden');
    resultDiv.innerHTML = '<p class="text-muted">Calculating entropy...</p>';

    try {
        const response = await fetch(`${API_BASE}/analyze`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                type: 'entropy'
            })
        });

        const result = await response.json();
        displayAnalysisResult(result, 'Entropy Analysis');
    } catch (error) {
        resultDiv.innerHTML = `<p class="text-danger">Analysis failed: ${error.message}</p>`;
    }
}

async function analyzeHilbert() {
    const resultDiv = document.getElementById('analysis-result');
    resultDiv.classList.remove('hidden');
    resultDiv.innerHTML = '<p class="text-muted">Tracing Hilbert curve...</p>';

    try {
        const response = await fetch(`${API_BASE}/analyze`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                type: 'hilbert_trace'
            })
        });

        const result = await response.json();
        displayAnalysisResult(result, 'Hilbert Curve Trace');
    } catch (error) {
        resultDiv.innerHTML = `<p class="text-danger">Trace failed: ${error.message}</p>`;
    }
}

function displayAnalysisResult(result, title) {
    const resultDiv = document.getElementById('analysis-result');

    let html = `<h3>${title}</h3>`;

    if (result.status === 'success') {
        html += '<div class="analysis-data">';

        if (result.analysis) {
            Object.entries(result.analysis).forEach(([key, value]) => {
                html += `<div class="metadata-item">
                    <span class="metadata-label">${key}</span>
                    <span class="metadata-value">${typeof value === 'number' ? value.toFixed(4) : value}</span>
                </div>`;
            });
        }

        html += '</div>';
    } else {
        html += `<p class="text-warning">${result.error || 'No results'}</p>`;
    }

    resultDiv.innerHTML = html;
}

// Health check
async function checkHealth() {
    try {
        const response = await fetch(`${API_BASE}/health`);
        const result = await response.json();

        const statusDot = document.querySelector('.status-dot');
        const statusText = document.querySelector('.status-text');

        if (result.status === 'ok') {
            statusDot.style.backgroundColor = 'var(--accent-success)';
            statusText.textContent = 'Ready';
        } else {
            statusDot.style.backgroundColor = 'var(--accent-warning)';
            statusText.textContent = 'Degraded';
        }
    } catch (error) {
        const statusDot = document.querySelector('.status-dot');
        const statusText = document.querySelector('.status-text');
        statusDot.style.backgroundColor = 'var(--accent-danger)';
        statusText.textContent = 'Offline';
    }
}

// Utility functions
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function formatBytes(bytes) {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
}

// Export for console access
window.PixelRTS = {
    state,
    setTheme,
    handleFileUpload,
    handleEncode,
    analyzeDistribution,
    analyzeEntropy,
    analyzeHilbert
};

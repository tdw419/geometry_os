"""
PixelRTS v2 Web Dashboard

Flask-based web UI for PixelRTS v2 operations:
- Upload/encode/decode RTS files
- Visualize Hilbert curve encoding
- Analyze byte distribution
- Interactive heatmap generation

Author: PixelRTS v2 Implementation
Date: 2026-02-09
"""

import io
import sys
import base64
import json
from pathlib import Path
from typing import Optional, Dict, Any

# Add lib to path for imports
sys.path.insert(0, str(Path(__file__).parent / 'lib'))

try:
    from flask import Flask, render_template, request, jsonify, send_file, redirect, url_for
    from werkzeug.utils import secure_filename
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False

try:
    from PIL import Image
    import numpy as np
    PIL_AVAILABLE = True
except ImportError:
    PIL_AVAILABLE = False


def create_app(config: Optional[Dict[str, Any]] = None) -> Flask:
    """
    Create and configure Flask application.

    Args:
        config: Optional configuration dictionary

    Returns:
        Flask application instance
    """
    if not FLASK_AVAILABLE:
        raise ImportError("Flask is required for dashboard. Install with: pip install flask")

    app = Flask(__name__,
                template_folder='templates',
                static_folder='static')

    # Default configuration
    default_config = {
        'SECRET_KEY': 'pixelrts-dev-key-change-in-production',
        'MAX_CONTENT_LENGTH': 16 * 1024 * 1024,  # 16MB max upload
        'UPLOAD_FOLDER': '/tmp/pixelrts_uploads',
        'ALLOWED_EXTENSIONS': {'png', 'rts', 'bin', 'wasm'},
        'TESTING': False,
    }

    # Apply config
    if config:
        default_config.update(config)
    app.config.update(default_config)

    # Ensure upload folder exists
    Path(app.config['UPLOAD_FOLDER']).mkdir(parents=True, exist_ok=True)

    # Register routes
    _register_routes(app)

    return app


def _register_routes(app: Flask):
    """Register all Flask routes"""

    @app.route('/')
    def index():
        """Dashboard home page"""
        return render_template('dashboard.html',
                             title='PixelRTS v2 Dashboard',
                             theme='dark')

    @app.route('/upload')
    def upload_page():
        """File upload page"""
        return render_template('dashboard.html',
                             title='Upload - PixelRTS',
                             section='upload',
                             theme='dark')

    @app.route('/visualize')
    def visualize_page():
        """Visualization page"""
        return render_template('dashboard.html',
                             title='Visualize - PixelRTS',
                             section='visualize',
                             theme='dark')

    @app.route('/analyze')
    def analyze_page():
        """Analysis page"""
        return render_template('dashboard.html',
                             title='Analyze - PixelRTS',
                             section='analyze',
                             theme='dark')

    # API Routes

    @app.route('/api/health', methods=['GET'])
    def api_health():
        """Health check endpoint"""
        return jsonify({
            'status': 'ok',
            'service': 'PixelRTS Dashboard',
            'version': '2.0',
            'features': {
                'flask': FLASK_AVAILABLE,
                'pil': PIL_AVAILABLE,
            }
        })

    @app.route('/api/upload', methods=['POST'])
    def api_upload():
        """
        Upload and analyze an RTS/PNG file.

        Expects multipart/form-data with 'file' field.
        """
        if 'file' not in request.files:
            return jsonify({'error': 'No file provided'}), 400

        file = request.files['file']
        if file.filename == '':
            return jsonify({'error': 'No file selected'}), 400

        if not _allowed_file(file.filename, app.config['ALLOWED_EXTENSIONS']):
            return jsonify({'error': f'Invalid file type. Allowed: {app.config["ALLOWED_EXTENSIONS"]}'}), 400

        try:
            # Save uploaded file
            filename = secure_filename(file.filename)
            filepath = Path(app.config['UPLOAD_FOLDER']) / filename
            file.save(filepath)

            # Analyze the file
            analysis = _analyze_rts_file(filepath)

            return jsonify({
                'status': 'success',
                'filename': filename,
                'analysis': analysis
            }), 200

        except Exception as e:
            return jsonify({'error': f'Upload failed: {str(e)}'}), 500

    @app.route('/api/encode', methods=['POST'])
    def api_encode():
        """
        Encode data to PixelRTS format.

        Expects JSON: { data: string, grid_size?: int, mode?: string }
        """
        try:
            data = request.get_json()
            if not data or 'data' not in data:
                return jsonify({'error': 'Missing data field'}), 400

            input_data = data['data']
            grid_size = data.get('grid_size', 256)
            mode = data.get('mode', 'standard')

            # Convert string to bytes
            if isinstance(input_data, str):
                input_bytes = input_data.encode('utf-8')
            elif isinstance(input_data, list):
                input_bytes = bytes(input_data)
            else:
                return jsonify({'error': 'Invalid data type'}), 400

            # Import encoder
            from pixelrts_v2_core import PixelRTSEncoder

            encoder = PixelRTSEncoder(mode=mode)
            png_bytes = encoder.encode(input_bytes, grid_size=grid_size)

            # Convert to base64 for JSON response
            img_base64 = base64.b64encode(png_bytes).decode('utf-8')
            metadata = encoder.get_metadata()

            return jsonify({
                'status': 'success',
                'image': f'data:image/png;base64,{img_base64}',
                'metadata': metadata,
                'data_size': len(input_bytes),
                'grid_size': grid_size
            }), 200

        except ImportError:
            return jsonify({'error': 'Encoder module not available'}), 500
        except Exception as e:
            return jsonify({'error': f'Encoding failed: {str(e)}'}), 500

    @app.route('/api/decode/info', methods=['POST'])
    def api_decode_info():
        """
        Get information about a PixelRTS encoded image.

        Expects JSON: { image_data: base64_string }
        """
        try:
            data = request.get_json()
            if not data or 'image_data' not in data:
                return jsonify({'error': 'Missing image_data field'}), 400

            # Decode base64 image
            if data['image_data'].startswith('data:'):
                # Remove data URL prefix
                image_data = data['image_data'].split(',', 1)[1]
            else:
                image_data = data['image_data']

            img_bytes = base64.b64decode(image_data)

            # Import extractor
            from pixelrts_v2_core import PixelRTSMetadata

            # Open image and extract metadata
            img = Image.open(io.BytesIO(img_bytes))

            # Try to extract PixelRTS metadata
            metadata = PixelRTSMetadata()
            info = metadata.extract_metadata(img_bytes)

            return jsonify({
                'status': 'success',
                'info': info,
                'image_size': img.size,
                'image_mode': img.mode
            }), 200

        except ImportError:
            return jsonify({'error': 'Metadata module not available'}), 500
        except Exception as e:
            return jsonify({'error': f'Decode failed: {str(e)}'}), 500

    @app.route('/api/analyze', methods=['GET', 'POST'])
    def api_analyze():
        """
        Analyze PixelRTS statistics.

        GET: Returns analysis form/info
        POST: Analyzes provided data
        """
        if request.method == 'GET':
            return jsonify({
                'status': 'ready',
                'capabilities': [
                    'byte_distribution',
                    'hilbert_trace',
                    'entropy_analysis',
                    'content_detection'
                ]
            })

        # POST analysis
        try:
            data = request.get_json()
            if not data:
                return jsonify({'error': 'No data provided'}), 400

            # Perform analysis based on data type
            analysis = _perform_analysis(data)

            return jsonify({
                'status': 'success',
                'analysis': analysis
            }), 200

        except Exception as e:
            return jsonify({'error': f'Analysis failed: {str(e)}'}), 500

    @app.route('/api/heatmap', methods=['POST'])
    def api_heatmap():
        """
        Generate a heatmap visualization.

        Expects JSON: { data: bytes/array, type: string }
        """
        try:
            data = request.get_json()
            if not data or 'data' not in data:
                return jsonify({'error': 'Missing data field'}), 400

            heatmap_type = data.get('type', 'distribution')

            # Generate heatmap
            heatmap_data = _generate_heatmap(data['data'], heatmap_type)

            return jsonify({
                'status': 'success',
                'heatmap': heatmap_data
            }), 200

        except Exception as e:
            return jsonify({'error': f'Heatmap generation failed: {str(e)}'}), 500

    @app.route('/static/<path:filepath>')
    def serve_static(filepath):
        """Serve static files"""
        return send_from_directory(app.static_folder, filepath)


# Helper functions

def _allowed_file(filename: str, allowed_extensions: set) -> bool:
    """Check if file extension is allowed"""
    return Path(filename).suffix.lower().lstrip('.') in allowed_extensions


def _analyze_rts_file(filepath: Path) -> Dict[str, Any]:
    """
    Analyze an RTS/PNG file and return metadata.

    Args:
        filepath: Path to the file

    Returns:
        Dictionary with analysis results
    """
    if not PIL_AVAILABLE:
        return {'error': 'PIL not available'}

    try:
        img = Image.open(filepath)

        analysis = {
            'filename': filepath.name,
            'size': img.size,
            'mode': img.mode,
            'format': img.format,
            'width': img.width,
            'height': img.height,
            'pixels': img.width * img.height,
            'capacity_bytes': img.width * img.height * 4,
        }

        # Try to extract PixelRTS metadata
        try:
            from pixelrts_v2_core import PixelRTSMetadata
            metadata = PixelRTSMetadata()
            rts_info = metadata.extract_metadata(filepath.read_bytes())
            analysis['rts_metadata'] = rts_info
        except Exception:
            analysis['rts_metadata'] = None

        return analysis

    except Exception as e:
        return {'error': str(e)}


def _perform_analysis(data: Dict[str, Any]) -> Dict[str, Any]:
    """
    Perform analysis on provided data.

    Args:
        data: Data to analyze

    Returns:
        Analysis results
    """
    results = {}

    # Byte distribution analysis
    if 'bytes' in data:
        byte_data = data['bytes']
        if isinstance(byte_data, str):
            byte_data = byte_data.encode('utf-8')

        distribution = [0] * 256
        for b in byte_data:
            distribution[b] += 1

        results['byte_distribution'] = distribution
        results['entropy'] = _calculate_entropy(byte_data)

    return results


def _generate_heatmap(data: Any, heatmap_type: str) -> Dict[str, Any]:
    """
    Generate heatmap data.

    Args:
        data: Input data
        heatmap_type: Type of heatmap to generate

    Returns:
        Heatmap data dictionary
    """
    if not PIL_AVAILABLE or not np:
        return {'error': 'Required libraries not available'}

    # Implementation depends on heatmap_type
    return {
        'type': heatmap_type,
        'data': 'heatmap_data_placeholder'
    }


def _calculate_entropy(data: bytes) -> float:
    """
    Calculate Shannon entropy of data.

    Args:
        data: Input bytes

    Returns:
        Entropy value (0-8)
    """
    if not data:
        return 0.0

    import math
    from collections import Counter

    counts = Counter(data)
    length = len(data)

    entropy = 0.0
    for count in counts.values():
        p = count / length
        entropy -= p * math.log2(p)

    return entropy


# CLI entry point

def main():
    """Main entry point for running the dashboard"""
    import argparse

    parser = argparse.ArgumentParser(description='PixelRTS v2 Web Dashboard')
    parser.add_argument('--host', default='127.0.0.1', help='Host to bind to')
    parser.add_argument('--port', type=int, default=5000, help='Port to bind to')
    parser.add_argument('--debug', action='store_true', help='Enable debug mode')

    args = parser.parse_args()

    if not FLASK_AVAILABLE:
        print("Error: Flask is required. Install with: pip install flask")
        sys.exit(1)

    app = create_app()

    print(f"Starting PixelRTS v2 Dashboard...")
    print(f"URL: http://{args.host}:{args.port}")
    print(f"Upload folder: {app.config['UPLOAD_FOLDER']}")

    app.run(host=args.host, port=args.port, debug=args.debug)


if __name__ == '__main__':
    main()

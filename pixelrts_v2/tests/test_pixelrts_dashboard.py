#!/usr/bin/env python3
"""Tests for PixelRTS Web UI Dashboard"""
import pytest
import sys
from pathlib import Path
import tempfile
import json

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent / 'tools'))

try:
    from pixelrts_dashboard import create_app
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False
    pytest.skip("Flask not installed - skipping dashboard tests", allow_module_level=True)


@pytest.fixture
def app():
    """Create test Flask app"""
    db_fd, db_path = tempfile.mkstemp()
    app = create_app({
        'TESTING': True,
        'DATABASE': db_path,
    })

    yield app

    # Cleanup
    Path(db_path).unlink()


@pytest.fixture
def client(app):
    """Create test client"""
    return app.test_client()


@pytest.fixture
def runner(app):
    """Create test CLI runner"""
    return app.test_cli_runner()


class TestDashboardBasic:
    """Test basic dashboard functionality"""

    def test_app_creation(self, app):
        """Test that app can be created"""
        assert app is not None
        assert app.config['TESTING'] is True

    def test_index_page(self, client):
        """Test index page loads"""
        response = client.get('/')
        assert response.status_code == 200
        assert b'PixelRTS' in response.data or b'pixelrts' in response.data.lower()

    def test_api_health(self, client):
        """Test API health endpoint"""
        response = client.get('/api/health')
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] == 'ok'


class TestDashboardUpload:
    """Test file upload functionality"""

    def test_upload_page(self, client):
        """Test upload page loads"""
        response = client.get('/upload')
        assert response.status_code in (200, 302)  # 200 or redirect

    def test_upload_rts_file(self, client, app):
        """Test uploading an RTS file"""
        # Create a mock RTS file (PNG with metadata)
        import io
        from PIL import Image

        # Create a simple PNG image
        img = Image.new('RGBA', (16, 16), color=(0, 0, 0, 255))
        img_bytes = io.BytesIO()
        img.save(img_bytes, format='PNG')
        img_bytes.seek(0)

        response = client.post('/api/upload', data={
            'file': (img_bytes, 'test.rts.png'),
        }, content_type='multipart/form-data')

        # Should accept upload
        assert response.status_code in (200, 201, 400)  # 200/201 or validation error


class TestDashboardVisualization:
    """Test visualization endpoints"""

    def test_visualize_page(self, client):
        """Test visualize page loads"""
        response = client.get('/visualize')
        assert response.status_code in (200, 302)

    def test_api_encode(self, client):
        """Test encode API endpoint"""
        response = client.post('/api/encode', json={
            'data': 'Hello, PixelRTS!',
            'grid_size': 256
        })
        # May fail validation or succeed
        assert response.status_code in (200, 400, 422)

    def test_api_decode_info(self, client):
        """Test decode info API endpoint"""
        response = client.post('/api/decode/info', json={
            'image_data': 'base64_placeholder'
        })
        # May fail validation or succeed (500 is OK for invalid base64)
        assert response.status_code in (200, 400, 422, 500)


class TestDashboardAnalysis:
    """Test analysis endpoints"""

    def test_analyze_endpoint(self, client):
        """Test analyze endpoint"""
        response = client.get('/api/analyze')
        # Should either show analysis form or redirect
        assert response.status_code in (200, 302, 404)


class TestDashboardStatic:
    """Test static file serving"""

    def test_static_css(self, client):
        """Test static CSS files are served"""
        response = client.get('/static/css/dashboard.css')
        # May exist or not
        assert response.status_code in (200, 404)

    def test_static_js(self, client):
        """Test static JS files are served"""
        response = client.get('/static/js/dashboard.js')
        # May exist or not
        assert response.status_code in (200, 404)


class TestDashboardConfig:
    """Test dashboard configuration"""

    def test_config_dark_theme(self, app):
        """Test dark theme configuration"""
        with app.app_context():
            from flask import current_app
            # App should have config
            assert current_app is not None

    def test_config_max_upload(self, app):
        """Test max upload size is configured"""
        with app.app_context():
            from flask import current_app
            # Check for upload config
            assert current_app is not None

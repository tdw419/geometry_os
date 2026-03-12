#!/usr/bin/env python3
"""
setup.py for g-evolve
Geometry OS Evolution Daemon CLI

Install with: pip install -e .
Or publish to PyPI: python -m build && twine upload dist/*
"""

from pathlib import Path
from setuptools import setup, find_packages

# Read the README file
this_directory = Path(__file__).parent
long_description = (this_directory / "cli_anything" / "evolution_daemon" / "README.md").read_text()

setup(
    name="g-evolve",
    version="1.0.0",
    author="Geometry OS Team",
    author_email="dev@geometry-os.org",
    description="CLI for Geometry OS Evolution Daemon - Control brain mutations and self-repair",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/geometry-os/geometry-os",
    package_dir={"": "cli_anything"},
    packages=find_packages(where="cli_anything"),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
    ],
    python_requires=">=3.8",
    install_requires=[
        "click>=8.0",
        "pyyaml>=6.0",
        "psutil>=5.9",
    ],
    extras_require={
        "dev": [
            "pytest>=7.0",
            "black>=22.0",
            "flake8>=4.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "g-evolve=cli_anything.evolution_daemon.evolution_daemon_cli:cli",
        ],
    },
    include_package_data=True,
)

#!/usr/bin/env python3
"""
setup.py for g-shell

Geometry OS Shell - AI-Native Terminal with Spatial Computing

Install with: pip install -e .
Or publish to PyPI: python -m build && twine upload dist/*
"""

from setuptools import setup, find_namespace_packages

setup(
    name="g-shell",
    version="1.0.0",
    author="Geometry OS Contributors",
    author_email="",
    description="AI-Native Terminal with Spatial Computing - G-Shell bridges Linux terminal with Geometry OS",
    long_description=open("cli_anything/gshell/README.md", "r", encoding="utf-8").read()
    if __import__("os").path.exists("cli_anything/gshell/README.md")
    else "G-Shell: AI-Native Terminal with Spatial Computing",
    long_description_content_type="text/markdown",
    url="https://github.com/geometry-os/g-shell",
    packages=find_namespace_packages(include=["cli_anything.*"]),
    install_requires=[
        "click>=8.0.0",
        "pillow>=10.0.0",
        "numpy>=1.24.0",
        "aiohttp>=3.8.0",
    ],
    entry_points={
        "console_scripts": [
            "g-shell=cli_anything.gshell.gshell_cli:main",
            "gshell=cli_anything.gshell.gshell_cli:main",
        ],
    },
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Topic :: Terminals",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
    ],
    python_requires=">=3.10",
)

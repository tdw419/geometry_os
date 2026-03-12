#!/usr/bin/env python3
"""Setup for session-rotator CLI."""

from setuptools import setup, find_namespace_packages

setup(
    name="session-rotator",
    version="1.0.0",
    description="Autonomous session rotation for AI coding agents",
    author="Geometry OS",
    packages=find_namespace_packages(include=["cli_anything.*"]),
    install_requires=[
        "click>=8.0.0",
        "prompt-toolkit>=3.0.0",
    ],
    entry_points={
        "console_scripts": [
            "session-rotator=cli_anything.session_rotator.session_rotator_cli:main",
        ],
    },
    python_requires=">=3.10",
)

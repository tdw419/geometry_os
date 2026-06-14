from setuptools import setup, find_namespace_packages

setup(
    name="cli-anything-geometry-os",
    version="2.0.0",
    packages=find_namespace_packages(include=["cli_anything.*"]),
    install_requires=[
        "click>=8.0.0",
        "numpy",
        "Pillow",
    ],
    entry_points={
        "console_scripts": [
            "geo=cli_anything.geometry_os.geometry_os_cli:main",
        ],
    },
    python_requires=">=3.10",
)

# Solution for Task: Create animated progress bar for tile loading

[Geometry OS Implementation Agent]

Your goal is to provide a concise and detailed implementation plan or code solution for the OpenSpec task titled "Create animated progress bar for tile loading." The task requires changing the existing code to create an animated progress bar for tile loading.

Task Context:
The Geometry OS application aims to improve the user experience by providing a seamless navigation system, which includes tile loading functionality. However, the current implementation lacks animation and visual cues during the loading process. This task requires you to add an animated progress bar for tile loading, which will provide an engaging experience to users.

1. File Paths Required:
The following file paths require modification:
- `/home/user/workspace/geometryos/app/tiles/tiles_loader.py`
- `/home/user/.config/GeometryOS/tiles.ini`

Code Requirements:
To create the animated progress bar, you will need to modify the current tile loading code in the `tiles_loader.py` file. Here is a sample implementation of the progress bar using AnimatedIcon library:

```python
import sys
from enum import Enum
from typing import Callable, Optional

import pyqtgraph as pg
import numpy as np

from geometryos import __version__ as version
from geometryos.tiles.tiles_loader import TilesLoader


class ProgressBar(pg.QtGui.QPainterPath):
    def __init__(self, parent=None):
        super().__init__(parent)
        
    def draw(self, path, pen: pg.QtGui.QPen = None):
        """ Draw a progress bar with the given pen. """
        if not self._path:
            raise ValueError("ProgressBar has not been initialized.")
        
        # Get current position of the progress bar
        x0, y0, width, height = self._path.boundingRect().center()
        
        # Calculate pixel size for the animation (in px)
        pixel_size = 50 / 1280
        
        # Calculate position of the progress bar relative to the screen
        x0 *= pixel_size
        y0 *= pixel_size
        width *= pixel_size
        height *= pixel_size
        
        # Draw the current value (in px)
        path.moveTo(x0 + 5, y0 - 30)
        path.lineTo(x0, y0 - 20)
        path.lineTo(x0 + 5, y0)
        
        # Draw the progress bar
        pen = pg.QtGui.QPen(pg.QtCore.Qt.SolidLine, 1, color="black")
        self.drawPath(path, pen)
    
    def set_value(self, value):
        """ Set the current value (in px). """
        if not self._path:
            raise ValueError("ProgressBar has not been initialized.")
        
        # Calculate pixel size for the animation (in px)
        pixel_size = 50 / 1280
        
        # Calculate position of the progress bar relative to the screen
        x0 *= pixel_size
        y0 *= pixel_size
        width *= pixel_size
        height *= pixel_size
        
        # Draw the current value (in px)
        path.moveTo(x0 + 5, y0 - 30)
        path.lineTo(x0, y0 - 20)
        path.lineTo(x0 + 5, y0)
        
        # Draw the progress bar
        pen = pg.QtGui.QPen(pg.QtCore.Qt.SolidLine, 1, color="black")
        self.drawPath(path, pen)
    
    def draw_path(self, path: pg.QtCore.QPath, pen: Optional[pg.QtCore.QPen] = None):
        """ Draw the given path with the given pen. """
        if not self._path:
            raise ValueError("ProgressBar has not been initialized.")
        
        # Calculate pixel size for the animation (in px)
        pixel_size = 50 / 1280
        
        # Calculate position of the progress bar relative to the screen
        x0, y0, width, height = self._path.boundingRect().center()
        
        # Draw the current value (in px)
        path.moveTo(x0 + 5, y0 - 30)
        path.lineTo(x0, y0 - 20)
        path.lineTo(x0 + 5, y0)
        
        # Draw the progress bar
        pen = pg.QtGui.QPen(pg.QtCore.Qt.SolidLine, 1, color="black")
        self.drawPath(path, pen)
    
    def update_value(self, value: int):
        """ Set the current value (in px). """
        if not self._path:
            raise ValueError("ProgressBar has not been initialized.")
        
        # Calculate pixel size for the animation (in px)
        pixel_size = 50 / 1280
        
        # Calculate position of the progress bar relative to the screen
        x0, y0, width, height = self._path.boundingRect().center()
        
        # Draw the current value (in px)
        path.moveTo(x0 + 5, y0 - 30)
        path.lineTo(x0, y0 - 20)
        path.lineTo(x0 + 5, y0)
        
        # Draw the progress bar
        pen = pg.QtGui.QPen(pg.QtCore.Qt.SolidLine, 1, color="black")
        self.drawPath(path, pen)
    
    def update_percentage(self, percentage: float):
        """ Set the current value (in px). """
        if not self._path:
            raise ValueError("ProgressBar has not been initialized.")
        
        # Calculate pixel size for the animation (in px)
        pixel_size = 50 / 1280
        
        # Calculate position of the progress bar relative to the screen
        x0, y0, width, height = self._path.boundingRect().center()
        
        # Draw the current value (in px)
        path.moveTo(x0 + 5, y0 - 30)
        path.lineTo(x0, y0 - 20)
        path.lineTo(x0 + 5, y0)
        
        # Draw the progress bar
        pen = pg.QtGui.QPen(pg.QtCore.Qt.SolidLine, 1, color="black")
        self.drawPath(path, pen)
    
    def __str__(self):
        return f"ProgressBar (value: {self._value})"
```

The `AnimatedIcon` library is used to add the animation effect for the progress bar. You can replace this with any other animation library of your choice.

Examples:
- For a linear progress bar, you can use the `linear_progress_bar` function in the library. It returns a `pg.QtGui.QPainterPath` object that can be used to draw the path of the progress bar.

```python
from geometryos.tiles.tiles_loader import TilesLoader
import pgpathlib as pgp

# Define the tile loader and create a new `TilesLoader` instance
tiles_loader = TilesLoader(version)
tiles_loader.set_tiles_loader_config({})
tiles_loader.load()
tiles = tiles_loader.get_tiles()

# Create a ProgressBar object with the given tiles and tile loader
progress_bar = pgpathlib.LinearProgressBar(tiles)

# Update the progress bar value
progress_bar.update_value(100)

# Draw the progress bar using the `AnimatedIcon` library
pgp.animate_with_animations(
    pgpathlib.animated_icon,
    "linear_progress_bar",
    0,
    100,
    tiles,
    tiles_loader,
)
```

- For a circular progress bar, you can use the `circular_progress_bar` function in the library. It returns a `pg.QtGui.QPainterPath` object that can be used to draw the path of the progress bar.

```python
from geometryos.tiles.tiles_loader import TilesLoader
import pgpathlib as pgp

# Define the tile loader and create a new `TilesLoader` instance
tiles_loader = TilesLoader(version)
tiles_loader.set_tiles_loader_config({})
tiles = tiles_loader.get_tiles()

# Create a ProgressBar object with the given tiles and tile loader
progress_bar = pgpathlib.CircularProgressBar(tiles)

# Update the progress bar value
progress_bar.update_value(100)

# Draw the progress bar using the `AnimatedIcon` library
pgp.animate_with_animations(
    pgpathlib.animated_icon,
    "circular_progress_bar",
    0,
    100,
    tiles,
    tiles_loader,
)
```
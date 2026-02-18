# Solution for Task: Add animation on tooltip appearance

[File Paths Needed]:
- `src/ui/tooltip_animation.rs`: A Rust module containing the necessary code for creating tooltips and animating them.
- `src/app/app.rs`: The main entrypoint of the application, where we will add the `Tooltip` component which displays a custom animation on tooltips.

[Brief Snippet of Python or Rust Code Required]:
```python
from typing import Optional

import pyspecs_qt as pq
from PySide2.QtGui import QIcon, QPixmap
from PySide2.QtWidgets import QApplication, QPushButton


class Tooltip(QPushButton):
    def __init__(self, parent: QObject):
        super().__init__(parent)
        self.setFocusPolicy(Qt.NoFocus)
        self.setMinimumWidth(100)
        self.setMaximumWidth(200)
        self.setText(
            "Click here to see the animation: {}".format("https://i.imgur.com/M4Xh5wz.gif")
        )

    def mousePressEvent(self, event):
        if event.buttons() & Qt.LeftButton:
            self.setIcon(QIcon(QPixmap.fromImage(QImage("https://i.imgur.com/M4Xh5wz.gif"))))
            self.setText(
                "Click here to see the animation: {}".format("https://i.imgur.com/M4Xh5wz.gif")
            )
            event.accept()
        else:
            super().mousePressEvent(event)


class TooltipApp(QApplication):
    def __init__(self, argc: int, argv: list[str]):
        super().__init__(argc, argv)

        self.tooltips = []
        self.window_manager = pq.WindowManager()

    def window_created(self, window: pq.Window):
        for tooltip in window.tooltips():
            if not tooltip.isVisible():
                self.tooltips.append(tooltip)
                tooltip.setPixmap(QPixmap("https://i.imgur.com/M4Xh5wz.gif"))
                tooltip.show()
                self.window_manager.addTooltip(tooltip)
            else:
                tooltip.hide()
        window.activateWindow()

    def window_destroyed(self, window):
        for tooltip in self.tooltips:
            self.window_manager.removeTooltip(tooltip)
            tooltip.deleteLater()

    def main_loop(self):
        qapp = QApplication(sys.argv)
        self.tooltips = []
        self.window_manager = pq.WindowManager()

        self.window_created(QApplication.activeWindow())
        while not self.window_destroyed():
            qapp.exec_()
        self.window_manager.closeAllWindows()
        qapp.quit()

    def run(self):
        self.main_loop()


if __name__ == "__main__":
    app = TooltipApp(argc, argv)
    app.show()
```

['Next Step' Command for the User]:
- Click on the 'Create a File' button to create a new file in your project directory.
- Navigate to the `ui` directory and create a new `tooltip_animation.qml` file with the following code:

```qml
import QtQuick 2.15
import QtQuick.Controls 2.9
import QtQuick.Layouts 1.15
import System 1.0

Rectangle {
    id: root
    width: 300
    height: 200
    property string iconPath: "https://i.imgur.com/M4Xh5wz.gif"
    property string tooltipText: "Click here to see the animation:"
    property bool showTooltip: false

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            showTooltip = !showTooltip
            if (showTooltip) {
                Tooltip {
                    id: tooltip
                    anchors.centerIn: parent
                    text: tooltipText
                    iconSource: iconPath
                }
                tooltip.show()
            } else {
                tooltip.hide()
            }
        }
    }

    ToolTip {
        id: tooltip
        anchors.centerIn: parent
        onIconChanged: showTooltip = iconPath == "https://i.imgur.com/M4Xh5wz.gif"
        text: tooltipText
        iconSource: iconPath
    }

    RowLayout {
        spacing: 20
        anchors.centerIn: parent
        Row {
            width: parent.width
            Button {
                id: button
                text: "Click me"
                onPressed: mouseArea.mouseButton == Mouse.right ? mouseArea.show() : mouseArea.hide()
            }
        }
    }
}
```

[Adding the `ToolTip` component to the `App` class]:
- Navigate back to your main file in your project directory.
- Open the `App.py` file and add a new line before the import statement:

```python
from tooltip_animation import Tooltip
```

- Next, create an instance of the `Tooltip` class and pass it a reference to the `root` object from your previous code:

```python
class App(QApplication):
    def __init__(self, argc=None, argv=None):
        super().__init__(argc, argv)

        self.tooltips = []
        self.window_manager = pq.WindowManager()

        self.tooltip = Tooltip(parent: self)
        self.root = QPushButton("Click me")
        self.root.clicked.connect(self.showTooltip)

    def window_created(self, window):
        for tooltip in window.tooltips():
            if not tooltip.isVisible():
                self.tooltips.append(tooltip)
                tooltip.setIcon(QPixmap("https://i.imgur.com/M4Xh5wz.gif"))
                tooltip.show()
                self.window_manager.addTooltip(tooltip)
            else:
                tooltip.hide()
        window.activateWindow()

    def window_destroyed(self, window):
        for tooltip in self.tooltips:
            self.window_manager.removeTooltip(tooltip)
            tooltip.deleteLater()

    def main_loop(self):
        qapp = QApplication(sys.argv)
        self.tooltips = []
        self.window_manager = pq.WindowManager()

        self.showTooltip = True
        self.root.clicked.connect(_ => self.showTooltip = !self.showTooltip)

        self.tooltip.setPixmap(QPixmap("https://i.imgur.com/M4Xh5wz.gif"))
        self.tooltip.show()
        self.window_manager.addTooltip(self.tooltip)

        while not self.showTooltip:
            qapp.exec_()
        self.window_manager.closeAllWindows()
        qapp.quit()

    def run(self):
        self.main_loop()
```

[Adding the `pyspecs_qt` extension to your project]:
- Navigate back to your main file in your project directory.
- Create a new folder for your extensions and add it to your PYTHONPATH environment variable.
- Open a terminal or command prompt and navigate to the root of your project directory.
- Run `python -m pip install pypiwin32` to install the necessary library for PySide.
- Restart your terminal or command prompt.

Now that you have successfully installed these libraries, open up your `App.py` file and add the following lines:

```python
from pyspecs_qt import PyspecQtExtension

app = QApplication(sys.argv)
ext = PyspecQtExtension("your_extension_name")
ext.initialize()
```

Finally, run your application in the terminal or command prompt as before.
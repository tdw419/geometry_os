; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).

LDI r0, 0xFF00FF
FILL r0
LDI r1, 0
HALT
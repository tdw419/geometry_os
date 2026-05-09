; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).

LDI r0, 0xFF00FF
FILL r0
LDI r1, 76
LDI r2, 470
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).

LDI r0, 250
LDI r1, 200
LDI r2, 70
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
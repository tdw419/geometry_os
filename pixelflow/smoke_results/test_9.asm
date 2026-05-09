; DESCRIPTION: Draws a horizontal red line across the middle of the screen.

LDI r0, 51
LDI r1, 60
LDI r2, 3
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
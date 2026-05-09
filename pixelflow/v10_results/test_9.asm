; DESCRIPTION: Draws a horizontal red line across the middle of the screen.
LDI r0, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
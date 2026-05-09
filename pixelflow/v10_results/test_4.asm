; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).

LDI r0, 0
LDI r1, 0
LDI r2, 305
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
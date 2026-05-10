; DESCRIPTION: Draws a purple horizontal line across the screen at y=179.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 179
LDI r1, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple horizontal line across the screen at y=49.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 49
LDI r1, 0xAA00FFF
LINE r0, r1, r2, r3, r4
HALT

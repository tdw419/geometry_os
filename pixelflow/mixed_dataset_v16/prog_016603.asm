; DESCRIPTION: Draws a red horizontal line across the screen at y=3.
; PLAN: r0xFF0000(color). Op: r0.
LDI r0, 3
LDI r1, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

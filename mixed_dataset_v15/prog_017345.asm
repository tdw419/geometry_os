; DESCRIPTION: Draws a red horizontal line across the screen at y=9.
; PLAN: r0xFF0000(color). Op: r0.
LDI r0, 0
LDI r1, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

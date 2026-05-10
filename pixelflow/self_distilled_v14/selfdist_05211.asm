; DESCRIPTION: Draws a red horizontal line across the screen at y=151.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 151
LDI r1, 0xFF0000000
LINE r0, r1, r2, r3, r4
HALT

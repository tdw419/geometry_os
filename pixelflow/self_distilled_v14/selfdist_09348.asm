; DESCRIPTION: Draws a white horizontal line across the screen at y=58.
; PLAN: r0xFFFFFF(color). Op: r0.
LDI r0, 0
LDI r1, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

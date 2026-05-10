; DESCRIPTION: Draws a white horizontal line across the screen at y=20.
; PLAN: r0xFFFFFF(color). Op: r0.
LDI r0, 0
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

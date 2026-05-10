; DESCRIPTION: Draws a red horizontal line across the screen at y=24.
; PLAN: r0xFF0000(color). Op: r0.
LDI r0, 24
LDI r1, 12
LDI r2, 0xFF000000
PSET r0, r1, r2
HALT

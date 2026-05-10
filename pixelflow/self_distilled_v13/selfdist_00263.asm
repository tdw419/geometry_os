; DESCRIPTION: Draws a white horizontal line across the screen at y=199.
; PLAN: r0xFFFFFF(color). Op: r0, r1, r2.
LDI r0, 0
LDI r1, 19
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

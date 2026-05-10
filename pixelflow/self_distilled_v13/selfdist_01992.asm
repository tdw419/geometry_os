; DESCRIPTION: Draws a white horizontal line across the screen at y=75.
; PLAN: r0xFFFFFF(color). Op: r0.
LDI r0, 75
LDI r1, 0xFFFFFF
FILL r0
HALT

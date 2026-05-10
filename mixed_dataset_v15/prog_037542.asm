; DESCRIPTION: Draws a white horizontal line across the screen at y=32.
; PLAN: r0xFFFFFF(color). Op: r0.
LDI r0, 32
LDI r1, 0xFFFFFF
FILL r0
HALT

; DESCRIPTION: Draws a white horizontal line across the screen at y=77.
; PLAN: r0xFFFFFF(color). Op: r0.
LDI r0, 77
LDI r1, 0xFFFFFF
FILL r0
HALT

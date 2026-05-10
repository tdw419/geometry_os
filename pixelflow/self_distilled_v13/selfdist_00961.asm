; DESCRIPTION: Draws a white horizontal line across the screen at y=169.
; PLAN: r0xFFFFFF(color). Op: r0.
LDI r0, 0xFFFFFF
FILL r0
HALT

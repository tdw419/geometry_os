; DESCRIPTION: Draws a white horizontal line across the screen at y=53.
; PLAN: r0=0xFFFFFF(color). Op: FILL r0.
LDI r0, 0xFFFFFF
FILL r0
HALT

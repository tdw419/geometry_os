; DESCRIPTION: Draws a red horizontal line across the screen at y=144.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 0xFF0000
FILL r0
HALT

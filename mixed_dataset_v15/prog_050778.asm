; DESCRIPTION: Draws a red horizontal line across the screen at y=84.
; PLAN: r0xFF0000(color). Op: r0.
LDI r0, 84
LDI r1, 0xFF0000
FILL r0
HALT

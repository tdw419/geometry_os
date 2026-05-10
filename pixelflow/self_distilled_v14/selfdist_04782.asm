; DESCRIPTION: Draws a red horizontal line across the screen at y=152.
; PLAN: r0xFF0000(color). Op: FILL r0.
LDI r0, 152
LDI r1, 0xFF00000
FILL r0
HALT

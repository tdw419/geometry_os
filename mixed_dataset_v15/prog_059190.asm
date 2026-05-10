; DESCRIPTION: Draws a red horizontal line across the screen at y=76.
; PLAN: r0xFF0000(color). Op: r0.
LDI r0, 0xFF0000
FILL r0
HALT

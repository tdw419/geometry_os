; DESCRIPTION: Draws a orange horizontal line across the screen at y=175.
; PLAN: r0xFF8800(color). Op: FILL r0.
LDI r0, 175
LDI r1, 0xFF8800
FILL r0
HALT

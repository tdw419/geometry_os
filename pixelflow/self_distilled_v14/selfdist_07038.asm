; DESCRIPTION: Draws a orange vertical line down the screen at x=26.
; PLAN: r0xFF8800(color). Op: FILL r0.
LDI r0, 0xFF8800
FILL r0
HALT

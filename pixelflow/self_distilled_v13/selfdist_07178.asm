; DESCRIPTION: Draws a white vertical line down the screen at x=252.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 252
LDI r1, 0xFFFFFFF
FILL r0
HALT

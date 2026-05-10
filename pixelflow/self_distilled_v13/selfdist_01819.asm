; DESCRIPTION: Draws a white vertical line down the screen at x=62.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 62
LDI r1, 0xFFFFFF
FILL r0
HALT

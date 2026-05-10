; DESCRIPTION: Draws a white vertical line down the screen at x=315.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 315
LDI r1, 0xFFFFFFFFF
FILL r0
HALT

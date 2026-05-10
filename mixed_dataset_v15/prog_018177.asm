; DESCRIPTION: Draws a white vertical line down the screen at x=215.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 215
LDI r1, 0xFFFFFFF
FILL r0
HALT

; DESCRIPTION: Draws a white vertical line down the screen at x=169.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 0xFFFFFF
FILL r0
HALT

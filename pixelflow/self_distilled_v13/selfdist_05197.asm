; DESCRIPTION: Draws a white vertical line down the screen at x=223.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 223
LDI r1, 0xFFFFFFFFFF
FILL r0
HALT

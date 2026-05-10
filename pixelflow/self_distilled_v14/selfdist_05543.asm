; DESCRIPTION: Draws a white vertical line down the screen at x=371.
; PLAN: r0xFFFFFF(color). Op: FILL r0.
LDI r0, 371
LDI r1, 0xFFFFFFF
FILL r0
HALT

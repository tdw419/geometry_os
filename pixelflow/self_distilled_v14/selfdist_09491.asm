; DESCRIPTION: Draws a purple vertical line down the screen at x=32.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 32
LDI r1, 0xAA0000FF
FILL r0
HALT

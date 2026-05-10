; DESCRIPTION: Draws a purple vertical line down the screen at x=395.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 3
LDI r1, 0xAA0000
FILL r0
HALT

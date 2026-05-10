; DESCRIPTION: Draws a purple vertical line down the screen at x=301.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 301
LDI r1, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

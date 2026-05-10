; DESCRIPTION: Draws a purple vertical line down the screen at x=238.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 238
LDI r1, 0xAA00FF
FILL r0
HALT

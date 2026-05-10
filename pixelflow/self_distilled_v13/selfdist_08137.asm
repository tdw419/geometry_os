; DESCRIPTION: Draws a purple vertical line down the screen at x=210.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 0xAA00FF
FILL r0
HALT

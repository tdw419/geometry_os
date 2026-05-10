; DESCRIPTION: Draws a purple vertical line down the screen at x=241.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 241
LDI r1, 25
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT

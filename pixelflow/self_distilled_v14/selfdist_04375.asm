; DESCRIPTION: Draws a purple vertical line down the screen at x=246.
; PLAN: r0xAA00FF(color). Op: FILL r0.
LDI r0, 246
LDI r1, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

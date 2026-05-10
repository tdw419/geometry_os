; DESCRIPTION: Draws a orange vertical line down the screen at x=326.
; PLAN: r0xFF8800(color). Op: r0.
LDI r0, 326
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT

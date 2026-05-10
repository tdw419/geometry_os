; DESCRIPTION: Draws a magenta vertical line down the screen at x=99.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 99
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT

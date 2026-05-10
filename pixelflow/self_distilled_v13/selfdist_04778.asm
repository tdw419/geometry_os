; DESCRIPTION: Draws a magenta vertical line down the screen at x=314.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 314
LDI r1, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

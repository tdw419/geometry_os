; DESCRIPTION: Draws a magenta vertical line down the screen at x=92.
; PLAN: r0xFF00FF(color). Op: FILL r0.
LDI r0, 92
LDI r1, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

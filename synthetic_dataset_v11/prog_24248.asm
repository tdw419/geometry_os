; DESCRIPTION: Draws a magenta circle centered at (31, 145) with radius 27.
; PLAN: r0=31(x), r1=145(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 145
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

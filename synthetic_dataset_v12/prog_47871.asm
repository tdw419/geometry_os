; DESCRIPTION: Draws a magenta circle centered at (84, 160) with radius 30.
; PLAN: r0=84(x), r1=160(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 160
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

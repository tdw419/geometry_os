; DESCRIPTION: Draws a magenta circle centered at (182, 56) with radius 30.
; PLAN: r0=182(x), r1=56(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 56
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

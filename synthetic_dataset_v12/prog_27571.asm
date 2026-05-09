; DESCRIPTION: Draws a magenta circle centered at (325, 81) with radius 63.
; PLAN: r0=325(x), r1=81(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 81
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

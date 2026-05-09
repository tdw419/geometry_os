; DESCRIPTION: Draws a magenta circle centered at (427, 114) with radius 56.
; PLAN: r0=427(x), r1=114(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 114
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

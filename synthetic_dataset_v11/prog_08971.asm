; DESCRIPTION: Draws a magenta circle centered at (191, 132) with radius 58.
; PLAN: r0=191(x), r1=132(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 132
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

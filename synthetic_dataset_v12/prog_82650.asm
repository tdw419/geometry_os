; DESCRIPTION: Draws a magenta circle centered at (112, 132) with radius 28.
; PLAN: r0=112(x), r1=132(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 132
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

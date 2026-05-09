; DESCRIPTION: Draws a magenta circle centered at (112, 147) with radius 76.
; PLAN: r0=112(x), r1=147(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 147
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

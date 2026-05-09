; DESCRIPTION: Draws a blue circle centered at (147, 159) with radius 61.
; PLAN: r0=147(x), r1=159(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 159
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

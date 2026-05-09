; DESCRIPTION: Draws a purple circle centered at (147, 103) with radius 50.
; PLAN: r0=147(x), r1=103(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 103
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

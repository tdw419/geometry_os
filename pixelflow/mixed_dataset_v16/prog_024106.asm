; DESCRIPTION: Draws a yellow circle centered at (120, 147) with radius 69.
; PLAN: r0=120(x), r1=147(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 147
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

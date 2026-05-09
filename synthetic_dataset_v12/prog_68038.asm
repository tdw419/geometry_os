; DESCRIPTION: Draws a yellow circle centered at (221, 147) with radius 24.
; PLAN: r0=221(x), r1=147(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 147
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

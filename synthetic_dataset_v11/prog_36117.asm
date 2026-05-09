; DESCRIPTION: Draws a white circle centered at (170, 147) with radius 46.
; PLAN: r0=170(x), r1=147(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 147
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

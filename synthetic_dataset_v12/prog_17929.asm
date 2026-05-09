; DESCRIPTION: Draws a white circle centered at (308, 147) with radius 44.
; PLAN: r0=308(x), r1=147(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 147
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

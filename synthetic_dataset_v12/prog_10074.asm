; DESCRIPTION: Draws a white circle centered at (189, 201) with radius 33.
; PLAN: r0=189(x), r1=201(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 201
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

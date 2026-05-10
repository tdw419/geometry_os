; DESCRIPTION: Draws a green circle centered at (163, 152) with radius 33.
; PLAN: r0=163(x), r1=152(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 152
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

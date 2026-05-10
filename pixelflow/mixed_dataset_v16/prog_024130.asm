; DESCRIPTION: Draws a green circle centered at (157, 152) with radius 37.
; PLAN: r0=157(x), r1=152(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 152
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

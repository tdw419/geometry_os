; DESCRIPTION: Draws a green circle centered at (275, 192) with radius 47.
; PLAN: r0=275(x), r1=192(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 192
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

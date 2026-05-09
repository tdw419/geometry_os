; DESCRIPTION: Draws a green circle centered at (331, 100) with radius 46.
; PLAN: r0=331(x), r1=100(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 100
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

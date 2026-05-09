; DESCRIPTION: Creates a yellow circular shape at (98, 136) with radius 13.
; PLAN: r0=98(x), r1=136(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 136
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

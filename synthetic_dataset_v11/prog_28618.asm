; DESCRIPTION: Creates a yellow circular shape at (212, 136) with radius 34.
; PLAN: r0=212(x), r1=136(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 136
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

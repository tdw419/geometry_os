; DESCRIPTION: Creates a yellow circular shape at (422, 156) with radius 47.
; PLAN: r0=422(x), r1=156(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 156
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

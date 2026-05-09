; DESCRIPTION: Creates a yellow circular shape at (357, 204) with radius 23.
; PLAN: r0=357(x), r1=204(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 204
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

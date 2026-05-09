; DESCRIPTION: Creates a yellow circular shape at (421, 44) with radius 34.
; PLAN: r0=421(x), r1=44(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 44
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

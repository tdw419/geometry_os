; DESCRIPTION: Creates a yellow circular shape at (283, 58) with radius 55.
; PLAN: r0=283(x), r1=58(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 58
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

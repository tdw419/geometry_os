; DESCRIPTION: Creates a yellow circular shape at (312, 95) with radius 13.
; PLAN: r0=312(x), r1=95(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 95
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

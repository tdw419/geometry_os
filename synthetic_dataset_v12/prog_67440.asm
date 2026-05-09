; DESCRIPTION: Creates a yellow circular shape at (418, 96) with radius 22.
; PLAN: r0=418(x), r1=96(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 96
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a yellow circular shape at (108, 201) with radius 16.
; PLAN: r0=108(x), r1=201(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 201
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

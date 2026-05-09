; DESCRIPTION: Creates a yellow circular shape at (381, 196) with radius 31.
; PLAN: r0=381(x), r1=196(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 196
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

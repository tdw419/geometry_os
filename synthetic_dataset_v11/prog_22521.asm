; DESCRIPTION: Creates a yellow circular shape at (40, 124) with radius 12.
; PLAN: r0=40(x), r1=124(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 124
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

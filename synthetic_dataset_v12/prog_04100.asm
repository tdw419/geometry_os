; DESCRIPTION: Creates a yellow circular shape at (131, 124) with radius 26.
; PLAN: r0=131(x), r1=124(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 124
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

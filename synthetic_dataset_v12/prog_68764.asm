; DESCRIPTION: Creates a yellow circular shape at (420, 123) with radius 24.
; PLAN: r0=420(x), r1=123(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 123
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a yellow circular shape at (158, 139) with radius 18.
; PLAN: r0=158(x), r1=139(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 139
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

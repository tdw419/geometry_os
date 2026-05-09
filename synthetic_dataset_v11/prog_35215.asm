; DESCRIPTION: Creates a yellow circular shape at (22, 233) with radius 22.
; PLAN: r0=22(x), r1=233(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 233
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

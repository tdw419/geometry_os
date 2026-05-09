; DESCRIPTION: Creates a yellow circular shape at (410, 88) with radius 77.
; PLAN: r0=410(x), r1=88(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 88
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

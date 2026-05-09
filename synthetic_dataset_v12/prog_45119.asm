; DESCRIPTION: Creates a yellow circular shape at (269, 102) with radius 77.
; PLAN: r0=269(x), r1=102(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 102
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

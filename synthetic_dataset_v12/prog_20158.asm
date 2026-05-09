; DESCRIPTION: Creates a yellow circular shape at (286, 175) with radius 26.
; PLAN: r0=286(x), r1=175(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 175
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

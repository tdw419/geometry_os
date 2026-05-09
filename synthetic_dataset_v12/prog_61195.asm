; DESCRIPTION: Creates a yellow circular shape at (226, 137) with radius 26.
; PLAN: r0=226(x), r1=137(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 137
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

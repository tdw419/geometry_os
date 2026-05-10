; DESCRIPTION: Creates a yellow circular shape at (172, 172) with radius 73.
; PLAN: r0=172(x), r1=172(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 172
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

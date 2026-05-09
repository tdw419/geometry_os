; DESCRIPTION: Creates a yellow circular shape at (112, 172) with radius 79.
; PLAN: r0=112(x), r1=172(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 172
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

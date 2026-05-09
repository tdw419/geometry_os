; DESCRIPTION: Creates a yellow circular shape at (109, 174) with radius 61.
; PLAN: r0=109(x), r1=174(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 174
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a yellow circular shape at (181, 80) with radius 61.
; PLAN: r0=181(x), r1=80(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 80
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

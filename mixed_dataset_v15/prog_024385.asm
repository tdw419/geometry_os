; DESCRIPTION: Creates a green circular shape at (314, 61) with radius 46.
; PLAN: r0=314(x), r1=61(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 61
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

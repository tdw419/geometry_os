; DESCRIPTION: Creates a green circular shape at (331, 71) with radius 56.
; PLAN: r0=331(x), r1=71(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 71
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

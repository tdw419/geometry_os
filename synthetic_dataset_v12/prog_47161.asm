; DESCRIPTION: Creates a green circular shape at (373, 60) with radius 34.
; PLAN: r0=373(x), r1=60(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 60
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

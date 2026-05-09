; DESCRIPTION: Creates a green circular shape at (217, 87) with radius 34.
; PLAN: r0=217(x), r1=87(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 87
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a green circular shape at (217, 140) with radius 49.
; PLAN: r0=217(x), r1=140(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 140
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

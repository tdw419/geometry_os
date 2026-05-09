; DESCRIPTION: Creates a green circular shape at (174, 183) with radius 70.
; PLAN: r0=174(x), r1=183(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 183
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

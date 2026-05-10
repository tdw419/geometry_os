; DESCRIPTION: Creates a white circular shape at (44, 185) with radius 22.
; PLAN: r0=44(x), r1=185(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 185
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

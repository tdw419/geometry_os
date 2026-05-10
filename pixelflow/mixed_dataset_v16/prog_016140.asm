; DESCRIPTION: Renders a white circular shape at (381, 118) with radius 33.
; PLAN: r0=381(x), r1=118(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 118
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

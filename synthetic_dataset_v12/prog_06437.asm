; DESCRIPTION: Creates a white circular shape at (424, 140) with radius 26.
; PLAN: r0=424(x), r1=140(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 140
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

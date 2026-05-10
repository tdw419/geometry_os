; DESCRIPTION: Creates a white circular shape at (248, 140) with radius 54.
; PLAN: r0=248(x), r1=140(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 140
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

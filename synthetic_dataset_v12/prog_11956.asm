; DESCRIPTION: Creates a white circular shape at (390, 187) with radius 53.
; PLAN: r0=390(x), r1=187(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 187
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

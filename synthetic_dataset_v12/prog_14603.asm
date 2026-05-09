; DESCRIPTION: Creates a white circular shape at (211, 70) with radius 35.
; PLAN: r0=211(x), r1=70(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 70
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

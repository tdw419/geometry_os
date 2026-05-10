; DESCRIPTION: Creates a white circular shape at (254, 140) with radius 70.
; PLAN: r0=254(x), r1=140(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 140
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

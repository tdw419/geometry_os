; DESCRIPTION: Creates a white circular shape at (317, 123) with radius 40.
; PLAN: r0=317(x), r1=123(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 123
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

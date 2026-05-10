; DESCRIPTION: Renders a white circular shape at (115, 123) with radius 49.
; PLAN: r0=115(x), r1=123(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 123
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a white circular shape at (202, 123) with radius 52.
; PLAN: r0=202(x), r1=123(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 123
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

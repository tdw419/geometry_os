; DESCRIPTION: Creates a black circular shape at (200, 185) with radius 52.
; PLAN: r0=200(x), r1=185(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 185
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

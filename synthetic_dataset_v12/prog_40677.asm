; DESCRIPTION: Creates a black circular shape at (452, 185) with radius 16.
; PLAN: r0=452(x), r1=185(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 185
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

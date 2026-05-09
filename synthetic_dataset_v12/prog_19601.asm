; DESCRIPTION: Creates a black circular shape at (308, 95) with radius 31.
; PLAN: r0=308(x), r1=95(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 95
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

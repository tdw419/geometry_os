; DESCRIPTION: Creates a black circular shape at (120, 95) with radius 60.
; PLAN: r0=120(x), r1=95(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 95
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

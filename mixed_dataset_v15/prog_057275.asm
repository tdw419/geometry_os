; DESCRIPTION: Creates a black circular shape at (211, 120) with radius 60.
; PLAN: r0=211(x), r1=120(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 120
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

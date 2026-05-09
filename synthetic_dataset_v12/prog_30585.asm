; DESCRIPTION: Creates a black circular shape at (439, 164) with radius 52.
; PLAN: r0=439(x), r1=164(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 164
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

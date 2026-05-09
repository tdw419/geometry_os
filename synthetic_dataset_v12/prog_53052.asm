; DESCRIPTION: Creates a black circular shape at (365, 95) with radius 10.
; PLAN: r0=365(x), r1=95(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 95
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

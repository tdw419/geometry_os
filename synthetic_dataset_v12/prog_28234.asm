; DESCRIPTION: Creates a blue circular shape at (439, 85) with radius 10.
; PLAN: r0=439(x), r1=85(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 85
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a blue circular shape at (439, 123) with radius 16.
; PLAN: r0=439(x), r1=123(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 123
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a blue circular shape at (439, 114) with radius 73.
; PLAN: r0=439(x), r1=114(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 114
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a blue circular shape at (78, 128) with radius 77.
; PLAN: r0=78(x), r1=128(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 128
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

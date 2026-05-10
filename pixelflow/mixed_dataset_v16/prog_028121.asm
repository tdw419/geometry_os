; DESCRIPTION: Creates a blue circular shape at (77, 64) with radius 20.
; PLAN: r0=77(x), r1=64(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 64
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

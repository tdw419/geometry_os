; DESCRIPTION: Creates a blue circular shape at (44, 137) with radius 20.
; PLAN: r0=44(x), r1=137(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 137
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

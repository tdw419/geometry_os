; DESCRIPTION: Creates a blue circular shape at (44, 136) with radius 16.
; PLAN: r0=44(x), r1=136(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 136
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

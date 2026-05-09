; DESCRIPTION: Creates a blue circular shape at (240, 119) with radius 54.
; PLAN: r0=240(x), r1=119(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 119
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

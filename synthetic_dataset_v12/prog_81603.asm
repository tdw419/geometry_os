; DESCRIPTION: Creates a blue circular shape at (225, 99) with radius 73.
; PLAN: r0=225(x), r1=99(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 99
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

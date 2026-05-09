; DESCRIPTION: Creates a blue circular shape at (80, 83) with radius 58.
; PLAN: r0=80(x), r1=83(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 83
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

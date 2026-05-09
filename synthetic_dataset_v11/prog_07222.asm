; DESCRIPTION: Creates a blue circular shape at (212, 83) with radius 34.
; PLAN: r0=212(x), r1=83(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 83
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

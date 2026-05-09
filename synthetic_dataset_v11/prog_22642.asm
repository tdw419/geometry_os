; DESCRIPTION: Creates a blue circular shape at (56, 212) with radius 14.
; PLAN: r0=56(x), r1=212(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 212
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

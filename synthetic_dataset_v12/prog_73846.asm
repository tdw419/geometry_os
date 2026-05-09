; DESCRIPTION: Creates a blue circular shape at (90, 26) with radius 13.
; PLAN: r0=90(x), r1=26(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 26
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

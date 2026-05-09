; DESCRIPTION: Creates a cyan circular shape at (390, 66) with radius 62.
; PLAN: r0=390(x), r1=66(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 66
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

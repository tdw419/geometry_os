; DESCRIPTION: Creates a cyan circular shape at (227, 217) with radius 39.
; PLAN: r0=227(x), r1=217(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 217
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

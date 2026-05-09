; DESCRIPTION: Creates a cyan circular shape at (49, 170) with radius 14.
; PLAN: r0=49(x), r1=170(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 170
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

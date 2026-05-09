; DESCRIPTION: Creates a cyan circular shape at (49, 83) with radius 25.
; PLAN: r0=49(x), r1=83(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 83
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

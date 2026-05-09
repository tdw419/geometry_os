; DESCRIPTION: Creates a cyan circular shape at (477, 139) with radius 13.
; PLAN: r0=477(x), r1=139(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 139
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

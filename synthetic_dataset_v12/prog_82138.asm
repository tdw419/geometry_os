; DESCRIPTION: Creates a cyan circular shape at (89, 157) with radius 28.
; PLAN: r0=89(x), r1=157(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 157
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

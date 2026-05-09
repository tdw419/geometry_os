; DESCRIPTION: Creates a cyan circular shape at (190, 137) with radius 23.
; PLAN: r0=190(x), r1=137(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 137
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a cyan circular shape at (190, 212) with radius 26.
; PLAN: r0=190(x), r1=212(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 212
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

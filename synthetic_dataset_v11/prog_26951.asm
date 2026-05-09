; DESCRIPTION: Creates a cyan circular shape at (70, 190) with radius 38.
; PLAN: r0=70(x), r1=190(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 190
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

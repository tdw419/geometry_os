; DESCRIPTION: Creates a cyan circular shape at (190, 150) with radius 30.
; PLAN: r0=190(x), r1=150(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 150
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

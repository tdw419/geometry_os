; DESCRIPTION: Creates a cyan circular shape at (43, 212) with radius 30.
; PLAN: r0=43(x), r1=212(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 212
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

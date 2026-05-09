; DESCRIPTION: Creates a cyan circular shape at (139, 197) with radius 15.
; PLAN: r0=139(x), r1=197(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 197
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

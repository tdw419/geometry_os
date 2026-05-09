; DESCRIPTION: Creates a cyan circular shape at (97, 58) with radius 28.
; PLAN: r0=97(x), r1=58(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 58
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

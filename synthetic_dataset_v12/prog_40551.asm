; DESCRIPTION: Creates a cyan circular shape at (341, 192) with radius 46.
; PLAN: r0=341(x), r1=192(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 192
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

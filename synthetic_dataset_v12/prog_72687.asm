; DESCRIPTION: Creates a cyan circular shape at (414, 195) with radius 38.
; PLAN: r0=414(x), r1=195(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 195
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

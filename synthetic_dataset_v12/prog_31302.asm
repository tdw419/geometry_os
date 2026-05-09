; DESCRIPTION: Creates a cyan circular shape at (357, 58) with radius 13.
; PLAN: r0=357(x), r1=58(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 58
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

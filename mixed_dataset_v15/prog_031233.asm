; DESCRIPTION: Creates a cyan circular shape at (201, 192) with radius 42.
; PLAN: r0=201(x), r1=192(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 192
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a cyan circular shape at (405, 86) with radius 13.
; PLAN: r0=405(x), r1=86(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 86
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

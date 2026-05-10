; DESCRIPTION: Creates a cyan circular shape at (405, 119) with radius 36.
; PLAN: r0=405(x), r1=119(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 119
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

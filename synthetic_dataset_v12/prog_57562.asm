; DESCRIPTION: Creates a cyan circular shape at (228, 119) with radius 13.
; PLAN: r0=228(x), r1=119(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 119
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

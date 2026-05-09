; DESCRIPTION: Creates a cyan circular shape at (115, 24) with radius 17.
; PLAN: r0=115(x), r1=24(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 24
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

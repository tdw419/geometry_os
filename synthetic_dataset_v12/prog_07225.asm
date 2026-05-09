; DESCRIPTION: Creates a cyan circular shape at (81, 13) with radius 11.
; PLAN: r0=81(x), r1=13(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 13
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

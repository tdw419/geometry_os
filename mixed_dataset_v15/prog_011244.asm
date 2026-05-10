; DESCRIPTION: Creates a cyan circular shape at (306, 89) with radius 32.
; PLAN: r0=306(x), r1=89(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 89
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

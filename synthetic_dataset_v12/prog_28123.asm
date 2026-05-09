; DESCRIPTION: Creates a cyan circular shape at (136, 115) with radius 71.
; PLAN: r0=136(x), r1=115(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 115
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

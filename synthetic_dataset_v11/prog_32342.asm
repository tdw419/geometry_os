; DESCRIPTION: Creates a cyan circular shape at (130, 138) with radius 39.
; PLAN: r0=130(x), r1=138(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 138
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

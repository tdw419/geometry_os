; DESCRIPTION: Creates a cyan circular shape at (71, 161) with radius 34.
; PLAN: r0=71(x), r1=161(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 161
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

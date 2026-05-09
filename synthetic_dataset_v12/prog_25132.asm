; DESCRIPTION: Creates a cyan circular shape at (164, 83) with radius 54.
; PLAN: r0=164(x), r1=83(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 83
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

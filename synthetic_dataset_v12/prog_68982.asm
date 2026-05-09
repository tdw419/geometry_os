; DESCRIPTION: Creates a cyan circular shape at (161, 104) with radius 33.
; PLAN: r0=161(x), r1=104(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 104
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

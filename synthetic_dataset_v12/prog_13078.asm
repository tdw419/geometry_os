; DESCRIPTION: Creates a cyan circular shape at (124, 94) with radius 69.
; PLAN: r0=124(x), r1=94(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 94
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a cyan circular shape at (141, 37) with radius 33.
; PLAN: r0=141(x), r1=37(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 37
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

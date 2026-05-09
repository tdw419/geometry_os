; DESCRIPTION: Creates a cyan circular shape at (86, 102) with radius 73.
; PLAN: r0=86(x), r1=102(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 102
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a cyan circular shape at (86, 57) with radius 14.
; PLAN: r0=86(x), r1=57(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 57
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

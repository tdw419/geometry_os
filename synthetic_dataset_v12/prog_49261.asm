; DESCRIPTION: Creates a cyan circular shape at (315, 175) with radius 33.
; PLAN: r0=315(x), r1=175(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 175
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a cyan circular shape at (94, 175) with radius 75.
; PLAN: r0=94(x), r1=175(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 175
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

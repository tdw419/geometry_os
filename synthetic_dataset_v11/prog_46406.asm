; DESCRIPTION: Creates a cyan circular shape at (185, 170) with radius 47.
; PLAN: r0=185(x), r1=170(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 170
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

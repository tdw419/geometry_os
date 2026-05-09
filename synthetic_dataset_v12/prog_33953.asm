; DESCRIPTION: Creates a cyan circular shape at (44, 200) with radius 39.
; PLAN: r0=44(x), r1=200(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 200
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

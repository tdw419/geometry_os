; DESCRIPTION: Creates a cyan circular shape at (78, 97) with radius 25.
; PLAN: r0=78(x), r1=97(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 97
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

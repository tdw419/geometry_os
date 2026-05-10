; DESCRIPTION: Creates a cyan circular shape at (138, 97) with radius 60.
; PLAN: r0=138(x), r1=97(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 97
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

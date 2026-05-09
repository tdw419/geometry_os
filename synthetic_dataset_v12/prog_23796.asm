; DESCRIPTION: Creates a cyan circular shape at (125, 78) with radius 73.
; PLAN: r0=125(x), r1=78(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 78
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

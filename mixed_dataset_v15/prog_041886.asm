; DESCRIPTION: Creates a cyan circular shape at (96, 102) with radius 66.
; PLAN: r0=96(x), r1=102(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 102
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

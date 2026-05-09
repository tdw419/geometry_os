; DESCRIPTION: Creates a cyan circular shape at (81, 105) with radius 79.
; PLAN: r0=81(x), r1=105(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 105
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

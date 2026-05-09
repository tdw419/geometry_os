; DESCRIPTION: Creates a cyan circular shape at (309, 138) with radius 77.
; PLAN: r0=309(x), r1=138(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 138
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

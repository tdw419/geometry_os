; DESCRIPTION: Creates a cyan circular shape at (399, 106) with radius 75.
; PLAN: r0=399(x), r1=106(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 106
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

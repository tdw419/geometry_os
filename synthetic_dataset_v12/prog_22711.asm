; DESCRIPTION: Creates a cyan circular shape at (225, 106) with radius 61.
; PLAN: r0=225(x), r1=106(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 106
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

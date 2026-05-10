; DESCRIPTION: Creates a cyan circular shape at (225, 40) with radius 39.
; PLAN: r0=225(x), r1=40(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 40
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

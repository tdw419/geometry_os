; DESCRIPTION: Creates a cyan circular shape at (225, 73) with radius 18.
; PLAN: r0=225(x), r1=73(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 73
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

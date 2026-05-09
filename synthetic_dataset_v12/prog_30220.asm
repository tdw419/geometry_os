; DESCRIPTION: Creates a cyan circular shape at (162, 141) with radius 39.
; PLAN: r0=162(x), r1=141(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 141
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

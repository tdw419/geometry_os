; DESCRIPTION: Creates a cyan circular shape at (165, 158) with radius 19.
; PLAN: r0=165(x), r1=158(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 158
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

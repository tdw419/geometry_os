; DESCRIPTION: Creates a cyan circular shape at (165, 179) with radius 35.
; PLAN: r0=165(x), r1=179(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 179
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

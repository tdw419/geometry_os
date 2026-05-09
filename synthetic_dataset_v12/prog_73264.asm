; DESCRIPTION: Creates a cyan circular shape at (133, 115) with radius 35.
; PLAN: r0=133(x), r1=115(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 115
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

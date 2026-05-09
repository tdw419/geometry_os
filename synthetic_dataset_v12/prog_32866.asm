; DESCRIPTION: Creates a cyan circular shape at (184, 115) with radius 40.
; PLAN: r0=184(x), r1=115(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 115
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

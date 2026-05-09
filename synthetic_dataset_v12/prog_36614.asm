; DESCRIPTION: Creates a cyan circular shape at (178, 49) with radius 36.
; PLAN: r0=178(x), r1=49(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 49
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

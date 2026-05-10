; DESCRIPTION: Creates a cyan circular shape at (292, 200) with radius 21.
; PLAN: r0=292(x), r1=200(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 200
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

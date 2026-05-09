; DESCRIPTION: Creates a cyan circular shape at (261, 74) with radius 60.
; PLAN: r0=261(x), r1=74(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 74
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

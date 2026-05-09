; DESCRIPTION: Creates a cyan circular shape at (360, 75) with radius 74.
; PLAN: r0=360(x), r1=75(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 75
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a cyan circular shape at (64, 75) with radius 38.
; PLAN: r0=64(x), r1=75(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 75
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

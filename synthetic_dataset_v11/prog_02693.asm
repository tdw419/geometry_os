; DESCRIPTION: Creates a cyan circular shape at (76, 61) with radius 36.
; PLAN: r0=76(x), r1=61(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 61
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

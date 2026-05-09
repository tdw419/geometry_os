; DESCRIPTION: Creates a cyan circular shape at (119, 92) with radius 11.
; PLAN: r0=119(x), r1=92(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 92
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

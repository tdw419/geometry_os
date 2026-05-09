; DESCRIPTION: Creates a cyan circular shape at (45, 64) with radius 13.
; PLAN: r0=45(x), r1=64(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 64
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

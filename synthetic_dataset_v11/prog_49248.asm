; DESCRIPTION: Creates a cyan circular shape at (222, 238) with radius 18.
; PLAN: r0=222(x), r1=238(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 238
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

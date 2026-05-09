; DESCRIPTION: Creates a cyan circular shape at (222, 184) with radius 37.
; PLAN: r0=222(x), r1=184(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 184
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

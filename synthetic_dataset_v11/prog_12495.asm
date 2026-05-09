; DESCRIPTION: Creates a cyan circular shape at (134, 155) with radius 46.
; PLAN: r0=134(x), r1=155(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 155
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

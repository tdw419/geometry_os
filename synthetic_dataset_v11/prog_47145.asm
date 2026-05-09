; DESCRIPTION: Creates a cyan circular shape at (134, 111) with radius 76.
; PLAN: r0=134(x), r1=111(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 111
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

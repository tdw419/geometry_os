; DESCRIPTION: Creates a cyan circular shape at (274, 100) with radius 37.
; PLAN: r0=274(x), r1=100(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 100
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

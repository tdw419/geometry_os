; DESCRIPTION: Creates a cyan circular shape at (382, 185) with radius 33.
; PLAN: r0=382(x), r1=185(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 185
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

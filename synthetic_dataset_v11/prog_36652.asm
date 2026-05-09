; DESCRIPTION: Creates a cyan circular shape at (124, 183) with radius 55.
; PLAN: r0=124(x), r1=183(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 183
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

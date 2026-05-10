; DESCRIPTION: Creates a cyan circular shape at (124, 177) with radius 33.
; PLAN: r0=124(x), r1=177(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 177
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

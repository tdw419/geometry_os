; DESCRIPTION: Creates a cyan circular shape at (177, 124) with radius 27.
; PLAN: r0=177(x), r1=124(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 124
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

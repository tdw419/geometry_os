; DESCRIPTION: Creates a cyan circular shape at (144, 124) with radius 68.
; PLAN: r0=144(x), r1=124(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 124
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

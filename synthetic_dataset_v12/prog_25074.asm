; DESCRIPTION: Creates a cyan circular shape at (119, 182) with radius 68.
; PLAN: r0=119(x), r1=182(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 182
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

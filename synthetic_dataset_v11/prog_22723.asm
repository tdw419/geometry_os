; DESCRIPTION: Creates a cyan circular shape at (182, 182) with radius 11.
; PLAN: r0=182(x), r1=182(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 182
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

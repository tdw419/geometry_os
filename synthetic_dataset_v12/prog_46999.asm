; DESCRIPTION: Creates a cyan circular shape at (214, 182) with radius 67.
; PLAN: r0=214(x), r1=182(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 182
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

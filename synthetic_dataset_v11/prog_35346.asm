; DESCRIPTION: Creates a yellow circular shape at (109, 182) with radius 57.
; PLAN: r0=109(x), r1=182(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 182
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

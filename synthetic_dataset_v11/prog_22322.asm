; DESCRIPTION: Creates a yellow circular shape at (71, 182) with radius 65.
; PLAN: r0=71(x), r1=182(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 182
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

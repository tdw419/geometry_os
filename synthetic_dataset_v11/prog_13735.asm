; DESCRIPTION: Draws a red circle centered at (172, 182) with radius 71.
; PLAN: r0=172(x), r1=182(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 182
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

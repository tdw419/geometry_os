; DESCRIPTION: Draws a red circle centered at (176, 182) with radius 17.
; PLAN: r0=176(x), r1=182(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 182
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

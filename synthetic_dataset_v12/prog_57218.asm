; DESCRIPTION: Draws a red circle centered at (349, 182) with radius 37.
; PLAN: r0=349(x), r1=182(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 182
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

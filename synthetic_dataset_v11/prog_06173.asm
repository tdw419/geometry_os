; DESCRIPTION: Draws a red circle centered at (49, 182) with radius 38.
; PLAN: r0=49(x), r1=182(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 182
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

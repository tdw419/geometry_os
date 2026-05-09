; DESCRIPTION: Draws a red circle centered at (341, 217) with radius 22.
; PLAN: r0=341(x), r1=217(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 217
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

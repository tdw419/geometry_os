; DESCRIPTION: Draws a red circle centered at (312, 190) with radius 13.
; PLAN: r0=312(x), r1=190(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 190
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (373, 190) with radius 41.
; PLAN: r0=373(x), r1=190(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 190
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

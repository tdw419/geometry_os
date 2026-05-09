; DESCRIPTION: Draws a green circle centered at (379, 190) with radius 41.
; PLAN: r0=379(x), r1=190(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 190
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

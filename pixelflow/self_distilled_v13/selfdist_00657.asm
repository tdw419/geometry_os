; DESCRIPTION: Renders a purple circular shape at (276, 167) with radius 30.
; PLAN: r0=276(x), r1=167(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 167
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

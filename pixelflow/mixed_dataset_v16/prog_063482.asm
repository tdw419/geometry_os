; DESCRIPTION: Draws a red circle centered at (334, 147) with radius 71.
; PLAN: r0=334(x), r1=147(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 147
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

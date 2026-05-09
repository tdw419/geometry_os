; DESCRIPTION: Draws a red circle centered at (358, 104) with radius 62.
; PLAN: r0=358(x), r1=104(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 104
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

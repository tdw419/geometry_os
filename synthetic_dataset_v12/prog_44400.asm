; DESCRIPTION: Draws a red circle centered at (172, 75) with radius 14.
; PLAN: r0=172(x), r1=75(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 75
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

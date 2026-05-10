; DESCRIPTION: Draws a red circle centered at (112, 85) with radius 31.
; PLAN: r0=112(x), r1=85(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 85
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

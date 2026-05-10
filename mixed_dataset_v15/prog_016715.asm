; DESCRIPTION: Draws a red circle centered at (158, 79) with radius 47.
; PLAN: r0=158(x), r1=79(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 79
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

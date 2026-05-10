; DESCRIPTION: Draws a red circle centered at (43, 85) with radius 12.
; PLAN: r0=43(x), r1=85(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 85
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

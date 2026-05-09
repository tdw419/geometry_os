; DESCRIPTION: Draws a red circle centered at (211, 185) with radius 38.
; PLAN: r0=211(x), r1=185(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 185
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

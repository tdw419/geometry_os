; DESCRIPTION: Draws a red circle centered at (97, 185) with radius 51.
; PLAN: r0=97(x), r1=185(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 185
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

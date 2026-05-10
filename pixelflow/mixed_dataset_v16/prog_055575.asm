; DESCRIPTION: Draws a red circle centered at (159, 217) with radius 29.
; PLAN: r0=159(x), r1=217(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 217
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

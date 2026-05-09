; DESCRIPTION: Draws a red circle centered at (105, 26) with radius 11.
; PLAN: r0=105(x), r1=26(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 26
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

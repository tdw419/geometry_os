; DESCRIPTION: Draws a red circle centered at (105, 137) with radius 12.
; PLAN: r0=105(x), r1=137(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 137
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

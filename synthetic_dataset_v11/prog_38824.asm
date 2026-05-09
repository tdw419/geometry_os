; DESCRIPTION: Draws a red circle centered at (12, 122) with radius 11.
; PLAN: r0=12(x), r1=122(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 12
LDI r1, 122
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

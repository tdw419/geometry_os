; DESCRIPTION: Draws a red circle centered at (203, 69) with radius 31.
; PLAN: r0=203(x), r1=69(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 69
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

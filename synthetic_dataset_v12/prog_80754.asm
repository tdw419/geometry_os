; DESCRIPTION: Draws a red circle centered at (208, 100) with radius 69.
; PLAN: r0=208(x), r1=100(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 100
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

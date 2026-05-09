; DESCRIPTION: Draws a red circle centered at (76, 134) with radius 69.
; PLAN: r0=76(x), r1=134(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 134
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

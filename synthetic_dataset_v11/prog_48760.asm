; DESCRIPTION: Draws a red circle centered at (71, 76) with radius 35.
; PLAN: r0=71(x), r1=76(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 76
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (244, 101) with radius 71.
; PLAN: r0=244(x), r1=101(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 101
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

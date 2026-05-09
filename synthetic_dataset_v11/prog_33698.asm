; DESCRIPTION: Draws a red circle centered at (65, 123) with radius 26.
; PLAN: r0=65(x), r1=123(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 123
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

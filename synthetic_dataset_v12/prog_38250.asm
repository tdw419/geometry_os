; DESCRIPTION: Draws a red circle centered at (110, 114) with radius 62.
; PLAN: r0=110(x), r1=114(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 114
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

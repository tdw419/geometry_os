; DESCRIPTION: Draws a red circle centered at (98, 158) with radius 34.
; PLAN: r0=98(x), r1=158(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 158
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

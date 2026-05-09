; DESCRIPTION: Draws a red circle centered at (91, 102) with radius 73.
; PLAN: r0=91(x), r1=102(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 102
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

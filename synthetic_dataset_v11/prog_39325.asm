; DESCRIPTION: Draws a red circle centered at (91, 141) with radius 74.
; PLAN: r0=91(x), r1=141(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 141
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

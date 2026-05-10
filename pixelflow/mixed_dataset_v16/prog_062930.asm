; DESCRIPTION: Draws a red circle centered at (117, 181) with radius 54.
; PLAN: r0=117(x), r1=181(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 181
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

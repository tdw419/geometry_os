; DESCRIPTION: Draws a red circle centered at (6, 163) with radius 38.
; PLAN: r0=6(x), r1=163(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 6
LDI r1, 163
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

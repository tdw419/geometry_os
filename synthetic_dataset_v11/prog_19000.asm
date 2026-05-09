; DESCRIPTION: Draws a red circle centered at (68, 60) with radius 51.
; PLAN: r0=68(x), r1=60(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 60
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a red circle centered at (302, 153) with radius 45.
; PLAN: r0=302(x), r1=153(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 153
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

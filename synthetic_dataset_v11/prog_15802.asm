; DESCRIPTION: Draws a yellow circle centered at (153, 102) with radius 68.
; PLAN: r0=153(x), r1=102(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 102
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

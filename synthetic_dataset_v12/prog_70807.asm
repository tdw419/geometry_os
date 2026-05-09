; DESCRIPTION: Draws a green circle centered at (355, 109) with radius 69.
; PLAN: r0=355(x), r1=109(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 109
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a yellow circle centered at (355, 140) with radius 13.
; PLAN: r0=355(x), r1=140(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 140
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

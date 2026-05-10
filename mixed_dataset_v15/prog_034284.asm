; DESCRIPTION: Draws a yellow circle centered at (71, 91) with radius 69.
; PLAN: r0=71(x), r1=91(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 91
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a yellow circle centered at (169, 67) with radius 40.
; PLAN: r0=169(x), r1=67(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 67
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

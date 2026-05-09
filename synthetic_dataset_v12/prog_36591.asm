; DESCRIPTION: Draws a yellow circle centered at (67, 69) with radius 46.
; PLAN: r0=67(x), r1=69(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 69
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

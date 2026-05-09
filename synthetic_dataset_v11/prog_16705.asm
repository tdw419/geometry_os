; DESCRIPTION: Draws a yellow circle centered at (152, 117) with radius 69.
; PLAN: r0=152(x), r1=117(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 117
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

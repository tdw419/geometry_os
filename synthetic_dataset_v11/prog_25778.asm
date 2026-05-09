; DESCRIPTION: Draws a yellow circle centered at (178, 152) with radius 69.
; PLAN: r0=178(x), r1=152(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 152
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

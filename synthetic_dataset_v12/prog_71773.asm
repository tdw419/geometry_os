; DESCRIPTION: Draws a yellow circle centered at (203, 207) with radius 33.
; PLAN: r0=203(x), r1=207(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 207
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

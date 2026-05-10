; DESCRIPTION: Draws a yellow circle centered at (56, 170) with radius 55.
; PLAN: r0=56(x), r1=170(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 170
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

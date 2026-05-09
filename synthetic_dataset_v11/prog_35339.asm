; DESCRIPTION: Draws a yellow circle centered at (78, 33) with radius 23.
; PLAN: r0=78(x), r1=33(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 33
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

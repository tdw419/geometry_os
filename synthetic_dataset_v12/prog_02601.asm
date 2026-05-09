; DESCRIPTION: Draws a yellow circle centered at (140, 108) with radius 78.
; PLAN: r0=140(x), r1=108(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 108
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

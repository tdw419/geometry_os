; DESCRIPTION: Draws a yellow circle centered at (451, 161) with radius 29.
; PLAN: r0=451(x), r1=161(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 161
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

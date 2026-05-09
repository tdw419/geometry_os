; DESCRIPTION: Draws a yellow circle centered at (166, 108) with radius 47.
; PLAN: r0=166(x), r1=108(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 108
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

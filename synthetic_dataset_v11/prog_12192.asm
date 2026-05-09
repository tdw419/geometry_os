; DESCRIPTION: Draws a yellow circle centered at (108, 211) with radius 39.
; PLAN: r0=108(x), r1=211(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 211
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

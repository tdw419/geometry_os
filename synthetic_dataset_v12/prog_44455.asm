; DESCRIPTION: Draws a yellow circle centered at (108, 87) with radius 47.
; PLAN: r0=108(x), r1=87(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 87
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

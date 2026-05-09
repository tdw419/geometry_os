; DESCRIPTION: Draws a yellow circle centered at (84, 83) with radius 44.
; PLAN: r0=84(x), r1=83(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 83
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

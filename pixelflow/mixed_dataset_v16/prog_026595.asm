; DESCRIPTION: Draws a yellow circle centered at (21, 170) with radius 39.
; PLAN: r0=21(x), r1=170(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 170
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

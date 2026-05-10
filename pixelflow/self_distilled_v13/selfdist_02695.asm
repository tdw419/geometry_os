; DESCRIPTION: Draws a green circle centered at (28, 19) with radius 44.
; PLAN: r0=28(x), r1=19(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 19
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

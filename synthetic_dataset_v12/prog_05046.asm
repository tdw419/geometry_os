; DESCRIPTION: Draws a green circle centered at (84, 78) with radius 56.
; PLAN: r0=84(x), r1=78(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 78
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

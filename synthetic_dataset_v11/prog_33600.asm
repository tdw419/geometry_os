; DESCRIPTION: Draws a blue circle centered at (151, 91) with radius 46.
; PLAN: r0=151(x), r1=91(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 91
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

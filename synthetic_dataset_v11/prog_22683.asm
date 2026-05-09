; DESCRIPTION: Draws a blue circle centered at (70, 91) with radius 17.
; PLAN: r0=70(x), r1=91(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 91
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

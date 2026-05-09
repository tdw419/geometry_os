; DESCRIPTION: Draws a green circle centered at (160, 217) with radius 17.
; PLAN: r0=160(x), r1=217(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 217
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a green circle centered at (385, 112) with radius 65.
; PLAN: r0=385(x), r1=112(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 112
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a green circle centered at (211, 80) with radius 56.
; PLAN: r0=211(x), r1=80(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 80
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

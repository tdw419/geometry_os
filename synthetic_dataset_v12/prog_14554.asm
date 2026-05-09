; DESCRIPTION: Draws a green circle centered at (350, 213) with radius 33.
; PLAN: r0=350(x), r1=213(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 213
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

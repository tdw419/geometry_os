; DESCRIPTION: Draws a blue circle centered at (450, 144) with radius 17.
; PLAN: r0=450(x), r1=144(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 144
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

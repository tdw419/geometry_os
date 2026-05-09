; DESCRIPTION: Draws a blue circle centered at (91, 208) with radius 37.
; PLAN: r0=91(x), r1=208(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 208
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

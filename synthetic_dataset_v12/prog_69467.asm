; DESCRIPTION: Draws a blue circle centered at (260, 206) with radius 37.
; PLAN: r0=260(x), r1=206(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 206
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

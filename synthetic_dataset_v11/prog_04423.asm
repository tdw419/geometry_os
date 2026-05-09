; DESCRIPTION: Draws a blue circle centered at (126, 94) with radius 43.
; PLAN: r0=126(x), r1=94(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 94
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a blue circle centered at (94, 39) with radius 43.
; PLAN: r0=94(x), r1=39(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 39
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

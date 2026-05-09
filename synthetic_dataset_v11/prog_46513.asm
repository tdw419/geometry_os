; DESCRIPTION: Draws a blue circle centered at (43, 71) with radius 28.
; PLAN: r0=43(x), r1=71(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 71
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

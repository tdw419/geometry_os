; DESCRIPTION: Draws a blue circle centered at (213, 54) with radius 28.
; PLAN: r0=213(x), r1=54(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 54
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

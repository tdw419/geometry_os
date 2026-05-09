; DESCRIPTION: Draws a blue circle centered at (118, 133) with radius 47.
; PLAN: r0=118(x), r1=133(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 133
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

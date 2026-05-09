; DESCRIPTION: Draws a blue circle centered at (229, 133) with radius 36.
; PLAN: r0=229(x), r1=133(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 133
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

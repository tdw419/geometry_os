; DESCRIPTION: Draws a blue circle centered at (171, 169) with radius 22.
; PLAN: r0=171(x), r1=169(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 169
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

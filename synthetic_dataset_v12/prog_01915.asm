; DESCRIPTION: Draws a blue circle centered at (223, 152) with radius 36.
; PLAN: r0=223(x), r1=152(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 152
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a blue circle centered at (395, 112) with radius 56.
; PLAN: r0=395(x), r1=112(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 112
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a blue circle centered at (192, 77) with radius 72.
; PLAN: r0=192(x), r1=77(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 77
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

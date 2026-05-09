; DESCRIPTION: Draws a blue circle centered at (77, 77) with radius 60.
; PLAN: r0=77(x), r1=77(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 77
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

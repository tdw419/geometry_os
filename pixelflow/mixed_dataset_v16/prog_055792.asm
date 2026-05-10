; DESCRIPTION: Draws a blue circle centered at (428, 80) with radius 26.
; PLAN: r0=428(x), r1=80(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 80
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

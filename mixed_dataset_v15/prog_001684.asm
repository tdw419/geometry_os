; DESCRIPTION: Draws a blue circle centered at (275, 95) with radius 70.
; PLAN: r0=275(x), r1=95(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 95
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a yellow circle centered at (353, 180) with radius 66.
; PLAN: r0=353(x), r1=180(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 180
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

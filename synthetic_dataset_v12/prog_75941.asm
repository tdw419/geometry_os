; DESCRIPTION: Draws a yellow circle centered at (145, 141) with radius 70.
; PLAN: r0=145(x), r1=141(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 141
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

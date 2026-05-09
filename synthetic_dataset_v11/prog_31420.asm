; DESCRIPTION: Draws a yellow circle centered at (172, 200) with radius 36.
; PLAN: r0=172(x), r1=200(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 200
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

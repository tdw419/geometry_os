; DESCRIPTION: Draws a yellow circle centered at (200, 77) with radius 43.
; PLAN: r0=200(x), r1=77(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 77
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a yellow circle centered at (129, 180) with radius 31.
; PLAN: r0=129(x), r1=180(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 180
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a purple circle centered at (129, 94) with radius 27.
; PLAN: r0=129(x), r1=94(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 94
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

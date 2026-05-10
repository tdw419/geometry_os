; DESCRIPTION: Draws a purple circle centered at (372, 54) with radius 44.
; PLAN: r0=372(x), r1=54(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 54
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

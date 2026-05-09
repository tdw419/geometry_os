; DESCRIPTION: Draws a black circle centered at (124, 80) with radius 78.
; PLAN: r0=124(x), r1=80(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 80
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

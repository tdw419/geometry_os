; DESCRIPTION: Draws a black circle centered at (389, 54) with radius 36.
; PLAN: r0=389(x), r1=54(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 54
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

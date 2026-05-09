; DESCRIPTION: Draws a yellow circle centered at (315, 139) with radius 52.
; PLAN: r0=315(x), r1=139(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 139
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

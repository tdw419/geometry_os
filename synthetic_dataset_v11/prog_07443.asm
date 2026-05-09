; DESCRIPTION: Draws a yellow circle centered at (206, 119) with radius 15.
; PLAN: r0=206(x), r1=119(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 119
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

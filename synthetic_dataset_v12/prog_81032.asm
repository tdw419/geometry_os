; DESCRIPTION: Draws a yellow circle centered at (387, 136) with radius 14.
; PLAN: r0=387(x), r1=136(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 136
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

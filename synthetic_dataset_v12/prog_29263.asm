; DESCRIPTION: Draws a purple circle centered at (333, 145) with radius 48.
; PLAN: r0=333(x), r1=145(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 145
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

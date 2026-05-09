; DESCRIPTION: Draws a yellow circle centered at (84, 215) with radius 40.
; PLAN: r0=84(x), r1=215(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 215
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

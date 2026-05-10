; DESCRIPTION: Draws a yellow circle centered at (370, 2) with radius 48.
; PLAN: r0=370(x), r1=2(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 2
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

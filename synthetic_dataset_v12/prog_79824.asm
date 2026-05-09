; DESCRIPTION: Draws a yellow circle centered at (36, 60) with radius 21.
; PLAN: r0=36(x), r1=60(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 60
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a yellow circle centered at (60, 160) with radius 12.
; PLAN: r0=60(x), r1=160(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 160
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

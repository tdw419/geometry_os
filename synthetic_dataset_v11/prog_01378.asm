; DESCRIPTION: Draws a yellow circle centered at (95, 60) with radius 17.
; PLAN: r0=95(x), r1=60(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 60
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

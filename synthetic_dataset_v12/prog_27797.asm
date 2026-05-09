; DESCRIPTION: Draws a yellow circle centered at (430, 121) with radius 10.
; PLAN: r0=430(x), r1=121(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 121
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

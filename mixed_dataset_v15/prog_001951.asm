; DESCRIPTION: Draws a yellow circle centered at (270, 154) with radius 41.
; PLAN: r0=270(x), r1=154(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 154
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

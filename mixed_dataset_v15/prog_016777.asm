; DESCRIPTION: Draws a yellow circle centered at (229, 151) with radius 41.
; PLAN: r0=229(x), r1=151(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 151
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

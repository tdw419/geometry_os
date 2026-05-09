; DESCRIPTION: Draws a yellow circle centered at (168, 41) with radius 34.
; PLAN: r0=168(x), r1=41(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 41
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

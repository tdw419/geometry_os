; DESCRIPTION: Draws a yellow circle centered at (210, 180) with radius 41.
; PLAN: r0=210(x), r1=180(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 180
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

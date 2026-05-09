; DESCRIPTION: Draws a cyan circle centered at (41, 165) with radius 36.
; PLAN: r0=41(x), r1=165(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 165
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

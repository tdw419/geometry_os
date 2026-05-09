; DESCRIPTION: Draws a cyan circle centered at (427, 157) with radius 41.
; PLAN: r0=427(x), r1=157(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 157
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

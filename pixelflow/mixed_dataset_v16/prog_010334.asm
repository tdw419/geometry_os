; DESCRIPTION: Draws a cyan circle centered at (87, 101) with radius 41.
; PLAN: r0=87(x), r1=101(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 101
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

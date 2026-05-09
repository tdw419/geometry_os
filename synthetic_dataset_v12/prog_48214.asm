; DESCRIPTION: Draws a orange circle centered at (264, 126) with radius 41.
; PLAN: r0=264(x), r1=126(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 126
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

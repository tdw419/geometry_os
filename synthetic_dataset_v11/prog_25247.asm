; DESCRIPTION: Draws a orange circle centered at (217, 41) with radius 28.
; PLAN: r0=217(x), r1=41(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 41
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

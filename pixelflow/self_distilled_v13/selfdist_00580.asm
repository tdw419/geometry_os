; DESCRIPTION: Draws a orange circle centered at (362, 111) with radius 41.
; PLAN: r0=362(x), r1=111(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 111
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

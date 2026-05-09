; DESCRIPTION: Draws a black circle centered at (401, 125) with radius 41.
; PLAN: r0=401(x), r1=125(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 125
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

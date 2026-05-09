; DESCRIPTION: Draws a white circle centered at (197, 41) with radius 21.
; PLAN: r0=197(x), r1=41(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 41
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

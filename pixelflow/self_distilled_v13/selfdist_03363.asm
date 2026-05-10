; DESCRIPTION: Renders a white rectangular region spanning 100 by 83 at (41, 58).
; PLAN: r0=41(x), r1=58(y), r2=100(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 58
LDI r2, 100
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

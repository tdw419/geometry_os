; DESCRIPTION: Draws a white rectangle at (53, 147) with width 41 and height 98.
; PLAN: r0=53(x), r1=147(y), r2=41(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 147
LDI r2, 41
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

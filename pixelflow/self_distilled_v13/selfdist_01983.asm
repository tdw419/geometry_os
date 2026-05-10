; DESCRIPTION: Draws a white rectangle at (72, 72) with width 38 and height 41.
; PLAN: r0=72(x), r1=72(y), r2=38(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 72
LDI r2, 38
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

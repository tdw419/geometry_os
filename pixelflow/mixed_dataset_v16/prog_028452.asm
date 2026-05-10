; DESCRIPTION: Draws a white rectangle at (142, 118) with width 47 and height 41.
; PLAN: r0=142(x), r1=118(y), r2=47(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 118
LDI r2, 47
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

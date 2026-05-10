; DESCRIPTION: Draws a white rectangle at (41, 48) with width 107 and height 72.
; PLAN: r0=41(x), r1=48(y), r2=107(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 48
LDI r2, 107
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

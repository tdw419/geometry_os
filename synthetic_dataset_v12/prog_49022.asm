; DESCRIPTION: Draws a white rectangle at (223, 114) with width 41 and height 113.
; PLAN: r0=223(x), r1=114(y), r2=41(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 114
LDI r2, 41
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

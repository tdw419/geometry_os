; DESCRIPTION: Draws a white rectangle at (501, 41) with width 10 and height 44.
; PLAN: r0=501(x), r1=41(y), r2=10(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 41
LDI r2, 10
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

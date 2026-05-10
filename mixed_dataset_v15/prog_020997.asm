; DESCRIPTION: Draws a white rectangle at (68, 41) with width 52 and height 67.
; PLAN: r0=68(x), r1=41(y), r2=52(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 41
LDI r2, 52
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

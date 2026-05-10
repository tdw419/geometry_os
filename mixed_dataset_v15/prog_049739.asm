; DESCRIPTION: Draws a white rectangle at (100, 124) with width 41 and height 67.
; PLAN: r0=100(x), r1=124(y), r2=41(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 124
LDI r2, 41
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

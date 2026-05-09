; DESCRIPTION: Draws a cyan rectangle at (41, 67) with width 119 and height 100.
; PLAN: r0=41(x), r1=67(y), r2=119(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 67
LDI r2, 119
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

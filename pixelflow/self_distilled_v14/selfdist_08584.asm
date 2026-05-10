; DESCRIPTION: Draws a yellow rectangle at (352, 67) with width 41 and height 38.
; PLAN: r0=352(x), r1=67(y), r2=41(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 67
LDI r2, 41
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

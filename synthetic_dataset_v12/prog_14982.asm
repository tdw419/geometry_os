; DESCRIPTION: Draws a orange rectangle at (130, 122) with width 95 and height 68.
; PLAN: r0=130(x), r1=122(y), r2=95(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 122
LDI r2, 95
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

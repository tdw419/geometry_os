; DESCRIPTION: Draws a orange rectangle at (26, 67) with width 84 and height 74.
; PLAN: r0=26(x), r1=67(y), r2=84(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 67
LDI r2, 84
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

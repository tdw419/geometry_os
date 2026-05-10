; DESCRIPTION: Draws a orange rectangle at (118, 67) with width 37 and height 11.
; PLAN: r0=118(x), r1=67(y), r2=37(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 67
LDI r2, 37
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

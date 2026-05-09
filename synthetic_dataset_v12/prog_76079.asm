; DESCRIPTION: Draws a orange rectangle at (243, 14) with width 67 and height 62.
; PLAN: r0=243(x), r1=14(y), r2=67(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 14
LDI r2, 67
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

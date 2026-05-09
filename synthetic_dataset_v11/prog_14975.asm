; DESCRIPTION: Draws a orange rectangle at (158, 28) with width 72 and height 39.
; PLAN: r0=158(x), r1=28(y), r2=72(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 28
LDI r2, 72
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

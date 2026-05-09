; DESCRIPTION: Draws a orange rectangle at (24, 139) with width 56 and height 15.
; PLAN: r0=24(x), r1=139(y), r2=56(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 139
LDI r2, 56
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

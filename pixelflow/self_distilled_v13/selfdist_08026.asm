; DESCRIPTION: Draws a orange rectangle at (122, 90) with width 21 and height 35.
; PLAN: r0=122(x), r1=90(y), r2=21(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 90
LDI r2, 21
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (170, 35) with width 47 and height 28.
; PLAN: r0=170(x), r1=35(y), r2=47(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 35
LDI r2, 47
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

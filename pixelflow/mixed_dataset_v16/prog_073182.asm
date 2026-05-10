; DESCRIPTION: Draws a orange rectangle at (151, 175) with width 38 and height 25.
; PLAN: r0=151(x), r1=175(y), r2=38(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 175
LDI r2, 38
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

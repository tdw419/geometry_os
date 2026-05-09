; DESCRIPTION: Draws a orange rectangle at (240, 1) with width 113 and height 99.
; PLAN: r0=240(x), r1=1(y), r2=113(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 1
LDI r2, 113
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

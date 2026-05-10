; DESCRIPTION: Draws a orange rectangle at (332, 121) with width 40 and height 35.
; PLAN: r0=332(x), r1=121(y), r2=40(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 121
LDI r2, 40
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

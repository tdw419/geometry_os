; DESCRIPTION: Draws a orange rectangle at (485, 135) with width 15 and height 117.
; PLAN: r0=485(x), r1=135(y), r2=15(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 135
LDI r2, 15
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

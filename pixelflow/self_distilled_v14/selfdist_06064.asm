; DESCRIPTION: Draws a orange rectangle at (332, 78) with width 46 and height 11.
; PLAN: r0=332(x), r1=78(y), r2=46(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 78
LDI r2, 46
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

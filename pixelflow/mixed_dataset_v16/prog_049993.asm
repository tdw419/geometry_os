; DESCRIPTION: Draws a orange rectangle at (330, 29) with width 46 and height 88.
; PLAN: r0=330(x), r1=29(y), r2=46(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 29
LDI r2, 46
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

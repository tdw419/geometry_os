; DESCRIPTION: Draws a orange rectangle at (424, 108) with width 51 and height 88.
; PLAN: r0=424(x), r1=108(y), r2=51(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 108
LDI r2, 51
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

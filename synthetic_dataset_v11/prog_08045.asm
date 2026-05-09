; DESCRIPTION: Draws a orange rectangle at (219, 113) with width 18 and height 88.
; PLAN: r0=219(x), r1=113(y), r2=18(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 113
LDI r2, 18
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

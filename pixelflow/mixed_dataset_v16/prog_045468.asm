; DESCRIPTION: Draws a red rectangle at (219, 52) with width 69 and height 84.
; PLAN: r0=219(x), r1=52(y), r2=69(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 52
LDI r2, 69
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

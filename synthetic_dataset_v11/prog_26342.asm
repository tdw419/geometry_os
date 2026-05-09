; DESCRIPTION: Draws a orange rectangle at (29, 198) with width 89 and height 13.
; PLAN: r0=29(x), r1=198(y), r2=89(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 198
LDI r2, 89
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

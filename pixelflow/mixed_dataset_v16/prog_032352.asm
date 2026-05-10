; DESCRIPTION: Draws a orange rectangle at (350, 119) with width 43 and height 95.
; PLAN: r0=350(x), r1=119(y), r2=43(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 119
LDI r2, 43
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

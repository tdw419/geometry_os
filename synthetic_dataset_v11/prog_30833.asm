; DESCRIPTION: Draws a orange rectangle at (135, 132) with width 83 and height 43.
; PLAN: r0=135(x), r1=132(y), r2=83(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 132
LDI r2, 83
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

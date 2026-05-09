; DESCRIPTION: Draws a orange rectangle at (63, 38) with width 49 and height 84.
; PLAN: r0=63(x), r1=38(y), r2=49(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 38
LDI r2, 49
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
